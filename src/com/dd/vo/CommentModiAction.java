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


@WebServlet("/CommentModiAction")
public class CommentModiAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		Oracle vv = new Oracle();
		int bno = 0;
		if(request.getParameter("bno")!=null) {
			bno = Integer.parseInt(request.getParameter("bno"));
		}
		String content = null;
		if(request.getParameter("content")!=null) {
			content= request.getParameter("content");
		}
		int rnum = 0;
		if(request.getParameter("rnum")!=null) {
			rnum = Integer.parseInt(request.getParameter("rnum"));
		}
		Connection conn = null;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, vv.getUserId(), vv.getUserPw());
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			PreparedStatement pstmt = conn.prepareStatement("update comments set content = ? WHERE ROWID = (SELECT rid FROM (SELECT ROWNUM rn, ROWID rid FROM comments where bno = ?) WHERE rn = ?)");
			pstmt.setString(1, content);
			pstmt.setInt(2, bno);
			pstmt.setInt(3, rnum);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
