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
import javax.servlet.http.HttpSession;

@WebServlet("/MsgRServlet")
public class MsgRServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		HttpSession session = request.getSession();
		String myId = (String) session.getAttribute("id");
		String mtype = request.getParameter("mtype"); // Receive
		
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		Oracle vv = new Oracle();
		
		String sql = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		Connection conn = null;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, vv.getUserId(), vv.getUserPw());
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

		ArrayList<MessageVO>list = new ArrayList<MessageVO>();
			sql = "select * from message";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, myId);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					String from_name = rs.getString("from_name");
					String to_name = rs.getString("to_name");
					String content = rs.getString("content");
					String msg_date = rs.getString("msg_date");
					int rnum = rs.getInt("rnum");
					MessageVO m = new MessageVO(from_name, to_name, content, msg_date, rnum);
					list.add(m);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
		RequestDispatcher rd = request.getRequestDispatcher("MsgReceive.jsp");
		request.setAttribute("list", list);
		request.setAttribute("mtype", mtype);
		rd.forward(request, response);
	}

}
