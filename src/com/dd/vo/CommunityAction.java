package com.dd.vo;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dd.vo.*;
@WebServlet("/CommunityAction")
public class CommunityAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		Connection conn = null;
		
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		Oracle vv = new Oracle();
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, vv.getUserId(), vv.getUserPw());
		} catch(ClassNotFoundException e) {
			e.printStackTrace();
		} catch(SQLException e) {
			e.printStackTrace();
		}
			
		int pageNo = 1;			// 페이징 처리 하기 위한 변수 현재 페이지 계산
		int pageSize = 10;		// 한 페이지에 나올 사이즈를 결정
		ArrayList<CommunityVo> cList = new ArrayList<CommunityVo>();	// 게시판 db내용 담을 list
		PreparedStatement pstmt;
		ResultSet rs;
		String ctgr = request.getParameter("ctgr");		// 카테고리 파라미터 받아올 변수
		session.setAttribute("ctgr", ctgr);
		if(ctgr == null) {
			ctgr = "0";
		}
		
		if(request.getParameter("page")!=null) {		// 페이징 처리 현재 페이지에 값을 변경하기 위한 조건문 = 파라미터로 온 페이지 값이 null아닐경우 그 파라미터에 문자열을 int로 형변환하여 넣어줌
			pageNo = Integer.parseInt(request.getParameter("page"));
			
		}
		int pn = 0;
		boolean choice = true;	// 카테고리 카운트 삼항연산자 쓰기위한 불린타입 변수
		try {
			if(ctgr.equals("0")) {// 파라미터를 담은 ctgr 변수가 null일 경우 밑에 sql 실행 게시판에 전체글을 가져옴
				pn = 1;
				pstmt = conn.prepareStatement("select * from (select rownum rnum, c.* from (select c.*, cc.name from community c, community_category cc where c.category_number = cc.cno  and name != '댕댕이자랑방' order by bno desc) c) where rnum >= ? and rnum <=?");
				pstmt.setInt(1, (1 + pageSize*(pageNo-1)));
				pstmt.setInt(2, (pageSize*pageNo));
				rs = pstmt.executeQuery();
				while(rs.next()) {
					int bno = rs.getInt("bno");
					String category = rs.getString("name");
					String title = rs.getString("title");
					String content = rs.getString("content");
					String fileName = rs.getString("file_name");
					String writer = rs.getString("writer");
					String date = rs.getString("writer_date");
					int hitcount = rs.getInt("hitcount");
					CommunityVo vo = new CommunityVo(bno, category, title, content, fileName, writer, date, hitcount);
					cList.add(vo);
				}
				pstmt.close();
				rs.close();
			} else{		// 파라미터를 담은 ctgr 변수가 null이 아닐경우 밑에 sql 실행
										// where 조건에 카테고리 넘버를 입력해야되서 파라미터를 받은 ctgr를 int로 형변환 하여 sql에 쏴줌
										// 즉 파라미터로 받아온 값이 카테고리 넘버이고 그 값을 조회하여 쏴줌
				pn = 2;
				pstmt = conn.prepareStatement("select * from (select rownum rnum, c.* from (select c.*,cc.name from community c, community_category cc where c.category_number = cc.cno and c.category_number = ? and name != '댕댕이자랑방' order by bno desc) c) where rnum>=? and rnum<=?");
				pstmt.setInt(1, Integer.parseInt(ctgr));
				pstmt.setInt(2, (1 + pageSize*(pageNo-1)));
				pstmt.setInt(3, (pageSize*pageNo));
				rs = pstmt.executeQuery();
				choice = false;
				while(rs.next()) {
					int bno = rs.getInt("bno");
					String category = rs.getString("name");
					String title = rs.getString("title");
					String content = rs.getString("content");
					String fileName = rs.getString("file_name");
					String writer = rs.getString("writer");
					String date = rs.getString("writer_date");
					int hitcount = rs.getInt("hitcount");
					CommunityVo vo = new CommunityVo(bno, category, title, content, fileName, writer, date, hitcount);
					cList.add(vo);
					
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		int count = 0;		// 게시판에 총 게시글 수를 받아올 변수
		try {
			pstmt = conn.prepareStatement("select count(*) from community" + (choice ? "" : " where category_number = ?"));
											// 카운트 select 	choice변수는 기본값이 true이며 ctgr변수가 값이 들어가있을경우 false로 바뀐다 즉
											// 여기에 삼항연산자는 true일 경우 공백문자여서 community에 총게시물을 카운트하고 false일경우 where 조건에
											// 게시물을 카운트한다
			if(!choice) {	// where 조건이 들어갈경우 ctgr값을 던져줘야하므로 조건문으로 setString 추가
				pstmt.setString(1, ctgr);
				rs = pstmt.executeQuery();
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {		// 카운트 값 받아옴
				count = rs.getInt("count(*)");
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		int pageTotal = count / pageSize + (count%pageSize==0 ? 0 : 1);		// 총 몇개에 페이지가 있는지 계산하여 그 값을 변수에 받음
		
		RequestDispatcher rd = request.getRequestDispatcher("Community.jsp");
		request.setAttribute("clist", cList);		// ArrayList 쏴줌 
		request.setAttribute("pageNo", pageNo);		// 
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("pageTotal", pageTotal);
		request.setAttribute("ctgr", ctgr);
		request.setAttribute("pn", pn);
		rd.forward(request, response);
	}

}
