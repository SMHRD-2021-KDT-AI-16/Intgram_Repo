package com.intgram.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.intgram.db.DAO;
import com.intgram.model.MemberVO;

@WebServlet("/JoinService")
public class JoinService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String com_num = request.getParameter("com_num");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String mem_name = request.getParameter("mem_name");
		String position = request.getParameter("position");
		MemberVO vo = new MemberVO();
		vo.setMem_id(id);
		vo.setMem_pw(pw);
		vo.setMem_name(mem_name);
		vo.setMem_position(position);
		DAO dao = new DAO();
		int row = dao.join(vo);
		if (row > 0) {
			request.setAttribute("mem_name", mem_name);
			RequestDispatcher rd = request.getRequestDispatcher("join_success.jsp");
			rd.forward(request, response);
		} else {
			response.sendRedirect("main.jsp");
		}
	}
}
