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

@WebServlet("/MyBoardServlet")
public class MyBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String sql = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		Oracle vv = new Oracle();
		
		Connection conn = null;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, vv.getUserId(), vv.getUserPw());
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String id = (String)session.getAttribute("id");
		
		
		int pageNo = 1;
		if(request.getParameter("page") != null) {
			pageNo = Integer.parseInt(request.getParameter("page"));
		}
		int pageSize = 10;
		int num1 = 1+pageSize*(pageNo-1);
		int num2 = pageSize*pageNo;
		int pageStart = (pageNo%pageSize==0) ? pageNo - (pageSize-1) : pageNo - (pageNo%pageSize-1);
		int pageEnd = pageStart + (pageSize-1);
		
		ArrayList<CommunityVo>list = new ArrayList<CommunityVo>();
		
		sql = "select * from (select rownum rnum, c.* from(select * from community c, community_category cc where cc.cno = c.category_number and writer = ? order by bno desc)c)where rnum between ? and ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, num1);
			pstmt.setInt(3, num2);
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
				CommunityVo c = new CommunityVo(bno, category, title, content, fileName, writer, date, hitcount);
				list.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		int count = 0;
		sql = "select count(*) from community where writer = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		int pageTotal = count / pageSize + (count%pageSize == 0 ? 0 : 1);
		
		RequestDispatcher rd = request.getRequestDispatcher("MyBoard.jsp");
		request.setAttribute("list", list);
		request.setAttribute("pageNo", pageNo);
		request.setAttribute("pageStart", pageStart);
		request.setAttribute("pageEnd", pageEnd);
		request.setAttribute("pageTotal", pageTotal);
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
