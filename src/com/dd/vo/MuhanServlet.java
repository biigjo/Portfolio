package com.dd.vo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

@WebServlet("/MuhanServlet")
public class MuhanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		JSONArray list = new JSONArray();		// json 배열 객체 생성
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
		
		int pageNo = Integer.parseInt(request.getParameter("pageNo"));
		//System.out.println(pageNo);
		int pageSize = 9;
		int num1 = 1+pageSize*(pageNo-1);
		int num2 = pageSize*pageNo;
		
		sql = "select * from (select rownum rnum, c.* from(select * from community where category_number = 6 order by bno desc)c)where rnum between ? and ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num1);
			pstmt.setInt(2, num2);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				JSONObject data = new JSONObject();		//json 데이터 객체 생성
				int bno = rs.getInt("bno");
				String category = rs.getString("category_number");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String fileName = rs.getString("file_name");
				String writer = rs.getString("writer");
				String date = rs.getString("writer_date");
				int hitcount = rs.getInt("hitcount");
				
				data.put("bno",bno);
				data.put("writer", writer);
				data.put("fileName", fileName);
				data.put("title", title);
				data.put("date", date);
				list.add(data);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		JSONObject obj = new JSONObject();		// json 오브젝트 객체 생성
		
		obj.put("list", list);
		out.print(obj);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
