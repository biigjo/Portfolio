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

@WebServlet("/BoardView")
public class BoardView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = null;
		
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		Oracle vv = new Oracle();
		int count = 0;
		int pBno = 0;
			pBno = Integer.parseInt(request.getParameter("bno"));
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, vv.getUserId(), vv.getUserPw());
		} catch(ClassNotFoundException e) {
			e.printStackTrace();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		ArrayList<CommunityVo> inList = new ArrayList<CommunityVo>();		// in 들어간다 boardView
		// int bno, String category, String title, String content, String fileName, String writer, String date, int hitcount
		int hitcount = 0;
		try {
			PreparedStatement pstmt = conn.prepareStatement("select c.*, cc.name from community c, community_category cc where cc.cno = c.category_number and bno=?");
			pstmt.setInt(1, pBno);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int bno = rs.getInt("bno");
				String category = rs.getString("name");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String fileName = rs.getString("file_name");
				String writer = rs.getString("writer");
				String date = rs.getString("writer_date");
				hitcount = rs.getInt("hitcount");
				hitcount++;
				CommunityVo vo = new CommunityVo(bno, category, title, content, fileName, writer, date, hitcount);
				inList.add(vo);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		try {
			PreparedStatement pstmt = conn.prepareStatement("update community set hitcount=? where bno=?");
			pstmt.setInt(1, hitcount);
			pstmt.setInt(2, pBno);
			pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		ArrayList<CommentVo> rList = new ArrayList<CommentVo>();
		try {
			PreparedStatement pstmt = conn.prepareStatement("select rownum rnum, c.* from (select * from comments where bno=? order by comment_date asc)c");
			pstmt.setInt(1, pBno);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				String writer = rs.getString("writer");
				String content = rs.getString("content");
				String date = rs.getString("comment_date");
				int rnum = rs.getInt("rnum");
				count++;
				CommentVo vo = new CommentVo(writer, content, date, rnum);
				rList.add(vo);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher("Board.jsp");
		request.setAttribute("inList", inList);
		request.setAttribute("rList", rList);
		request.setAttribute("count", count);
		rd.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
