package com.bc.AjaxController;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
import com.bc.model.vo.LogInVO;
import com.bc.model.vo.ProductVO;

@WebServlet("/cartView")
public class CartViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// 나중에 구현
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/x-json; charset=UTF-8");

		System.out.println("--------- cartView get 실행 -----------");

//		String mid = request.getParameter("mid");
//		System.out.println("mid : " + mid);
		
		// 테스트 아이디 값 입력 
		HttpSession session = request.getSession();
		LogInVO mvo = (LogInVO)session.getAttribute("vo");
		String mid = mvo.getMid();
		System.out.println("mid : " + mid);
		
		List<CartVO> cvo = CartDAO.cartSelectList(mid);	
				
		ProductVO pvo = new ProductVO();
		List<ProductVO> pvoList = new ArrayList<ProductVO>();

		int index = 0;
		for (CartVO vo : cvo) {
			pvo = ProductDAO.selectProd(vo.getPcode());
			pvoList.add(pvo);
			index++;
		}
		
		System.out.println("====== DAO 처리 끝 =======");
		System.out.println("CartVO list : " + cvo);
		System.out.println("Product list : " + pvoList);

		String clist = makeJsonCart(cvo);
		String plist = makeJsonProd(pvoList);

		System.out.println("응답 JSON Cart 리스트: " + clist);
		System.out.println("응답 JSON Product 리스트: " + plist);
		
		PrintWriter out = response.getWriter();
		out.print(clist + plist);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		System.out.println("--------- cartView post 실행 -----------");

		String mid = request.getParameter("mid");
		System.out.println("mid : " + mid);

		List<CartVO> list = CartDAO.cartSelectList(mid);
		
		System.out.println("list : " + list);

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

//		result.append("]}");
		
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
