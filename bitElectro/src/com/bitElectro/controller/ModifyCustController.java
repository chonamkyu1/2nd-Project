package com.bitElectro.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitElectro.dao.MemberDAO;
import com.bitElectro.vo.MemberVO;


@WebServlet("/custModify")
public class ModifyCustController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		//파라미터값 불러오기
		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");
		String mname = request.getParameter("mname");
		String mphone = request.getParameter("mphone");
		String maddress = request.getParameter("maddress");
		String mjumin = request.getParameter("mjumin");
		String memail = request.getParameter("memail"); 
		String mpoint = request.getParameter("mpoint"); 
		String mcumulative_buy = request.getParameter("mcumulative_buy"); 
		
		//mvo에 저장
		MemberVO mvo = MemberDAO.getCustInfo(mid);	
		
		if(mvo!=null) {
			mvo = new MemberVO();
			mvo.setMid(mid);
			mvo.setMpw(mpw);
			mvo.setMname(mname);
			mvo.setMphone(mphone);
			mvo.setMaddress(maddress);
			mvo.setMjumin(mjumin);
			mvo.setMemail(memail);
			mvo.setMpoint(mpoint);
			mvo.setMcumulative_buy(mcumulative_buy);
			
			//문제가 없으면 Insert 하기
			MemberDAO.updateCust(mvo); 
			
		}
			//insert완료후 resistOk페이지로 이동.
		response.sendRedirect("custModifyOk.jsp"); 
		
		}
		
		
	


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
