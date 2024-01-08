package com.intgram.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.intgram.db.DAO;
import com.intgram.model.Co2VO;
import com.intgram.model.MemberVO;

@WebServlet("/LoginService")
public class LoginService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		MemberVO vo = new MemberVO();
		vo.setMem_id(id);
		vo.setMem_pw(pw);
		DAO dao = new DAO();
		MemberVO result = null;
		result = dao.login(vo);
		List<Co2VO> co2vo = dao.getdata(result);
		if (result != null) {
			HttpSession session = request.getSession();
			session.setAttribute("member", result);
			session.setAttribute("member_data", co2vo);
		}
		response.sendRedirect("homecopy.jsp");
	}

}
