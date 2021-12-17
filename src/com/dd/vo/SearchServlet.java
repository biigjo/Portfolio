package com.dd.vo;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.mail.Session;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		int option = Integer.parseInt(request.getParameter("selectop"));
		String searchCtt = request.getParameter("search");
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
		ArrayList<CommunityVo> cList = new ArrayList<CommunityVo>();
		int pageSize = 10;
		int pageNo = 1;
		boolean a = true; 	// a는 제목과 작성자 구분
		boolean b = true;	// b는 제목과 내용 구분
		String ctgr = (String)session.getAttribute("ctgr");
		if(ctgr == null) {
			ctgr = "0";
		}
		
		if(request.getParameter("page")!=null) {
			pageNo = Integer.parseInt(request.getParameter("page"));
		}
		int pn = 0;
		if(ctgr.equals("0")) {
			pn = 3;
			switch(option) {
			case 1:
				try {		// 제목
					PreparedStatement pstmt = conn.prepareStatement("select * from (select rownum rnum, c.* from (select c.*, cc.name from community c, community_category cc where title like ? and name != '댕댕이자랑방' and cc.cno = c.category_number order by bno desc) c) where rnum>=? and rnum<=?");
					pstmt.setString(1, ("%"+searchCtt+"%"));
					pstmt.setInt(2, (1 + pageSize*(pageNo-1)));
					pstmt.setInt(3, (pageSize*pageNo));
					ResultSet rs = pstmt.executeQuery();
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
				} catch(SQLException e) {
					e.printStackTrace();
				}
				break;
			case 2:			// 제목 내용
				try {
					a = false;
					/* if(request.getParameter("page")!=null) {
						pageNo = Integer.parseInt(request.getParameter("page"));
					}*/
					PreparedStatement pstmt = conn.prepareStatement("select * from (select rownum rnum, c.* from (select c.*, cc.name from community c, community_category cc where (title like ? or content like ?) and name != '댕댕이자랑방' and cc.cno = c.category_number order by bno desc) c) where rnum>=? and rnum<=?");
					pstmt.setString(1, ("%"+searchCtt+"%"));
					pstmt.setString(2, ("%"+searchCtt+"%"));
					pstmt.setInt(3, (1 + pageSize*(pageNo-1)));
					pstmt.setInt(4, (pageSize*pageNo));
					ResultSet rs = pstmt.executeQuery();
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
				} catch(SQLException e) {
					e.printStackTrace();
				}
				break;
			case 3:
				try {			// 작성자	
					b = false;
					PreparedStatement pstmt = conn.prepareStatement("select * from (select rownum rnum, c.* from (select c.*, cc.name from community c, community_category cc where cc.cno = c.category_number and writer like ? and name != '댕댕이자랑방' order by bno desc) c) where rnum>=? and rnum<=?");
					pstmt.setString(1, ("%"+searchCtt+"%"));
					pstmt.setInt(2, (1 + pageSize*(pageNo-1)));
					pstmt.setInt(3, (pageSize*pageNo));
					ResultSet rs = pstmt.executeQuery();
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
				} catch(SQLException e) {
					e.printStackTrace();
				}
				break;
			}
		} else {
			pn = 4;
			switch(option) {
				case 1: 
					String sql = "select * from (select rownum rnum, c.* from (select * from community c, community_category cc where category_number = ? and title like ? and c.category_number = cc.cno order by c.bno desc)c)where rnum between ? and ?";
					try {
						PreparedStatement pstmt = conn.prepareStatement(sql);
						pstmt.setInt(1, Integer.parseInt(ctgr));
						pstmt.setString(2, "%"+searchCtt+"%");
						pstmt.setInt(3, 1+pageSize*(pageNo-1));
						pstmt.setInt(4, pageSize*pageNo);
						ResultSet rs = pstmt.executeQuery();
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
					} catch (SQLException e) {
						e.printStackTrace();
					}
					break;
				case 2:
					a = false;
					sql = "select * from (select rownum rnum, c.* from (select c.*, cc.name from community c, community_category cc where (title like ? or content like ?) and category_number = ? and c.category_number = cc.cno order by c.bno desc)c)where rnum between ? and ?";
					try {
						PreparedStatement pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, "%"+searchCtt+"%");
						pstmt.setString(2, "%"+searchCtt+"%");
						pstmt.setInt(3, Integer.parseInt(ctgr));
						pstmt.setInt(4, 1+pageSize*(pageNo-1));
						pstmt.setInt(5, pageSize*pageNo);
						ResultSet rs = pstmt.executeQuery();
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
					} catch (SQLException e) {
						e.printStackTrace();
					}
					break;
				case 3:
					b = false;
					sql = "select * from (select rownum rnum, c.* from (select * from community c, community_category cc where category_number = ? and writer like ? and c.category_number = cc.cno order by c.bno desc)c)where rnum between ? and ?";
					try {
						PreparedStatement pstmt = conn.prepareStatement(sql);
						pstmt.setInt(1, Integer.parseInt(ctgr));
						pstmt.setString(2, "%"+searchCtt+"%");
						pstmt.setInt(3, 1+pageSize*(pageNo-1));
						pstmt.setInt(4, pageSize*pageNo);
						ResultSet rs = pstmt.executeQuery();
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
					} catch (SQLException e) {
						e.printStackTrace();
					}
					break;
			}
		}
		
		
		int count = 0;
		if(ctgr.equals("0")) {
			try {
				PreparedStatement pstmt = conn.prepareStatement("select count(*) from community where category_number != 6 and " + (b ? (a ? "title like ?" : "title like ? or content like ?") : ("writer like ?")));
				if(a) {
					pstmt.setString(1, ("%"+searchCtt+"%"));
				} else {
					pstmt.setString(1, ("%"+searchCtt+"%"));
					pstmt.setString(2, ("%"+searchCtt+"%"));
				}
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()) {
					count = rs.getInt(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else {
			try {
				PreparedStatement pstmt = conn.prepareStatement("select count(*) from community where category_number = ? and " + (b ? (a ? "title like ?" : "(title like ? or content like ?)") : ("writer like ?")));
				
				System.out.println("제발좀");
				if(a) {
					pstmt.setInt(1, Integer.parseInt(ctgr));
					pstmt.setString(2, ("%"+searchCtt+"%"));
				} else {
					pstmt.setInt(1, Integer.parseInt(ctgr));
					pstmt.setString(2, ("%"+searchCtt+"%"));
					pstmt.setString(3, ("%"+searchCtt+"%"));
				}
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()) {
					count = rs.getInt(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} System.out.println(count);
		int pageTotal = count / pageSize + (count%pageSize == 0 ? 0 : 1);
		System.out.println("페이지 토탈 값은 : " + pageTotal);
		System.out.println("pageNo : " + pageNo);
		System.out.println("pageSize : " + pageSize);
		RequestDispatcher rd = request.getRequestDispatcher("Community.jsp");
		request.setAttribute("pageNo", pageNo);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("pageTotal", pageTotal);
		request.setAttribute("clist", cList);
		request.setAttribute("ctgr", ctgr);
		request.setAttribute("pn", pn);
		request.setAttribute("option", option);
		request.setAttribute("searchCtt", searchCtt);
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
