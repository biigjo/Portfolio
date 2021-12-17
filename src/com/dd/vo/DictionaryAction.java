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

@WebServlet("/DictionaryAction")
public class DictionaryAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=utf-8");
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
		
		ArrayList<DictionaryVO>list = new ArrayList<DictionaryVO>();
		
		sql ="select * from dictionary"; 
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String file_name = rs.getString(1);
				String variety = rs.getString(2);
				String height = rs.getString(3);
				String weight = rs.getString(4);
				String color = rs.getString(5);
				String lifespan = rs.getString(6);
				String content = rs.getString(7);
				String ancestry = rs.getString(8);
				DictionaryVO d = new DictionaryVO(file_name, variety, height, weight, color, lifespan, content, ancestry);
				list.add(d);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("Dictionary.jsp");
		request.setAttribute("list", list);
		rd.forward(request, response);
		
	}

}
