package com.dd.vo;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CommunityWrite")
public class CommunityWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String writer = (String) session.getAttribute("id");
		String variety = "골든리트리버";
		String fileName = request.getParameter("fileName");
		String category = request.getParameter("category");		// 카테고리
		String title = request.getParameter("title");			// 제목
		String content = request.getParameter("content");		// 내용
		
		
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
		
		try {
			PreparedStatement pstmt = conn.prepareStatement("insert into community (category_number, writer, variety, title, content, file_name, bno) values (?,?,?,?,?,?,SEQ_community.nextval)");			
			pstmt.setInt(1, Integer.parseInt(category));
			pstmt.setString(2, writer);
			pstmt.setString(3, variety);
			pstmt.setString(4, title);
			pstmt.setString(5, content);
			pstmt.setString(6, fileName);
			pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		if(category.equals("6")) {
			response.sendRedirect("DaengController?command=BoardPicAction");
		} else {
			response.sendRedirect("DaengController?command=CommunityAction");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
