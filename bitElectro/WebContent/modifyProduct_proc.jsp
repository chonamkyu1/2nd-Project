<%@page import="com.bitElectro.dao.ProductDAO"%>
<%@page import="com.bitElectro.vo.ProductVO"%>
<%@page import="com.bitElectro.dao.CategoryDAO"%>
<%@page import="com.bitElectro.vo.CategoryVO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//한글 인코딩
request.setCharacterEncoding("UTF-8");


////////////////////////////////////
//파일을 저장하고 저장된 파일의 주소값을 저장하는 작업

String path = this.getServletContext().getRealPath("/productImg"); // realPath를 받아오는 방법*/
System.out.println("path : "+path);
//String path = "C:\\Mystudy\\2ndProject\\WebContent\\productImg\\"; //프로젝트내 폴더에 만들어 접근이 가능하도록 하자.

//System.out.println(">> 저장위치 : " + path);

//파일을 불러오기 위한 MultipartRequest 객체
MultipartRequest mr = new MultipartRequest(request, //요청객체전달
		path, //실제 파일을 저장할 경로
		1024 * 1024 * 10, //업로드 파일의 최대 크기 (바이트단위임.)
		"UTF-8", //인코딩방식
		new DefaultFileRenamePolicy()//동일한 파일명이 있을 시 일련번호가 증가하면서 업로드 됨.
);

//파일을 제외한 파라미터값 불러오기
String pcode = mr.getParameter("pcode");
String pname = mr.getParameter("pname");
String categoryMain = mr.getParameter("categoryMain");
String categoryMid = mr.getParameter("categoryMid");
String categorySub = mr.getParameter("categorySub");
String pprice = mr.getParameter("pprice");
String pstock = mr.getParameter("pstock");
String pdiscount = mr.getParameter("pdiscount");

//파일 path 경로로 업로드 되면서 이름 확인 
String f_name_sys = mr.getFilesystemName("f_name"); //썸네일 저장파일이름
String fd_name_sys = mr.getFilesystemName("fd_name"); //상세페이지 저장파일이름

//cno를 도출. 카테고리 테이블과 VO를 찾아내서 pcode생성할 준비

CategoryVO cvo = new CategoryVO(categoryMain, categoryMid, categorySub);
cvo = CategoryDAO.selectCT(cvo);
String cno = cvo.getCno();

//pvo등록 차례
ProductVO pvo = new ProductVO();
pvo.setPcode(pcode); //이전페이지에 승계받은 pcode
pvo.setCno(cno);
pvo.setPname(pname);
pvo.setPprice(pprice);
pvo.setPstock(pstock);
pvo.setPdiscount(pdiscount);

///썸네일을 Update 했을 경우

if (f_name_sys != null) {
	pvo.setPimage(f_name_sys);
	ProductDAO.updateF_name(pvo); //f_name만 DB에 업로드
}

///상세페이지를 Update 했을 경우
if (f_name_sys != null) {
	pvo.setPdescription(fd_name_sys);
	ProductDAO.updateFd_name(pvo);//fd_name만 DB에 업로드
}

//그 외 다른 정보 Update

//세팅된 PVO를 DB에 UPDATE함.
ProductDAO.updateProd(pvo);
pageContext.setAttribute("pvo", pvo);
pageContext.setAttribute("cmain", categoryMain);
pageContext.setAttribute("cmiddle", categoryMid);
pageContext.setAttribute("csub", categorySub);

//이미지를 불러오는 작업

//DB에 저장된 PCODE로 PVO 불러오기
System.out.println(">>pcode : " + pcode);
pvo = ProductDAO.selectProd(pcode);
System.out.println(">>pvo : " + pvo);

//파일의 저장위치 path + pvo에 있는 이미지의 f_name을 합쳐 경로 제작.

String f_name_src = path +"/"+ pvo.getPimage();
String fd_name_src = path +"/"+ pvo.getPdescription();

pageContext.setAttribute("f_name", f_name_src);
pageContext.setAttribute("fd_name", fd_name_src);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정 확인</title>
</head>
<body>
	<%@include file="headTap.jsp"%>

	<h1>상품 등록 완료</h1>
	<hr>
	<form action="" method="post" id="frm1">
			<table id="board">
				<thead>
					<tr>
						<td colspan="2"><h2>수정된 상품 정보</h2></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>제품명</th>
						<td>${pvo.pname }</td>
					</tr>
					<tr>
						<th>제품 카테고리</th>
						<td>${cmain }> ${cmiddle } > ${csub }</td>
					</tr>
					<tr>
						<th>판매가격</th>
						<td>${pvo.pprice } 원(krw)</td>
					</tr>
					<tr>
						<th>재고수량</th>
						<td>${pvo.pstock } 대(EA)</td>
					</tr>
					<tr>
						<th>썸네일 이미지</th>
						<td><img src="${f_name }" class="thumb"></td>
					</tr>
					<tr>
						<th>상세페이지 이미지</th>
						<td><img src="${fd_name }" class="desc"></td>
					</tr>
					<tr>
						<td colspan="2">
							<button type="button" class="buttonBox"
								onclick="javascript:location.href='prodList.jsp'">상품리스트</button>
							<button type="button" class="buttonBox"
								onclick="javascript:location.href='prodModify.jsp?pcode=${pvo.pcode}'">상품수정</button>
							<button type="button" class="buttonBox"
								onclick="javascript:location.href='prodDelete.jsp?pcode=${pvo.pcode}'">상품삭제</button>
							<button type="button" class="buttonBox"
								onclick="javascript:location.href='adminMenu.jsp'">메인메뉴</button>
						</td>
					</tr>

				</tbody>
				<tfoot>
				</tfoot>
			</table>
		
	</form>
</body>
</html>