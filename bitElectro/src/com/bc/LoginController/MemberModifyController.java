package com.bc.LoginController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.bc.model.dao.LogInDAO;
import com.bc.model.vo.LogInVO;

@WebServlet("/modifyMmeber")
public class MemberModifyController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet 실행~~~");
		request.setCharacterEncoding("UTF-8"); // 한글처리 여기서 해줘야한다.

		// 파라미터 값 추출
		String mname = request.getParameter("mname");
		String mjumin = request.getParameter("mjumin");
		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");
		String mphone = request.getParameter("mphone");
		String memail = request.getParameter("memail");
		String maddress = request.getParameter("maddress");
		
		// DB 연결
		LogInVO lvo = new LogInVO();
		lvo.setMname(mname);
		lvo.setMjumin(mjumin);
		lvo.setMid(mid);
		lvo.setMpw(mpw);
		lvo.setMphone(mphone);
		lvo.setMemail(memail);
		lvo.setMaddress(maddress);
		
		int result = LogInDAO.memberUpdate(lvo);
		System.out.println("result: " + result);
		System.out.println("lvo: " + lvo);
		
		request.setAttribute("lvo", lvo);
		request.getRequestDispatcher("memberModify_ok.jsp").forward(request, response);
	}

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
