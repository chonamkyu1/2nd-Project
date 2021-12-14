package com.bitElectro.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitElectro.dao.MemberDAO;
import com.bitElectro.vo.MemberVO;

@WebServlet("/adminResist")

public class ResistAdminController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	req.setCharacterEncoding("UTF-8");
	
	//파라미터값 불러오기
	String mid = req.getParameter("mid");
	String mpw = req.getParameter("mpw");
	String mname = req.getParameter("mname");
	String mphone = req.getParameter("mphone");
	String maddress = req.getParameter("maddress");
	String mjumin = req.getParameter("mjumin");
	String memail = req.getParameter("memail"); 
	
	
	//나머지 변수의 초기값은 mapper에서 지정. 
	
	MemberVO mvo = MemberDAO.getUserInfo(mid);
	if(mvo==null) {
		mvo = new MemberVO();
		mvo.setMid(mid);
		mvo.setMpw(mpw);
		mvo.setMname(mname);
		mvo.setMphone(mphone);
		mvo.setMaddress(maddress);
		mvo.setMjumin(mjumin);
		mvo.setMemail(memail);
		
		//문제가 없으면 Insert 하기
		MemberDAO.insertAdmin(mvo);
	}else {
		resp.sendRedirect("resistFail.jsp");
	}
		//insert완료후 resistOk페이지로 이동.
	resp.sendRedirect("resistOk.jsp");
	
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		//파라미터값 불러오기
		String mid = req.getParameter("mid");
		String mpw = req.getParameter("mpw");
		String mname = req.getParameter("mname");
		String mphone = req.getParameter("mphone");
		String maddress = req.getParameter("maddress");
		String mjumin = req.getParameter("mjumin");
		String memail = req.getParameter("memail"); 
		
		System.out.println("mid : " + mid);
		System.out.println("mpw : " + mpw);
		System.out.println("mname : " + mname);
		System.out.println("mphone : " + mphone);
		System.out.println("maddress : " + maddress);
		System.out.println("mjumin : " + mjumin);
		System.out.println("memail : " + memail);
		
		
		//나머지 변수의 초기값은 mapper에서 지정. 
		
		MemberVO mvo = MemberDAO.getUserInfo(mid);
		System.out.println("Post >> Insert 전 mvo : " + mvo);
		if(mvo==null) {
			mvo = new MemberVO();
			mvo.setMid(mid);
			mvo.setMpw(mpw);
			mvo.setMname(mname);
			mvo.setMphone(mphone);
			mvo.setMaddress(maddress);
			mvo.setMjumin(mjumin);
			mvo.setMemail(memail);
			
			//문제가 없으면 Insert 하기
			System.out.println("Post >> Insert 할 mvo : " + mvo);
			MemberDAO.insertAdmin(mvo);
			System.out.println("Insert 됨");
		}else {
			req.getRequestDispatcher("resistFail.jsp").forward(req, resp);
		}
			//insert완료후 resistOk페이지로 이동.
		resp.sendRedirect("resistOk.jsp");
		
		}

	}
	
	
	
	

	

