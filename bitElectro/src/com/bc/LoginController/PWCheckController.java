package com.bc.LoginController;

import java.io.IOException;

import javax.print.attribute.HashPrintRequestAttributeSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.bc.model.dao.LogInDAO;
import com.bc.model.vo.LogInVO;

@WebServlet("/findPWCheck")
public class PWCheckController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("doGet 실행~~");
		request.setCharacterEncoding("UTF-8"); // 한글처리 여기서 해줘야한다.

		// 파라미터 값 추출
		//LogInVO lvo =  (LogInVO)request.getAttribute("findPWvo");
		String mpw = request.getParameter("updatepw");
		String mid = request.getParameter("mid");
		System.out.println("mpw, mid: " + mpw + mid);
		
		
		// DB 연결
		LogInVO lvo = new LogInVO();
		lvo.setMpw(mpw);
		lvo.setMid(mid);
		LogInDAO.updatePW(lvo);
		System.out.println("lvo: " + lvo);
		
		response.sendRedirect("findPassword_modify_ok.jsp");
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
