package com.bc.AjaxController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.dao.NoticeDAO;
import com.bc.model.vo.NoticeVO;

@WebServlet("/inquireTerm")
public class InquireTremController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// 나중에 구현
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		System.out.println("--------- inquireTerm get 실행 -----------");

		String term = request.getParameter("term");	
	
		System.out.println("term : " + term);
		
//		if(term == week) {
//			
//		} else if (term == month) {
//			
//		} else if (term == treeMonth) {
//			
//		}
		
//		response.sendRedirect("inquireTermOk.jsp");
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		System.out.println("--------- inquireTerm post 실행 -----------");

		String week = request.getParameter("week");	
		String month = request.getParameter("month");
		String treeMonth = request.getParameter("treeMonth");
		
		System.out.println("week : " + week);
		System.out.println("month : " + month);
		System.out.println("treeMonth : " + treeMonth);
				 

//		response.sendRedirect("inquireTermOk.jsp");

	}
}
