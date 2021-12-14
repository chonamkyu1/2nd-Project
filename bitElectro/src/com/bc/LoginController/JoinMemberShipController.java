package com.bc.LoginController;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.model.dao.LogInDAO;
import com.bc.model.vo.LogInVO;

@WebServlet("/joinMemberShip")
public class JoinMemberShipController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");

		request.setCharacterEncoding("UTF-8"); // 한글처리 여기서 해줘야한다.
		System.out.println("joinMemberShip doGet 실행~~");
		// 1. 파라미터 값 추출(확인)
		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");
		String mname = request.getParameter("mname");
		String mphone = request.getParameter("mphone");
		String maddress = request.getParameter("maddress");
		String mjumin = request.getParameter("mjumin");
		String memail = request.getParameter("memail");
		int mpoint = Integer.parseInt(request.getParameter("mpoint")); // number
		int mcumulative_buy = Integer.parseInt(request.getParameter("mcumulative_buy")); // number
		String mjoindate = request.getParameter("mjoindate"); // date 가입일
		int mclass = Integer.parseInt(request.getParameter("mclass")); // number
		
		System.out.println("파라미터 확인 mid : " + mid);

		// 2. DB 연결하고 데이터 저장, 가져오기
		LogInVO vo = new LogInVO();

		vo.setMid(mid);
		vo.setMpw(mpw);
		vo.setMname(mname);
		vo.setMphone(mphone);
		vo.setMaddress(maddress);
		vo.setMjumin(mjumin);
		vo.setMemail(memail);
		vo.setMpoint(mpoint);
		vo.setMcumulative_buy(mcumulative_buy);
		vo.setMjoindate(mjoindate);
		vo.setMclass(mclass);

		int result = LogInDAO.insert(vo);
		System.out.println("result: " + result);
		
		HttpSession session = request.getSession();
		
		// 1. 회원가입 되면 1
		if(result == 1) {
			System.out.println("vo: " + vo);
			session.setAttribute("vo", vo);
			response.sendRedirect("joinMemberShip_ok.jsp");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
