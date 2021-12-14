package com.bitElectro.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.bitElectro.dao.MemberDAO;
import com.bitElectro.mybatis.DBService;
import com.bitElectro.vo.MemberVO;

@WebServlet("/adminLogin")
public class LoginController extends HttpServlet{

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String mid = req.getParameter("mid"); //아이디
		String mpw = req.getParameter("mpw"); //비밀번호
		
		List<MemberVO> list = MemberDAO.getList(); //회원정보 리스트
		
		req.setAttribute("list", list);
		req.setAttribute("mid", mid);
		req.setAttribute("mpw", mpw);
		
		req.getRequestDispatcher("adminLogin_ok.jsp").forward(req, resp);

	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		doGet(req, resp);
	}
	}
	

