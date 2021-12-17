package com.dd.vo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

@WebServlet("/FindServlet")
public class FindServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); 
		
		Connection conn = null;
		String sql = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
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
		
		
		String id1 = request.getParameter("id1");	// 입력 받은 값
		String name1 = request.getParameter("name1");
		String email1 = request.getParameter("email1");
		
		int retNumber = -1;
		String id = null;		// 디비 아이디
		sql = "select id from member where name = ? and email = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name1);
			pstmt.setString(2, email1);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				retNumber = 1;				// true 해당하는 아이디가 있다면 1, 없다면 0
				id = rs.getString("id");	//컬럼명 
			} else {
				retNumber = 0;
			}
			pstmt.close();
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		int retNumber1 = -1;
		
		String pw = null;		// 디비 비밀번호
		sql = "select pw from member where id = ? and name= ? and email= ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id1);
			pstmt.setString(2, name1);
			pstmt.setString(3, email1);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				retNumber1 = 1;
			} else {
				retNumber1 = 0;
			}
			pstmt.close();
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		Random ran = new Random();
		String value = "";
		for(int i = 0; i <=3; i++) {
			int num = (int) 48 + (int)(ran.nextDouble()*9)+1;
			int num2 = (int) 97 + (int)(ran.nextDouble()*25)+1;
			value = value + (char)num + (char)num2;
		}
		if(retNumber1==1) {
			sql = "update member set pw = ? where id = ?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, value);
				pstmt.setString(2, id);
				pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			String msg = "당신의 비밀번호는 "+value+"입니다.";
			Mail m = new Mail();
			m.naverMailSend(email1, msg);
		}
		
		
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		JSONObject obj = new JSONObject();
		
		obj.put("FindId", retNumber);
		obj.put("id", id);	// 변수명
		
		obj.put("FindPw", retNumber1);
		out.print(obj);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
