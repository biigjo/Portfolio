package com.dd.vo;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dd.vo.Action;
import com.dd.vo.ActionFactory;

@WebServlet("/DaengController")
public class DaengController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		
		String command = request.getParameter("command");
		ActionFactory af = ActionFactory.getInstance();
		
		Action action = af.getAction(command);	// MsgWriteAction
		// Action action = new MsgWriteAction();
		//[정리] 인터페이스 타입의 참조변수는
		//		해당 인터페이스(Action)를 구현한 클래스 (ResultAction 등)의 객체를 참조 할 수 있음(가리킬 수 있음).
		if(action != null)
			action.execute(request, response);
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		
		String command = request.getParameter("command");
		ActionFactory af = ActionFactory.getInstance();
		System.out.println(request.getParameter("type"));
		Action action = af.getAction(command);
		// Action action = new ResultAction();
		//[정리] 인터페이스 타입의 참조변수는
		//		해당 인터페이스(Action)를 구현한 클래스 (ResultAction 등)의 객체를 참조 할 수 있음(가리킬 수 있음).
		if(action != null)
			action.execute(request, response);
	}

}
