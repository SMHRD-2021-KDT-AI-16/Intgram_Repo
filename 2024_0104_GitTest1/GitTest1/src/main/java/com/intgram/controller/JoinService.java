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


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 1. 한글 인코딩
				request.setCharacterEncoding("UTF-8");
				
				// 2. 요청받은 데이터 꺼내오기
				String com_num = request.getParameter("com_num");
				String id = request.getParameter("id");	
				String pw = request.getParameter("pw");
				String mem_name = request.getParameter("mem_name");
				String position = request.getParameter("position");
			
				// 3. MemberVO 클래스 사용해서 데이터 하나로 묶어주기
				// MemberVO 라는 객체 생성
				MemberVO vo = new MemberVO();
				
				// setter메서드 사용해서 데이터 보관
				vo.setCom_id(com_num);
				vo.setMem_id(id);
				vo.setMem_pw(pw);
				vo.setMem_name(mem_name);
				vo.setMem_position(position);
				
				// DAO 생성하기
				DAO dao = new DAO();
				
				// DAO 사용하기
				int row = dao.join(vo);
				
				// 5. 성공했다면 join_success.jsp로 forward방식 이동
				if(row>0) {
					request.setAttribute("mem_name", mem_name);
					
					// 5-1 request를 유지하면서 응답을 되돌려줄 수 있는 rd객체 생성
				 	RequestDispatcher rd =	request.getRequestDispatcher("join_success.jsp");
				 	// 5-2 rd객체를 사용해서 forward이동
				 	rd.forward(request, response);
				}else
				
				// 6. 실패했다면 main.jsp로 redirect방식 이동
				{
					response.sendRedirect("main.jsp");
				}	
		
	}

}
