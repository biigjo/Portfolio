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

@WebServlet("/DicAction")
public class DicAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
System.out.println("parameter variety : " + request.getParameter("variety"));

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

		String variety1 = null;
		if(request.getParameter("variety")!=null) {
			variety1 = request.getParameter("variety");
		}
		
		DictionaryVO dVO = null;
		sql ="select * from dictionary where variety = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, variety1);
			rs = pstmt.executeQuery();
			while(rs.next()) {	// 클릭했을때 버튼 있는 테이블에 해당 종 이름 가져오면 끝
				String file_name = rs.getString(1);
				String variety = rs.getString(2);
				String height = rs.getString(3);
				String weight = rs.getString(4);
				String color = rs.getString(5);
				String lifespan = rs.getString(6);
				String content = rs.getString(7);
				String ancestry = rs.getString(8);
				dVO = new DictionaryVO(file_name, variety, height, weight, color, lifespan, content, ancestry);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		RequestDispatcher rd = request.getRequestDispatcher("Dic.jsp");
		request.setAttribute("dVO", dVO);
		rd.forward(request, response);
		
	}

}
