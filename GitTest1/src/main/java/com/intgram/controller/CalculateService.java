package com.intgram.controller;

import java.io.IOException;

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

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// TBL_MEMBER_CO2 에 데이터 저장
    	HttpSession session = request.getSession();
    	MemberVO mbVO = (MemberVO)session.getAttribute("member");
    	Co2VO co2VO = new Co2VO();
		
		int amount = Integer.parseInt(request.getParameter("amount"));
		//String transportion = request.getParameter("transportation");
		String transportion = "차량";
		String fuel_type = "휘발유";
				
		response.setContentType("text/html;charset=utf-8");
		
		System.out.println(transportion);
		co2VO.setMem_id(mbVO.getMem_id());
		System.out.println("아이디 = " + mbVO.getMem_id());
		co2VO.setTransportation(transportion);
		co2VO.setMem_fuel_name(fuel_type);
		co2VO.setFuel_amount(amount);
		
		// 3. DAO 생성
		DAO dao = new DAO();
		
		// 4. DAO 이용
		int row = dao.insertC(co2VO);
		
		System.out.println("여기까지는됐니");
	
		response.sendRedirect("calculation.jsp");
	}

}
