package com.bitElectro.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitElectro.dao.MemberDAO;
import com.bitElectro.vo.MemberVO;


@WebServlet("/adminSearchName")
public class GetAdminListController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");
		String selectV = request.getParameter("select");
		String searchElement= request.getParameter("searchElement");
		
		if(selectV.equalsIgnoreCase("mname")) {
			searchElement = "%" +searchElement + "%";
			List<MemberVO> list = MemberDAO.adminNameList(searchElement);	
			
			//xml데이터 만들기
			PrintWriter out = response.getWriter();
			StringBuilder result = new StringBuilder();
			
			result.append("<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>");
			result.append("<members>");
			for(MemberVO vo:list) {
				result.append("<member>");
				result.append("<mid>"+vo.getMid()+"</mid>");
				result.append("<mpw>"+vo.getMpw()+"</mpw>");
				result.append("<mname>"+vo.getMname()+"</mname>");
				result.append("<mphone>"+vo.getMphone()+"</mphone>");
				result.append("<maddress>"+vo.getMaddress()+"</maddress>");
				result.append("<mjumin>"+vo.getMjumin()+"</mjumin>");
				result.append("<memail>"+vo.getMemail()+"</memail>");
				result.append("</member>");
			}
			result.append("</members>");
			/* System.out.println(result.toString()); */
			out.write(result.toString());
		
		}else if(selectV.equalsIgnoreCase("mid")) { //ID로 검색할 경우
			searchElement = "%" +searchElement + "%";
			
			List<MemberVO> list = MemberDAO.adminIdList(searchElement);	
			
			//xml데이터 만들기
			PrintWriter out = response.getWriter();
			StringBuilder result = new StringBuilder();
			
			result.append("<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>");
			result.append("<members>");
			for(MemberVO vo:list) {
				result.append("<member>");
				result.append("<mid>"+vo.getMid()+"</mid>");
				result.append("<mpw>"+vo.getMpw()+"</mpw>");
				result.append("<mname>"+vo.getMname()+"</mname>");
				result.append("<mphone>"+vo.getMphone()+"</mphone>");
				result.append("<maddress>"+vo.getMaddress()+"</maddress>");
				result.append("<mjumin>"+vo.getMjumin()+"</mjumin>");
				result.append("<memail>"+vo.getMemail()+"</memail>");
				result.append("</member>");
			}
			result.append("</members>");
			out.write(result.toString());	
		}
		}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
