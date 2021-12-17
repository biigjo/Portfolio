package com.dd.vo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;


@WebServlet("/DeleteMsg")
public class DeleteMsg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("들어왔당!!!");
		String sql = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		HttpSession session = request.getSession();
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		Oracle vv = new Oracle();
		
		String login = (String)session.getAttribute("id");
		
		Connection conn = null;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, vv.getUserId(), vv.getUserPw());
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		String[] arr = request.getParameterValues("arr[]");
		String mtype = request.getParameter("mtype");
		for(int i=0; i<=arr.length-1; i++) {
			System.out.println(arr[i]);
		}
		
		switch(arr.length) {
		case 1:
			sql = "DELETE FROM message WHERE ROWID in (SELECT rid FROM (SELECT ROWNUM rn, ROWID rid, m.* FROM (select * from message where "+(mtype.equals("Receive") ? "to_name" : "from_name")+" = ? order by msg_date desc) m) WHERE rn = ?)";
			break;
		case 2:
			sql = "DELETE FROM message WHERE ROWID in (SELECT rid FROM (SELECT ROWNUM rn, ROWID rid, m.* FROM (select * from message where "+(mtype.equals("Receive") ? "to_name" : "from_name")+" = ? order by msg_date desc) m) WHERE rn = ? or rn = ?)";
			break;
		case 3:
			sql = "DELETE FROM message WHERE ROWID in (SELECT rid FROM (SELECT ROWNUM rn, ROWID rid, m.* FROM (select * from message where "+(mtype.equals("Receive") ? "to_name" : "from_name")+" = ? order by msg_date desc) m) WHERE rn = ? or rn = ? or rn = ?)";
			break;
		case 4:
			sql = "DELETE FROM message WHERE ROWID in (SELECT rid FROM (SELECT ROWNUM rn, ROWID rid, m.* FROM (select * from message where "+(mtype.equals("Receive") ? "to_name" : "from_name")+" = ? order by msg_date desc) m) WHERE rn = ? or rn = ? or rn = ? or rn = ?)";
			break;
		case 5:
			sql = "DELETE FROM message WHERE ROWID in (SELECT rid FROM (SELECT ROWNUM rn, ROWID rid, m.* FROM (select * from message where "+(mtype.equals("Receive") ? "to_name" : "from_name")+" = ? order by msg_date desc) m) WHERE rn = ? or rn = ? or rn = ? or rn = ? or rn = ?)";
			break;
		}
		
		try {
			System.out.println("무한이야??");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, login);
			switch(arr.length) {
			case 1:
				pstmt.setInt(2, Integer.parseInt(arr[0]));
				break;
			case 2:
				pstmt.setInt(2, Integer.parseInt(arr[0]));
				pstmt.setInt(3, Integer.parseInt(arr[1]));
				break;
			case 3:
				pstmt.setInt(2, Integer.parseInt(arr[0]));
				pstmt.setInt(3, Integer.parseInt(arr[1]));
				pstmt.setInt(4, Integer.parseInt(arr[2]));
				break;
			case 4:
				pstmt.setInt(2, Integer.parseInt(arr[0]));
				pstmt.setInt(3, Integer.parseInt(arr[1]));
				pstmt.setInt(4, Integer.parseInt(arr[2]));
				pstmt.setInt(5, Integer.parseInt(arr[3]));
				break;
			case 5:
				pstmt.setInt(2, Integer.parseInt(arr[0]));
				pstmt.setInt(2, Integer.parseInt(arr[1]));
				pstmt.setInt(2, Integer.parseInt(arr[2]));
				pstmt.setInt(2, Integer.parseInt(arr[3]));
				pstmt.setInt(2, Integer.parseInt(arr[4]));
				break;
			}
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	

		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		JSONObject obj = new JSONObject();
		
		out.println(obj);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
