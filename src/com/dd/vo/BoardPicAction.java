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

public class BoardPicAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
response.setContentType("text/html; charset=utf-8");
		
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
		
		int pageNo = 1;
		int pageSize = 9;
		int num1 = 1+pageSize*(pageNo-1);
		int num2 = pageSize*pageNo;
		
		ArrayList<CommunityVo>Alist = new ArrayList<CommunityVo>();
		
		sql = "select * from (select rownum rnum, c.* from(select * from community where category_number = 6 order by bno desc)c)where rnum between ? and ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num1);
			pstmt.setInt(2, num2);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int bno = rs.getInt("bno");
				String category = rs.getString("category_number");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String fileName = rs.getString("file_name");
				String writer = rs.getString("writer");
				String date = rs.getString("writer_date");
				int hitcount = rs.getInt("hitcount");
				CommunityVo c = new CommunityVo(bno, category, title, content, fileName, writer, date, hitcount);
				Alist.add(c);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("BoardPic.jsp");
		request.setAttribute("Alist", Alist);
		rd.forward(request, response);
		
	}

}
