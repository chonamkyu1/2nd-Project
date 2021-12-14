package com.bc.LoginController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import com.bc.model.vo.LogInVO;

@WebServlet()
public class LogOutController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	LogInVO vo = (LogInVO)request.getSession();	
	
	System.out.println("컨트롤러에 vo: " + vo);
	
	request.getRequestDispatcher("logOut_ok.jsp").forward(request, response);
	
	
		
		
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	
	}
}
