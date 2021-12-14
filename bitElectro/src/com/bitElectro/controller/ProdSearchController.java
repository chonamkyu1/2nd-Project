package com.bitElectro.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitElectro.dao.ProductDAO;
import com.bitElectro.vo.CateProdVO;
import com.bitElectro.vo.CategoryVO;



@WebServlet("/ProdSearch")
public class ProdSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");
		
		String select = request.getParameter("select");
		String keyword = request.getParameter("searchElement");
		String cmain = request.getParameter("categoryMain");
		String cmiddle = request.getParameter("categoryMid");
		String csub = request.getParameter("categorySub");
		
		
		if(select.equals("pname")) {	//상품명으로 검색한 경우
			
			//pname이 부분만 검색해도 될 수 있도록 작업
			keyword = "%" + keyword + "%";
			
			//해당 키워드를 파라미터로 보내어 cpList 도출
			List<CateProdVO>cpList =  ProductDAO.getListByKey(keyword);
			
			//System.out.println("키워드 cpList : " + cpList);
			
			//xml문 작성
			//PrintWriter / StringBuilder 생성
			PrintWriter out = response.getWriter();
			StringBuilder result = new StringBuilder();
			
			result.append("<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>");
			result.append("<products>");
			
			for(CateProdVO cpvo : cpList) {
			result.append("<product>");
				result.append("<pcode>"+cpvo.getPcode()+"</pcode>");
				result.append("<pname>"+cpvo.getPname()+"</pname>");
				result.append("<cno>"+cpvo.getCno()+"</cno>");
				result.append("<cmain>"+cpvo.getCmain()+"</cmain>");
				result.append("<cmiddle>"+cpvo.getCmiddle()+"</cmiddle>");
				result.append("<csub>"+cpvo.getCsub()+"</csub>");
				result.append("<pprice>"+cpvo.getPprice()+"</pprice>");
				result.append("<pstock>"+cpvo.getPstock()+"</pstock>");
				result.append("<presist>"+cpvo.getPregist()+"</presist>");
			result.append("</product>");
			}
			
			result.append("</products>");
			System.out.println(result.toString()); 
			out.write(result.toString());
			
		}else if(select.equals("category")) {//카테고리로 검색한 경우
			
			
			 //System.out.println("cmain : " + cmain); 
			// System.out.println("cmiddle : " +cmiddle); 
			// System.out.println("csub : " + csub);
			 
			
			CategoryVO cvo = new CategoryVO();
			cvo.setCmain(cmain);
			cvo.setCmiddle(cmiddle);
			cvo.setCsub(csub);
			/*
			 * System.out.println("카테고리 cvo : "+cvo);
			 */
			List<CateProdVO>cpList = ProductDAO.getListByCate(cvo);
			
			/* System.out.println("카테고리 cpList : " + cpList); */
			
			//xml문 작성
			//PrintWriter / StringBuilder 생성
			PrintWriter out = response.getWriter();
			StringBuilder result = new StringBuilder();
			
			result.append("<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>");
			result.append("<products>");
			
			for(CateProdVO cpvo : cpList) {
			result.append("<product>");
				result.append("<pname>"+cpvo.getPname()+"</pname>");
				result.append("<cno>"+cpvo.getCno()+"</cno>");
				result.append("<cmain>"+cpvo.getCmain()+"</cmain>");
				result.append("<cmiddle>"+cpvo.getCmiddle()+"</cmiddle>");
				result.append("<csub>"+cpvo.getCsub()+"</csub>");
				result.append("<pprice>"+cpvo.getPprice()+"</pprice>");
				result.append("<pstock>"+cpvo.getPstock()+"</pstock>");
				result.append("<presist>"+cpvo.getPregist()+"</presist>");
			result.append("</product>");
			}
			
			result.append("</products>");
			/* System.out.println(result.toString()); */
			out.write(result.toString());
			
		}
			
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
