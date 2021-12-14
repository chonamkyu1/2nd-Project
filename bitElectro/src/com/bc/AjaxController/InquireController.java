package com.bc.AjaxController;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.dao.MemberDAO;
import com.bc.model.dao.MemberOrderBookDAO;
import com.bc.model.dao.NoticeDAO;
import com.bc.model.dao.OrderBookDAO;
import com.bc.model.vo.MemberOrderBookVO;
import com.bc.model.vo.MemberVO;
import com.bc.model.vo.NoticeVO;
import com.bc.model.vo.OrderBookVO;


@WebServlet("/inquireResist")

public class InquireController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {	
	request.setCharacterEncoding("UTF-8");
	
	System.out.println("--------- inquireResist get 실행 ----------");

	String mid = request.getParameter("mid");	
	String mjumun = request.getParameter("mjumun");
	String csubject = request.getParameter("csubject");
	String ccontent = request.getParameter("ccontent");

	
	System.out.println("파라미터 확인 mid : " + mid);
	System.out.println("파라미터 확인 mjumun : " + mjumun);
	
	// 주문번호 유무 확인 
	MemberOrderBookVO mobvo = MemberOrderBookDAO.orderBookSearch(mid, mjumun);
	System.out.println("obvo : " + mobvo);
	
//	MemberVO mvo = MemberDAO.getMemberUserInfo(mid);
	
	// 회원 유무 확인
//	MemberVO mvo = MemberDAO.getMemberUserInfo(mname, memail, mphone);
	
	// 회원 정보가 있으면 고객센터 문의사항 등록 
	if(mobvo != null) {
		
		System.out.println("Insert 할 msubject : " + csubject);
		System.out.println("Insert 할 msubject : " + ccontent);
		NoticeVO nvo = new NoticeVO();
		
		nvo.setMid(mid);
		nvo.setCsubject(csubject);
		nvo.setCcontent(ccontent);
		
		NoticeDAO.insertInquire(nvo);
		System.out.println("Insert 완료");
		
	}else {
		request.getRequestDispatcher("inquireWriteFail.jsp").forward(request, response);
	}
	//insert완료후 resistOk페이지로 이동.
		response.sendRedirect("inquireWriteOk.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {	
	request.setCharacterEncoding("UTF-8");
	System.out.println("-------- inquireResist post 실행 ------------");
	
	String mid = request.getParameter("mid");
	String mjumun = request.getParameter("mjumun");
	String csubject = request.getParameter("csubject");
	String ccontent = request.getParameter("ccontent");
	
	System.out.println("파라미터 확인 mid : " + mid);
	System.out.println("파라미터 확인 mjumun : " + mjumun);
	
	// 주문번호 유무 확인 <- 주문번호가 없으면 등록 안되는 기능 추가 해야 함. 
//		MemberOrderBookVO mobvo = MemberOrderBookDAO.orderBookSearch(mid, mjumun);
//		System.out.println("mobvo : " + mobvo);
	
//	MemberVO mvo = MemberDAO.getMemberUserInfo(mid);
	
	// 회원 유무 확인 <- 비회원 기능 넣을때 
//	MemberVO mvo = MemberDAO.getMemberUserInfo(mname, memail, mphone);
	
	// 회원 정보가 있으면 고객센터 문의사항 등록 
//	if(mobvo != null) {
		
		System.out.println("Insert 할 msubject : " + csubject);
		System.out.println("Insert 할 mcontent : " + ccontent);
		NoticeVO nvo = new NoticeVO();
		
		nvo.setMid(mid);
		nvo.setCsubject(csubject);
		nvo.setCcontent(ccontent);
		
		NoticeDAO.insertInquire(nvo);
		System.out.println("nvo : " + nvo);

		System.out.println("-------- Insert 완료 ---------");
		
//	}else {
//		request.getRequestDispatcher("inquireWriteFail.jsp").forward(request, response);
//	}
	//insert완료후 resistOk페이지로 이동.
		response.sendRedirect("inquireWriteOk.jsp");
	}
}