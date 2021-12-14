package com.bitElectro.controller;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.bitElectro.dao.CouponDAO;
import com.bitElectro.vo.CouponVO;

@WebServlet("/couponSearchName")
public class GetCouponListController extends HttpServlet{
	
	@Override

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	String keyword = req.getParameter("searchElement");
	
	//키워드 쿼리에서 LIKE 처리 하기 위한 작업
	keyword = "%"+keyword+"%";
	
	//해당 키워드의 쿠폰을 모두 불러옴.
	List<CouponVO> coupList = CouponDAO.getCouponAllList(keyword);
	
	
	System.out.println("coupList : " + coupList);
	
	//xml 작성
	
	StringBuilder result = new StringBuilder();
	String str="";
	str += "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";
	str += "<cpvos>";
	for(CouponVO cvo : coupList) {
		str += "<cpvo>";
		str += "<cordate>"+cvo.getCordate()+"</cordate>";
		str += "<cvalidity>"+cvo.getCvalidity()+"</cvalidity>";
		str += "<cname>"+cvo.getCname()+"</cname>";
		str += "<cdisper>"+cvo.getCdisper()+"</cdisper>";
		str += "<cdiscash>"+cvo.getCdiscash()+"</cdiscash>";
		str += "<custCnt>"+cvo.getCnt()+"</custCnt>";
		str += "</cpvo>";
	}
	str += "<cpvos>";
	result.append(str);
	resp.setCharacterEncoding("UTF-8");
	PrintWriter out = resp.getWriter();
	
	//////여기부터 확인!!!
	System.out.println(result.toString());
	out.write(result.toString());
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	doGet(req, resp);
	}
	
	
}
