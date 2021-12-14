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

@WebServlet("/withdrawal")
public class WithdrawalController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		System.out.println("doGet 실행~~");
		request.setCharacterEncoding("UTF-8"); // 한글처리 여기서 해줘야한다.

		// 파라미터 값 추출
		String mpw = request.getParameter("mpw");
		System.out.println("mpw: " + mpw);
		
		session.setAttribute("mpw", mpw);
		LogInVO lvo = (LogInVO)session.getAttribute("vo");
		System.out.println("lvo: " + lvo);
		
		String vmpw = lvo.getMpw(); // 로그인 했을 때 담긴 비밀번호
		
		if (mpw.equals(vmpw)) {
			LogInDAO.deleteMember(lvo);
			session.invalidate();
		} else {
			System.out.println("탈퇴가 안되었습니다. 다시입력해주세요.");
			
		}
		
		request.getRequestDispatcher("withdrawal_ok.jsp").forward(request, response);
		
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	
	}
}
