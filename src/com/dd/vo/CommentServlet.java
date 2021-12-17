package com.dd.vo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

@WebServlet("/CommentServlet")
public class CommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/x-json; charset=UTF-8");

		
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		Connection conn = null;
		int bno = Integer.parseInt(request.getParameter("bno"));
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
			PreparedStatement pstmt = conn.prepareStatement("insert into comments(bno,content,writer) values (?, ?, ?)");
			pstmt.setInt(1, bno);
			pstmt.setString(2, content);
			pstmt.setString(3, writer);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		JSONArray list = new JSONArray();
		JSONObject data = new JSONObject();
		ArrayList<CommentVo> rList = new ArrayList<CommentVo>();
		String date = null;
		try {
			PreparedStatement pstmt = conn.prepareStatement("select * from comments where bno=? order by comment_date desc");
			pstmt.setInt(1, bno);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				writer = rs.getString("writer");
				content = rs.getString("content");
				date = rs.getString("comment_date");
				
//				CommentVo vo = new CommentVo(writer, content, date);
			//	rList.add(vo);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		System.out.println(date);
		int rnum = 0;
		try {
			PreparedStatement pstmt = conn.prepareStatement("select rnum from (select rownum rnum, c.* from comments c where bno= ?) where to_char(comment_date, 'YYYY-MM-DD HH24:MI:SS') = ?");
			pstmt.setInt(1, bno);
			pstmt.setString(2, date);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				rnum = rs.getInt("rnum");
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		JSONObject obj = new JSONObject();
		System.out.println("로우넘이다 : " + rnum);
		
		data.put("rnum", rnum);
		data.put("writer",writer);
		data.put("content",content);
		data.put("date",date);
		out.print(data);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
