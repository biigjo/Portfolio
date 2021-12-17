package com.dd.vo;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ModifyServlet")
public class ModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sql = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		Oracle vv = new Oracle();
		
		int bno1 = Integer.parseInt(request.getParameter("bno"));
		Connection conn = null;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, vv.getUserId(), vv.getUserPw());
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		CommunityVo vo = null;
		sql = "select c.*, c2.name from community c, community_category c2 where c.bno = ? and c.category_number = c2.cno";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno1);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				int bno = rs.getInt("bno");
				String category = rs.getString("name");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String fileName = rs.getString("file_name");
				String writer = rs.getString("writer");
				String date = rs.getString("writer_date");
				int hitcount = rs.getInt("hitcount");
				vo = new CommunityVo(bno, category, title, content, fileName, writer, date, hitcount);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("CommunityModify.jsp");
		request.setAttribute("vo", vo);
		rd.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
