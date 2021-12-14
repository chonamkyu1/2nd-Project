package com.bc.LoginController;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.bc.model.dao.LogInDAO;
import com.bc.model.vo.LogInVO;

@WebServlet("/midCheck")
public class IdCheckController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		System.out.println("midCheck get 실행~~~");
		
		String mid = request.getParameter("mid");
		
		System.out.println("mid : " + mid);
		
		LogInDAO.idCheck(mid);
		
		
		StringBuilder result = new StringBuilder();
		
		
		PrintWriter out = response.getWriter();

		out.print(mid.toString());
		out.flush();
		return;
		
		/*
		 * List<LogInVO> list = (List<LogInVO>)session.getAttribute("list");
		 * System.out.println("list: " + list);
		 */
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	
	}
}
