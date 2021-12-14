package com.bitElectro.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitElectro.dao.OrderBookDetailDAO;
import com.bitElectro.vo.PeriodAmountVO;

@WebServlet("/salesAmount")
public class GetSalesAmountController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String date = request.getParameter("date");
	
	
	 System.out.println("year : " + year); 
	 System.out.println("month : " + month);
	 System.out.println("date : " + date);
	 
	
	if(year != null) {
		List<PeriodAmountVO> list  =  OrderBookDetailDAO.getYearAmount();
		System.out.println("OD list : " + list);
		//xml 데이터 쓰기
		PrintWriter out = response.getWriter();
		StringBuilder result = new StringBuilder();
		
		result.append("<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>");
		result.append("<amounts>");
		for(PeriodAmountVO vo: list) {
			result.append("<amount>");
			result.append("<period>20"+vo.getPeriod()+"</period>");
			result.append("<period_amount>"+vo.getPeriod_amount()+"</period_amount>");
			result.append("</amount>");
		}
		result.append("</amounts>");
		System.out.println("result.toString() : " + result.toString());
		out.write(result.toString());
	}
	if(month !=null) {
		//월별 매출List 계산 DAO
		month = month.substring(2);
		System.out.println(month);
		List<PeriodAmountVO> list  =  OrderBookDetailDAO.getMonthAmount(month);
		System.out.println("OD list : " + list);
		//xml 데이터 쓰기
		PrintWriter out = response.getWriter();
		StringBuilder result = new StringBuilder();
		
		result.append("<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>");
		result.append("<amounts>");
		for(PeriodAmountVO vo: list) {
			result.append("<amount>");
			result.append("<period>"+month+" / "+vo.getPeriod()+"</period>");
			result.append("<period_amount>"+vo.getPeriod_amount()+"</period_amount>");
			result.append("</amount>");
		}
		result.append("</amounts>");
		System.out.println("result.toString() : " + result.toString());
		out.write(result.toString());
	}
	
	if(date != null) {
		//월별 매출List 계산 DAO
		String dateS = date.substring(5);
		System.out.println(dateS);
		
		 List<PeriodAmountVO> list = OrderBookDetailDAO.getDateAmount(dateS);
		 System.out.println("OD list : " + list); //xml 데이터 쓰기
		 
		 	  PrintWriter out =response.getWriter();
			  StringBuilder result = new StringBuilder();
			  
			  result.append("<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>");
			  result.append("<amounts>"); for(PeriodAmountVO vo: list) {
			  result.append("<amount>");
			  result.append("<period>"+dateS+" / "+vo.getPeriod()+"</period>");
			  result.append("<period_amount>"+vo.getPeriod_amount()+"</period_amount>");
			  result.append("</amount>"); } result.append("</amounts>");
			  System.out.println("result.toString() : " + result.toString());
			  out.write(result.toString());
			 
	}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
