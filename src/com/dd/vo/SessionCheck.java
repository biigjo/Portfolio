package com.dd.vo;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/SessionCheck")
public class SessionCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		int retNumber2 = -1;
		if(session.getAttribute("id") != null) {
			retNumber2 = 1;
		} else {
			retNumber2 = 0;
		}
		
		
		PrintWriter out = response.getWriter();
		out.println(retNumber2);
		
		String writer = (String)(session.getAttribute("id"));
		System.out.println(writer);
	}

}
