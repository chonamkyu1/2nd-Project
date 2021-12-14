package com.bitElectro.controller;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.bitElectro.dao.CouponDAO;
import com.bitElectro.dao.MemberDAO;
import com.bitElectro.vo.CouponVO;
import com.bitElectro.vo.MemberVO;

@WebServlet("/couponInsert")
public class InsertCouponController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		//파라미터 받아오기
		String cname= req.getParameter("cname"); //쿠폰 이름
		String condition = req.getParameter("condition"); //발행 조건 (전체 아니면 일부)
		String cumulative_buy =  req.getParameter("sumPayNum"); //누적구매금액
		String cvalidity = req.getParameter("cvalidity"); //유효기간
		String discountWay = req.getParameter("discount"); //할인 방식
		String discountValue = req.getParameter("discValNum"); //할인율 혹은 금액
		String cdisper = null;
		String cdiscash = null;
		
		//할인방식에 따라서 지정이 필요
		if(discountWay.equals("ratio")) {
			//할인율의 경우
			 cdisper = discountValue;
			 cdiscash = "";
			
		}else if(discountWay.equals("krw")) {
			//할인금액의 경우
			 cdisper = "";
			 cdiscash = discountValue;	
		}
		
		//대상 고객의 리스트를 받아와야 한다.
		//condition이 모든 고객(allCust)인지 누적구매금(sumPay)으로 판단하는지 확인
		if(condition.equals("allCust")) {
			List<MemberVO> allList = MemberDAO.custList();
			for(MemberVO mvo : allList) {
				CouponVO cvo = new CouponVO();
				cvo.setCname(cname);
				cvo.setMid(mvo.getMid());
				cvo.setCdisper(cdisper);
				cvo.setCdiscash(cdiscash);
				cvo.setCvalidity(cvalidity);
				
				CouponDAO.insertCoupon(cvo);
			}
			
		}else {
			List<MemberVO> cumulativeList = MemberDAO.getCustListByCumul(cumulative_buy);
			System.out.println("cumulativeList : " + cumulativeList);
			for(MemberVO mvo : cumulativeList) {
				CouponVO cvo = new CouponVO();
				cvo.setCname(cname);
				cvo.setMid(mvo.getMid());
				cvo.setCdisper(cdisper);
				cvo.setCdiscash(cdiscash);
				cvo.setCvalidity(cvalidity);
				CouponDAO.insertCoupon(cvo);
			}
		}
		
		resp.sendRedirect("couponList.jsp");
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
}












