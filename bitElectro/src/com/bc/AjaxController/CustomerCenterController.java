package com.bc.AjaxController;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.common.Paging;
import com.bc.model.dao.NoticeDAO;
import com.bc.model.vo.NoticeVO;

@WebServlet("/csController")
public class CustomerCenterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		System.out.println(">> CustomerCenterController doGet() 실행~~");
		String category = request.getParameter("category");
		System.out.println("> category : " + category);
		
		int ccategory = 0;
		
		if ("notice".equals(category)) {
			ccategory = 1;
		} else if ("faq".equals(category)) {
			ccategory = 2;
		} else if ("inquire".equals(category)) {
			ccategory = 3;
		}

		//페이징 처리를 위한 Paging 객체 생성해서 값 읽고 설정
		Paging p = new Paging();
		
		System.out.println("ccategory 1번째 : " + ccategory);
		
		//1. 전체 게시물의 수량 구하기	
		p.setTotalRecord(NoticeDAO.getTotalCount(ccategory)); 
		p.setTotalPage();
		System.out.println("> 전체 게시글 수 : " + p.getTotalRecord());
		System.out.println("> 전체 페이지 수 : " + p.getTotalPage());
		
		//2. 현재 페이지 구하기
		String cPage = request.getParameter("cPage");

		System.out.println("> cPage  : " + cPage);

		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}
		System.out.println("> cPage : " + cPage);
		System.out.println("> paging nowPage : " + p.getNowPage());
		
		//3. 현재 페이지에 표시할 게시글 시작번호(begin), 끝번호(end) 구하기
		p.setEnd(p.getNowPage() * p.getNumPerPage()); //현재페이지번호 * 페이지당게시글 수
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1);
		
		//(선택적) 3-1. 끝 번호가 데이터 건수보다 많아지면 데이터 건수와 동일한 번호로 설정
		if (p.getEnd() > p.getTotalRecord()) {
			p.setEnd(p.getTotalRecord());
		}
		System.out.println(">> 시작번호(begin) : " + p.getBegin());
		System.out.println(">> 끝번호(end) : " + p.getEnd());
		
		//---- 블록(block) 계산하기 ----------------
		//4. 블록의 시작페이지, 끝페이지 구하기(현재페이지 번호 사용)
		//시작페이지 구하기
		int nowPage = p.getNowPage();
		int beginPage = (nowPage - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1;
		p.setBeginPage(beginPage);
		p.setEndPage(p.getBeginPage() + p.getPagePerBlock() - 1);
	
		//4-1. 끝페이지(endPage)가 전체페이지 수(totalPage) 보다 크면
		// 끝페이지를 전체페이지 수로 변경 처리
		if (p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}
		System.out.println(">> beginPage : " + p.getBeginPage());
		System.out.println(">> endPage : " + p.getEndPage());
	
		//2. DB에서 데이터 가져오기
		List<NoticeVO> list = NoticeDAO.getList(p.getBegin(), p.getEnd(), ccategory);
				
		String result = makeJson(list);
		String plist = makePage(p);

		System.out.println("응답 JSON 문자열: " + result);
		System.out.println("응답 JSON 페이지 문자열: " + plist);

		// jsp로 json 데이터 리턴 
		PrintWriter out = response.getWriter();
		out.print(result + plist);
		System.out.println("ccategory 마지막 확인 : " + ccategory);
	
//		request.getRequestDispatcher(result).forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println(">> CustomerCenterController doPost() 실행-----------------");
		req.setCharacterEncoding("UTF-8");
		doGet(req, resp);
	}
	
	private String makeJson(List<NoticeVO> list) {
		
		//JSON 형태 문자열로 바꾸기
		StringBuilder result = new StringBuilder();
		result.append("{ \"list\" : [");	
		
		for (NoticeVO vo : list) {
			result.append("{");
			result.append("\"cno\" : " + vo.getCno() + ",");
			result.append("\"rnum\" : " + vo.getRnum() + ",");
			result.append("\"csubject\" : \"" + vo.getCsubject() + "\",");
			result.append("\"ccontent\" : \"" + vo.getCcontent() + "\",");
			result.append("\"csecret\" : " + vo.getCsecret() + ",");
			result.append("\"cimage\" : \"" + vo.getCimage() + "\",");
			result.append("\"csecret\" : " + vo.getCsecret() + ",");
			result.append("\"crdate\" : \"" + vo.getCrdate() + "\",");
			result.append("\"ccategory\" : \"" + vo.getCcategory() + "\",");
			result.append("\"cstatus\" : \"" + vo.getCstatus() + "\"");
			result.append("},");
		}
		result.delete(result.length() - 1, result.length());
		result.append("],");

//		result.append("]}");
		
		return result.toString();
	}
	
	private String makePage(Paging vo) {
		
		StringBuilder result = new StringBuilder();
		
		result.append("\"plist\" : [");
			result.append("{");
			result.append("\"Begin\" : " + vo.getBegin() + ",");
			result.append("\"BeginPage\" : " + vo.getBeginPage() + ",");
			result.append("\"End\" : \"" + vo.getEnd() + "\",");
			result.append("\"EndPage\" : \"" + vo.getEndPage() + "\",");
			result.append("\"NowBlock\" : " + vo.getNowBlock() + ",");
			result.append("\"NowPage\" : \"" + vo.getNowPage() + "\",");
			result.append("\"NumPerPage\" : " + vo.getNumPerPage() + ",");
			result.append("\"PagePerBlock\" : \"" + vo.getPagePerBlock() + "\",");
			result.append("\"TotalBlock\" : \"" + vo.getTotalBlock() + "\",");
			result.append("\"TotalPage\" : \"" + vo.getTotalPage() + "\",");
			result.append("\"TotalRecord\" : \"" + vo.getTotalRecord() + "\"");
			result.append("}");
		result.append("]}");
					
		return result.toString();
	}
	
}
