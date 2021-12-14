package com.bc.AjaxController;

import java.io.IOException;


import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.model.dao.CartDAO;
import com.bc.model.dao.ProductDAO;
import com.bc.model.vo.CartVO;
import com.bc.model.vo.OrderProdVO;
import com.bc.model.vo.ProductVO;
import com.bc.model.vo.LogInVO;

	@WebServlet("/cartOrder")
	public class CartOrderController extends HttpServlet {
		private static final long serialVersionUID = 1L;

		// 나중에 구현
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("application/x-json; charset=UTF-8");

			System.out.println("--------- cartOrder get 실행 -----------");

			String[] cnto = request.getParameterValues("cnto");
			
			if(cnto == null) {
				System.out.println("--------- cnto가 널값 -----------");

				response.sendRedirect("orderFail.jsp");
				return;
			}
						
			for(int i =0; i < cnto.length; i++) {
				System.out.println("cnto 값 확인 : " + cnto[i]);
			}
			
			String[] pname = request.getParameterValues("pname");
			String[] pprice = request.getParameterValues("pprice");
			String[] pcnt = request.getParameterValues("pcnt");
			String[] pdiscount = request.getParameterValues("pdiscount");
			String[] realPrice = request.getParameterValues("realPrice");
			String[] orderBtn = request.getParameterValues("orderBtn");
			
			// 아이디 세션 불러오기
			HttpSession session = request.getSession();
			LogInVO mvo = (LogInVO)session.getAttribute("vo");
			String mid = mvo.getMid();
			System.out.println("파라미터 받은값 확인 mid : " + mid);
			
			String switchBtn = request.getParameter("switchBtn");

			System.out.println("switchBtn : " + switchBtn);
			
			List<CartVO> clist = new ArrayList<>();
			List<ProductVO> plist = new ArrayList<>();
			List<OrderProdVO> oplist = new ArrayList<>();

			CartVO cvo = new CartVO();
			ProductVO pvo = new ProductVO();
			OrderProdVO orvo = new OrderProdVO();

			// 상품 삭제 처리 
			if(switchBtn.equals("delete")) {
				System.out.println("delete 실행~~~");
				for (int i = 0; i < cnto.length; i++) {
					System.out.println("delete 파라미터 받은값 확인 mid : " + mid);
					System.out.println(i+ "번 cnto : " + cnto[i]);
					System.out.println(i+ "번 pname : " + pname[i]);
					System.out.println(i+ "번 pprice : " + pprice[i]);
					System.out.println(i+ "번 pcnt : " + pcnt[i]);
				 	System.out.println(i+ "번 pdiscount : " + pdiscount[i]);
					System.out.println(i+ "번 realPrice : " + realPrice[i]);
					System.out.println(i+ "번 orderBtn : " + orderBtn[i]);
					CartDAO.cartDeleteOne(cnto[i], mid);
				}//////////////////////////////////
				response.sendRedirect("cartDelete.jsp");
				
			}else if (switchBtn.equals("orderAll")) {
				System.out.println("orderAll 실행~~~");
				int pcnti = 0;
				int realPricei = 0;
				int finalPrice = 0;
				String stFinalPrice = "";
				for (int i = 0; i < cnto.length; i++) {
					System.out.println(i+ "번 cnto : " + cnto[i]);
					System.out.println(i+ "번 pname : " + pname[i]);
					System.out.println(i+ "번 pprice : " + pprice[i]);
					System.out.println(i+ "번 pcnt : " + pcnt[i]);
				 	System.out.println(i+ "번 pdiscount : " + pdiscount[i]);
					System.out.println(i+ "번 realPrice : " + realPrice[i]);
					System.out.println(i+ "번 orderBtn : " + orderBtn[i]);
				
					pcnti = Integer.parseInt(pcnt[i]);
					System.out.println("pcnti : " + pcnti);

					realPricei = Integer.parseInt(realPrice[i]);
					System.out.println("realPricei : " + realPricei);

					finalPrice = pcnti * realPricei;
					System.out.println("finalPrice : " + finalPrice);
					
					stFinalPrice = String.valueOf(finalPrice);
					
					System.out.println("stFinalPrice : " + stFinalPrice);
					
					orvo = new OrderProdVO(pname[i], pcnt[i], realPrice[i], stFinalPrice);
					System.out.println(i+"번 orvo : " + orvo);

					oplist.add(i, orvo);
					System.out.println(i+"번 oplist : " + oplist);
				
				}
				
					System.out.println("최종 oplist : " + oplist);

					request.setAttribute("oplist", oplist);

					request.getRequestDispatcher("payment.jsp").forward(request, response);
//					response.sendRedirect("payment.jsp");
					
			}else if (switchBtn.equals("orderNumUpdate")) {
				System.out.println("orderNumUpdate 실행~~~");
				
				for (int i = 0; i < cnto.length; i++) {
					System.out.println("orderNumUpdate 파라미터 받은값 확인 mid : " + mid);

					System.out.println(i+ "번 cnto : " + cnto[i]);
					System.out.println(i+ "번 pname : " + pname[i]);
					System.out.println(i+ "번 pprice : " + pprice[i]);
					System.out.println(i+ "번 pcnt : " + pcnt[i]);
				 	System.out.println(i+ "번 pdiscount : " + pdiscount[i]);
					System.out.println(i+ "번 realPrice : " + realPrice[i]);
					System.out.println(i+ "번 orderBtn : " + orderBtn[i]);
					
					CartDAO.cartNumUpdate(pcnt[i], cnto[i], mid);
				}
				System.out.println("cart로 리다이렉트 실행~~~");
				response.sendRedirect("cart.jsp");
			}
			
		
//			
//
//			response.sendRedirect("payment.jsp");
		}
		
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			
			System.out.println("--------- cartOrder post 실행 -----------");

			

			String[] cnto= request.getParameterValues("cnto");
			if(cnto == null) {
				response.sendRedirect("orderFail.jsp");
			}
			
			String[] pname = request.getParameterValues("pname");
			String[] pprice = request.getParameterValues("pprice");
			String[] pcnt = request.getParameterValues("pcnt");
			String[] pdiscount = request.getParameterValues("pdiscount");
			String[] realPrice = request.getParameterValues("realPrice");
			String[] orderBtn = request.getParameterValues("orderBtn");
			// 테스트 아이디 삽입
			String mid = "test1";
			
			String switchBtn = request.getParameter("switchBtn");

			System.out.println("switchBtn : " + switchBtn);
			
			List<CartVO> clist = new ArrayList<>();
			List<ProductVO> plist = new ArrayList<>();
			CartVO cvo = new CartVO();
			ProductVO pvo = new ProductVO();

			
			// 상품 삭제 처리 
			if(switchBtn.equals("delete")) {
				System.out.println("delete 실행~~~");
				for (int i = 0; i < cnto.length; i++) {
					System.out.println(i+ "번 cnto : " + cnto[i]);
					System.out.println(i+ "번 pname : " + pname[i]);
					System.out.println(i+ "번 pprice : " + pprice[i]);
					System.out.println(i+ "번 pcnt : " + pcnt[i]);
				 	System.out.println(i+ "번 pdiscount : " + pdiscount[i]);
					System.out.println(i+ "번 realPrice : " + realPrice[i]);
					System.out.println(i+ "번 orderBtn : " + orderBtn[i]);
					CartDAO.cartDeleteOne(cnto[i], mid);
					response.sendRedirect("cartDelete.jsp");
				}
			}else if (switchBtn.equals("orderAll")) {
				System.out.println("orderAll 실행~~~");
				for (int i = 0; i < cnto.length; i++) {
					System.out.println(i+ "번 cnto : " + cnto[i]);
					System.out.println(i+ "번 pname : " + pname[i]);
					System.out.println(i+ "번 pprice : " + pprice[i]);
					System.out.println(i+ "번 pcnt : " + pcnt[i]);
				 	System.out.println(i+ "번 pdiscount : " + pdiscount[i]);
					System.out.println(i+ "번 realPrice : " + realPrice[i]);
					System.out.println(i+ "번 orderBtn : " + orderBtn[i]);
					
					cvo.setCnto(cnto[i]);
					cvo.setPcnt(pcnt[i]);
					System.out.println(i+"번 cvo : " + cvo);
					
					clist.add(i, cvo);
					System.out.println(i+"번 clist : " + clist);

					pvo.setPname(pname[i]);
					pvo.setPprice(pprice[i]);
					pvo.setPdiscount(pdiscount[i]);
					System.out.println(i+"번 pvo : " + pvo);
					
					plist.add(i, pvo);
					System.out.println(i+"번 plist : " + plist);
				}
					System.out.println("최종 clist : " + clist);
					System.out.println("최종 plist : " + plist);

					request.setAttribute("clist", clist);
					request.setAttribute("plist", plist);

					request.getRequestDispatcher("payment.jsp").forward(request, response);
//					response.sendRedirect("payment.jsp");
					
			}else if (switchBtn.equals("orderNumUpdate")) {
				System.out.println("orderNumUpdate 실행~~~");

				for (int i = 0; i < cnto.length; i++) {
					System.out.println(i+ "번 cnto : " + cnto[i]);
					System.out.println(i+ "번 pname : " + pname[i]);
					System.out.println(i+ "번 pprice : " + pprice[i]);
					System.out.println(i+ "번 pcnt : " + pcnt[i]);
				 	System.out.println(i+ "번 pdiscount : " + pdiscount[i]);
					System.out.println(i+ "번 realPrice : " + realPrice[i]);
					System.out.println(i+ "번 orderBtn : " + orderBtn[i]);
					
					CartDAO.cartNumUpdate(pcnt[i], cnto[i], mid);
				}
				System.out.println("cart로 리다이렉트 실행~~~");
				response.sendRedirect("cart.jsp");
			}


		}
		
		private String makeJsonCart(List<CartVO> cvo) {
			
			//JSON 형태 문자열로 바꾸기
			StringBuilder result = new StringBuilder();
			result.append("{ \"CartVO\" : [");	
			
			for (CartVO vo : cvo) {
				result.append("{");
				result.append("\"cnto\" : \"" + vo.getCnto() + "\",");
				result.append("\"pcocde\" : \"" + vo.getPcode() + "\",");
				result.append("\"mid\" : \"" + vo.getMid() + "\",");
				result.append("\"cno\" : \"" + vo.getCno() + "\",");
				result.append("\"pcnt\" : \"" + vo.getPcnt() + "\"");
				result.append("},");
			}
			result.delete(result.length() - 1, result.length());
			result.append("],");

//			result.append("]}");
			
			return result.toString();
		}
		
		private String makeJsonProd(List<ProductVO> pvo) {
			
			//JSON 형태 문자열로 바꾸기
			StringBuilder result = new StringBuilder();
			result.append("\"ProductVO\" : [");	
			
			for (ProductVO vo : pvo) {
				result.append("{");
				result.append("\"pcode\" : \"" + vo.getPcode() + "\",");
				result.append("\"cno\" : \"" + vo.getCno() + "\",");
				result.append("\"pname\" : \"" + vo.getPname() + "\",");
				result.append("\"pprice\" : \"" + vo.getPprice() + "\",");
				result.append("\"pdiscount\" : \"" + vo.getPdiscount() + "\",");
				result.append("\"pregist\" : \"" + vo.getPregist() + "\"");
				result.append("},");
			}
			result.delete(result.length() - 1, result.length());
			result.append("]}");
			
			return result.toString();
		}
	}
