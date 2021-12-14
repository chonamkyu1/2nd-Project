package com.bc.LoginController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.model.dao.LogInDAO;
import com.bc.model.vo.LogInVO;

@WebServlet("/findPW")
public class FindPwController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		System.out.println("doGet 실행~~");
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8"); // 한글처리 여기서 해줘야한다.
		// 파라미터 값 추출
		String mid = request.getParameter("mid");
		String mname = request.getParameter("mname");
		String mphone = request.getParameter("mphone");
		
		// DB연결
		LogInVO findPWvo = new LogInVO();
		findPWvo = LogInDAO.findPassword(mid, mname, mphone);
		// 데이터 전달
		request.setAttribute("findPWvo", findPWvo);
		System.out.println("findPWvo: " + findPWvo);
		
		if (findPWvo == null) {
			System.out.println("등록된 정보가 없습니다.");
			request.getRequestDispatcher("findPassword_fail.jsp").forward(request, response);
		} else {
			System.out.println("비밀번호 재설정 도와드리겠습니다.");
			request.getRequestDispatcher("findPassword_modify.jsp").forward(request, response);
		}
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
