package com.bc.AjaxController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.dao.NoticeDAO;
import com.bc.model.vo.NoticeVO;

@WebServlet("/inquireModify")
public class ModifyInquireController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		 System.out.println("InquireModify get 실행 ~~");

		 int ccategory = Integer.parseInt(request.getParameter("ccategory"));
		 int rnum = Integer.parseInt(request.getParameter("rnum"));
		 int pageNum = Integer.parseInt(request.getParameter("page"));

		 int begin = 0;
		 int end = 0;

		 if(pageNum == 1) {
		 	begin = 1;
		 	end = 5;
		 } else if(pageNum > 1){
		 	begin = 5 * (pageNum - 1) + 1;
		 	end = 5 * pageNum;
		 }

		 NoticeVO nvo = NoticeDAO.selectOne(ccategory, rnum, begin, end);

		 System.out.println("nvo.getCno() : " + nvo.getCno());
		 System.out.println("nvo.getMid() : " + nvo.getMid());
		 System.out.println("nvo.getCsubject() : " + nvo.getCsubject());
		 System.out.println("nvo.getCcontent() : " + nvo.getCcontent());

		 NoticeDAO.updateInquire(nvo);
		 
		 System.out.println("------ NoticeDAO.updateInquire 완료 --------");
		
		response.sendRedirect("inquireMotifyOk.jsp");
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		 System.out.println("--------- InquireModify post 실행 -----------");

		String mid = request.getParameter("csubject");
		String csubject = request.getParameter("csubject");
		String ccontent = request.getParameter("ccontent");
		
		System.out.println("파라미터 확인 mid : " + mid);
		System.out.println("파라미터 확인 csubject : " + csubject);
		System.out.println("파라미터 확인 ccontent : " + ccontent);
		 
		 int ccategory = Integer.parseInt(request.getParameter("ccategory"));
		 int rnum = Integer.parseInt(request.getParameter("rnum"));
		 int pageNum = Integer.parseInt(request.getParameter("page"));

		 int begin = 0;
		 int end = 0;

		 if(pageNum == 1) {
		 	begin = 1;
		 	end = 5;
		 } else if(pageNum > 1){
		 	begin = 5 * (pageNum - 1) + 1;
		 	end = 5 * pageNum;
		 }

		 NoticeVO nvo = NoticeDAO.selectOne(ccategory, rnum, begin, end);

		 System.out.println("nvo.getCno() : " + nvo.getCno());
		 int cno = nvo.getCno();
		 
		 nvo = new NoticeVO();
		 nvo.setCno(cno);
		 nvo.setCsubject(csubject);
		 nvo.setCcontent(ccontent);

		 NoticeDAO.updateInquire(nvo);
		
		 System.out.println("------ NoticeDAO.updateInquire 완료 --------");

		response.sendRedirect("inquireMotifyOk.jsp");

	}
}
