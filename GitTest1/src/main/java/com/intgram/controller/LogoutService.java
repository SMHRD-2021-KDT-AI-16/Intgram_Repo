package com.intgram.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet("/LogoutService")
public class LogoutService extends HttpServlet {
	private static final long serialVersionUID = 1L;



	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


	
		// 1. 세션 꺼내오기
				HttpSession session = request.getSession();
				// 2. 세션영역 안에 있는 모든 데이터 무효화시키기
				// session.removeAttribute("member"); 
				session.invalidate();
				// 3. main.jsp로 redirect방식 이동
				response.sendRedirect("home.jsp");
	
	}

}
