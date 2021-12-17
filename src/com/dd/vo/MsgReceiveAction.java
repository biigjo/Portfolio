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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MsgReceiveAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		HttpSession session = request.getSession();
		String myId = (String) session.getAttribute("id");		// 나야 나  나는 로그인한사람이겠죠??ㅇㅇ
		String mtype = request.getParameter("mtype"); // Receive
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		Oracle vv = new Oracle();
		System.out.println(mtype);
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
					// 여기까지가 일단 jdbc연동하는곳이고
		int pageNo = 1;
		if(request.getParameter("page")!=null) {
			pageNo = Integer.parseInt(request.getParameter("page"));
		}
		int pageSize = 5;
		int num1 = 1 + pageSize * (pageNo - 1);
		int num2 = pageSize * pageNo;
		int pageStart = (pageNo%pageSize==0) ? pageNo - (pageSize-1) : pageNo - (pageNo%pageSize-1);
		int pageEnd = pageStart + (pageSize-1);
				// 이건 변수 사용하려고 만든거니까 흐름이랑 무시하셔도 무관해여
		
		// 그리고 여기 밑엔데 이프믄이 있죠 해당 조건이면 이코드를 실행하고 그 조건이 아니고 다른 조건이면 이코드에요 그러니까 사실상 두 코드다 실행되는게 아니죠..
		ArrayList<MessageVO>list = new ArrayList<MessageVO>();
		if(mtype.equals("Receive")) {
			sql = "select * from(select rownum rnum, m.* from (select * from message where to_name = ? order by msg_date desc)m) where rnum between ? and ?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, myId);
				pstmt.setInt(2, num1);
				pstmt.setInt(3, num2);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					String from_name = rs.getString("from_name");
					String to_name = rs.getString("from_name");	// 세션으로부터 받아온 변수에 내용이 바뀌지만 기능적으로 상관이 없기에 요렇게 하였음!!! 이거 이제 문제가 되네요 네
					String content = rs.getString("content");
					String msg_date = rs.getString("msg_date");
					int rnum = rs.getInt("rnum");
					MessageVO m = new MessageVO(from_name, to_name, content, msg_date, rnum);
					list.add(m);
				}	
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if(mtype.equals("Send")) {
			sql = "select * from(select rownum rnum, m.* from (select * from message where from_name = ? order by msg_date desc)m) where rnum between ? and ?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, myId);
				pstmt.setInt(2, num1);
				pstmt.setInt(3, num2);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					String from_name = rs.getString("from_name");
					String to_name = rs.getString("to_name");	// 세션으로부터 받아온 변수에 내용이 바뀌지만 기능적으로 상관이 없기에 요렇게 하였음!!!
					String content = rs.getString("content");
					String msg_date = rs.getString("msg_date");
					int rnum = rs.getInt("rnum");
					MessageVO m = new MessageVO(from_name, to_name, content, msg_date, rnum);
					list.add(m);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
			// 변수를 하나씩 더 만들었네요..음 그럼 이프문이 화면단에 있어야겠네요
		
		int count = 0;
		if(mtype.equals("Receive")) {
			sql = "select count(*) from message where to_name = ?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, myId);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					count = rs.getInt(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if (mtype.equals("Send")) {
			sql = "select count(*) from message where from_name = ?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, myId);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					count = rs.getInt(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
		}
		int pageTotal = count / pageSize + (count%pageSize==0 ? 0 : 1);
		RequestDispatcher rd = request.getRequestDispatcher("Message.jsp");
		request.setAttribute("list", list);
		request.setAttribute("mtype", mtype);
		request.setAttribute("pageNo", pageNo);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("pageTotal", pageTotal);
		request.setAttribute("pageStart", pageStart);
		request.setAttribute("pageEnd", pageEnd);
		rd.forward(request, response);
	}
}
