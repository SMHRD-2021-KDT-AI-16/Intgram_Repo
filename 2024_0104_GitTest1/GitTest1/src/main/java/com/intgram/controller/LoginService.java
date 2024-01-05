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

/**
 * Servlet implementation class LoginService
 */
@WebServlet("/LoginService")
public class LoginService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 1. 한글 인코딩
		request.setCharacterEncoding("UTF-8");
		
		// 2. 요청받은 데이터 꺼내오기
		String id = request.getParameter("id");	
		String pw = request.getParameter("pw");
	
		// 3. MemberVO 클래스 사용해서 데이터 하나로 묶어주기
		// MemberVO 라는 객체 생성
		MemberVO vo = new MemberVO();
		
		
		// setter메서드 사용해서 데이터 보관
		vo.setMem_id(id);
		vo.setMem_pw(pw);
		
		// DAO 생성하기
		DAO dao = new DAO();
		
		// DAO 사용하기
		MemberVO result = null;
		result = dao.login(vo);
		
		System.out.println("이번엔 여기니");
		List<Co2VO> co2vo = dao.getdata(result);
		System.out.println("이번엔 여기니222");
		
		System.out.println("result = " + result.getMem_id());
		// 6. 로그인 성공했다면
		if (result != null) {
			// 6-1) 세션영역을 꺼내와서
			HttpSession session = request.getSession();
			// 6-2) 세션영역에 로그인 정보(사용자 모든 정보)를 담아주기
			session.setAttribute("member", result);
			session.setAttribute("member_data", co2vo);			
			//System.out.println((List<Co2VO>)session.getAttribute("member_data"));
			
		}
		
		// 7. main.jsp로 redirect 방식 이동
		response.sendRedirect("calculation.jsp");
	}

}
