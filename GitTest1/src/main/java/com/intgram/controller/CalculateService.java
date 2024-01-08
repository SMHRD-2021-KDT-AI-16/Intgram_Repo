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

@WebServlet("/CalculateService")
public class CalculateService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CalculateService() {
		super();

	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberVO mbVO = (MemberVO) session.getAttribute("member");
		Co2VO co2VO = new Co2VO();
		int amount = Integer.parseInt(request.getParameter("amount"));
		String transportation = request.getParameter("transport");
		String fuel_type = request.getParameter("fuel");
		response.setContentType("text/html;charset=utf-8");
		System.out.println(transportation);
		co2VO.setMem_id(mbVO.getMem_id());
		System.out.println("아이디 = " + mbVO.getMem_id());
		co2VO.setTransportation(transportation);
		co2VO.setMem_fuel_name(fuel_type);
		co2VO.setFuel_amount(amount);
		DAO dao = new DAO();
		MemberVO mbvo = (MemberVO) session.getAttribute("member");
		int row = dao.insertC(co2VO);
		if (row > 0) {
			List<Co2VO> co2vo = dao.getdata(mbvo);
			session.setAttribute("member_data", co2vo);
		}
		response.sendRedirect("calculation.jsp");
	}

}
