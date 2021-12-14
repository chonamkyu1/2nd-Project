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
//String path = "C:\\MyStudy\\60_web\\bitElectroAdmin\\WebContent\\productImg"; //프로젝트내 폴더에 만들어 접근이 가능하도록 하자.

//파일을 불러오기 위한 MultipartRequest 객체
MultipartRequest mr = new MultipartRequest(request, //요청객체전달
		path, //실제 파일을 저장할 경로
		1024 * 1024 * 10, //업로드 파일의 최대 크기 (바이트단위임.)
		"UTF-8", //인코딩방식
		new DefaultFileRenamePolicy()//동일한 파일명이 있을 시 일련번호가 증가하면서 업로드 됨.
);

//파일을 제외한 파라미터값 불러오기
String pname = mr.getParameter("pname");
String categoryMain = mr.getParameter("categoryMain");
String categoryMid = mr.getParameter("categoryMid");
String categorySub = mr.getParameter("categorySub");
String pprice = mr.getParameter("pprice");
String pstock = mr.getParameter("pstock");

//파일 path 경로로 업로드 되면서 이름 확인 
String f_name_ori = mr.getOriginalFileName("f_name"); //원본 파일이름
String f_name_sys = mr.getFilesystemName("f_name"); //저장파일이름

String fd_name_ori = mr.getOriginalFileName("fd_name"); //원본 파일이름
String fd_name_sys = mr.getFilesystemName("fd_name"); //저장파일이름

//이미지를 불러올 주소값
String f_name_src = "productImg/"+ f_name_sys;
String fd_name_src = "productImg/"+ fd_name_sys;

//scope에 저장
pageContext.setAttribute("f_name", f_name_src);
pageContext.setAttribute("fd_name", fd_name_src);

//cno를 도출. 카테고리 테이블과 VO를 찾아내서 pcode생성할 준비
CategoryVO cvo = new CategoryVO(categoryMain, categoryMid, categorySub);
cvo = CategoryDAO.selectCT(cvo);
String cno = cvo.getCno();

//pvo등록 차례
ProductVO pvo = new ProductVO();

pvo.setPcode(cno); //mapper에서 PCODE시퀀스와 CNO를 합쳐 PCODE를 생성한다.
pvo.setCno(cno);
pvo.setPname(pname);
pvo.setPprice(pprice);
pvo.setPimage(f_name_sys);//썸네일 파일의 경로와 파일명을 합친 경로 f_name을 set함
pvo.setPstock(pstock);
pvo.setPdescription(fd_name_sys);//썸네일 파일의 경로와 파일명을 합친 경로 f_name을 set함

//세팅된 PVO를 DB에 INSERT함.
ProductDAO.insertProd(pvo);

//저장된 제품의 PVO불러오기
ProductVO pvo1 = ProductDAO.selectProdByName(pname);
pageContext.setAttribute("pvo", pvo1);
pageContext.setAttribute("cmain", categoryMain);
pageContext.setAttribute("cmiddle", categoryMid);
pageContext.setAttribute("csub", categorySub);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록 확인</title>
</head>
<body>
	<%@include file="headTap.jsp"%>
	<hr>
	<h1>상품 등록 완료</h1>
	<hr>
	<form action="" method="post" id="frm1">
		<table id="board">
			<thead>
				<tr>
					<td id="tdHead" colspan="2"><h2>등록된 상품 정보</h2></td>
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
					<td id="tdBottome" colspan="2">
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