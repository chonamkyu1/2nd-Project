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

@WebServlet("/logIn")
public class LogInController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); // 한글처리 여기서 해줘야한다.
		response.setContentType("text/html;charset=UTF-8");
		
		System.out.println("logIn doGet 실행~~");
		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");
		
		System.out.println("mid : " + mid);
		System.out.println("mpw : " + mpw);
		
		// 1. DB연결하고 데이터 가져오기
		LogInVO loginvo = new LogInVO(mid, mpw); // vo 생성
		LogInVO vo = LogInDAO.logIn(loginvo);
		System.out.println("vo : " + vo);
		
		// 3. 응답페이지로 화면 이동(전환)
		if (vo == null) {
			System.out.println("해당 아이디가 등록되어 있지 않습니다.");
			request.getRequestDispatcher("logIn_fail.jsp").forward(request, response);

			// 뒤로가기
		} else {
			System.out.println("로그인에 성공하였습니다.");
			request.setAttribute("vo", vo);
			request.getRequestDispatcher("logIn_ok.jsp").forward(request, response);

		}

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);

	}
}
