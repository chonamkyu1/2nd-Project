<%@page import="com.bitElectro.dao.CategoryDAO"%>
<%@page import="com.bitElectro.vo.CategoryVO"%>
<%@page import="com.bitElectro.vo.ProductVO"%>
<%@page import="com.bitElectro.dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%

request.setCharacterEncoding("UTF-8");

String pcode = request.getParameter("pcode");
String cno = request.getParameter("cno");

System.out.println("pcode : " + pcode);
System.out.println("cno : " + cno);

//전달받은 파라미터로 pvo, cvo 찾기
ProductVO pvo = ProductDAO.selectProd(pcode);
CategoryVO cvo = CategoryDAO.selectCategory(cno);

//pvo, cvo Scope에 저장
pageContext.setAttribute("pvo", pvo);
pageContext.setAttribute("cvo", cvo);

/* System.out.println(">> pvo :" + pvo);
System.out.println(">> cvo :" + cvo); */

//이미지 주소
String localPath = "productImg/";
String thumbPath = localPath + pvo.getPimage();
//System.out.println(">> thumbPath :" + thumbPath);
String descPath = localPath + pvo.getPdescription();
//System.out.println(">> descPath :" + descPath);

System.out.println("localPath : " + localPath);
System.out.println("thumbPath : " + thumbPath);
System.out.println("descPath : " + descPath);

//이미지 주소 Scope에 저장
pageContext.setAttribute("thumbPath", thumbPath);
pageContext.setAttribute("descPath", descPath);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bitElectro : 상품 상세보기</title>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
function prodDelete(){ //삭제시 함수
	let answer = confirm("[${pvo.pname}] 상품을 삭제하시겠습니까?");
	if(answer){
	location.href="prodDelete.jsp?pcode=${pvo.pcode }";
	}
}
</script>
</head>
<body>
	<%@include file="headTap.jsp"%>

	<form method="post" id="frm1">
			<table id="board" style="width:400px;">
			<thead>
				<tr>
				<td id="tdHead" colspan="2">
				<button class="buttonBox" type="button" onclick="javascript:location.href='prodModify.jsp?pcode=${pvo.pcode }'">상품수정</button>&nbsp;&nbsp;
				<button class="buttonBox" type="button" onclick="prodDelete()">상품삭제</button>&nbsp;&nbsp;
				<button class="buttonBox" type="button" onclick="javascript:location.href='prodList.jsp'">목록으로</button>
				
				</td>
				</tr>
				<tr>
					<th colspan="2">제품이미지</th>
				</tr>
				<tr>
					<td colspan="2"><img src="${thumbPath }" width="250px"
						height="150px"></td>
				</tr>
			</thead>

			<tbody>
				<tr>
					<th>대분류</th>
					<td>${cvo.cmain }</td>
				</tr>

				<tr>
					<th>중분류</th>
					<td>${cvo.cmiddle }</td>
				</tr>

				<tr>
					<th>소분류</th>
					<td>${cvo.csub }</td>
				</tr>

				<tr>
					<th>제품코드(PCODE)</th>
					<td>${pvo.pcode }</td>
				</tr>

				<tr>
					<th>제품명</th>
					<td>${pvo.pname }</td>
				</tr>

				<tr>
					<th>제품가격(Krw)</th>
					<td>${pvo.pprice }</td>
				</tr>

				<tr>
					<th>재고수량(EA)</th>
					<td>${pvo.pstock }</td>
				</tr>

				<tr>
					<th>제품할인율</th>
					<td>${pvo.pdiscount }</td>
				</tr>

				<tr>
					<th>최종수정일</th>
					<td>${pvo.pregist }</td>
				</tr>

				<tr>
					<th>누적판매량(EA)</th>
					<td>${pvo.pcumulative_sales }</td>
				</tr>

				<tr>
					<th>구매평점</th>
					<td>${pvo.preating }</td>
				</tr>

				<tr>
					<th>등록 리뷰 수</th>
					<td>${pvo.preview_count }</td>
				</tr>

				<tr>
					<th colspan="2">상세 페이지 이미지</th>
				</tr>

				<tr>
					<td colspan="2">
					<img src="${descPath }" width="350px">
					</td>
				</tr>

			</tbody>
		</table>
		
	</form>
</body>
</html>

