package com.bc.AjaxController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

	@WebServlet("/orderResist")
	public class OrderResistController extends HttpServlet {
		private static final long serialVersionUID = 1L;

		// 나중에 구현
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("application/x-json; charset=UTF-8");
			
			System.out.println("orderResist get 실행~~~~~~~~");
			
			String[] pname = request.getParameterValues("pname");
			String[] pcnt = request.getParameterValues("pcnt");
			String[] realprice = request.getParameterValues("realprice");
			String[] index = request.getParameterValues("index");

			for(int i = 0; i <= 2; i++) {
				System.out.println("pname : " + pname);
				System.out.println("pcnt : " + pcnt);
				System.out.println("realprice : " + realprice);
				System.out.println("index : " + index);
			}

			
			// 해당 상품 CART 삭제 
//			CartDAO.cartDeleteOne(, );
			
			
			response.sendRedirect("paymentOk.jsp");
			
		}
		
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("application/x-json; charset=UTF-8");

			System.out.println("orderResist post 실행~~~~~~~~");

			response.sendRedirect("paymentOk.jsp");
			
		}
	}
