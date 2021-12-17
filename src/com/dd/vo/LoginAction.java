package com.dd.vo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String type = null;
		if(request.getParameter("type")!=null) {
			type = request.getParameter("type");
		}	// DaengController?command=MsgReceiveAction&mtype=Receive
		response.setContentType("text/html; charset=utf-8");
		System.out.println(type);
		if(request.getParameter("mtype")!=null) {
			type += "&mtype=" + request.getParameter("mtype");
		}//DaengController?command=MsgReceiveAction
		String sql = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		Oracle vv = new Oracle();
		String url2 = "Home.jsp";
		if(session.getAttribute("url")!=null) {
			url2 = (String)session.getAttribute("url");
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
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		PrintWriter script = response.getWriter();
		
		sql = "select pw from member where id = ?";
		try {
			boolean b = false;
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String dbPw = rs.getString("pw"); 
				if(dbPw.equals(pw))    
					b = true;
				}
				
				if(b) {
					script.println("<script>");
					script.println("alert('"+id+"님 안녕하세요!')");
					session.setAttribute("id", id);
					if(type!=null) {
						script.println("location.href='"+type+"'");
						
													//CommunityWrite.jsp
						script.println("</script>");

					} else {
						if(url2.equals("Home.jsp")) {
							script.println("location.href='"+url2+"'");
							script.println("</script>");
						} else {
							System.out.println("너냐?");
							script.println("location.href='"+url2.substring(18)+"'");
							script.println("</script>");
						}
					}
				} else {
					script.println("<script>");
					script.println("alert('아이디 또는 비밀번호를 확인해주세요.')");
					script.println("location.href='Login.jsp?type="+type+"'");
					script.println("</script>");
				}
			rs.close();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
	}
}
