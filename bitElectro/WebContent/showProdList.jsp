<%@page import="com.bitElectro.vo.CateProdVO"%>
<%@page import="com.bitElectro.vo.ProductVO"%>
<%@page import="java.util.List"%>
<%@page import="com.bitElectro.dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("UTF-8");
int cmain = Integer.parseInt(request.getParameter("cmain"));
System.out.println("cmain : " + cmain);
if(cmain == 1){
//best100 경우 상품 전체 리스트 불러오기
List<ProductVO> plist = ProductDAO.getProdList();
pageContext.setAttribute("plist", plist);
}else if(cmain == 2){
	List<CateProdVO> plist = ProductDAO.getProdListByCmain("대형가전");
	pageContext.setAttribute("plist", plist);
}else if(cmain == 3){
	List<CateProdVO> plist = ProductDAO.getProdListByCmain("계절가전");
	pageContext.setAttribute("plist", plist);
}else if(cmain == 4){
	List<CateProdVO> plist = ProductDAO.getProdListByCmain("컴퓨터");
	pageContext.setAttribute("plist", plist);
}else if(cmain == 5){
	List<CateProdVO> plist = ProductDAO.getProdListByCmain("휴대폰");
	pageContext.setAttribute("plist", plist);
}else{
	List<CateProdVO> plist = ProductDAO.getProdListByCmain("카메라");
	pageContext.setAttribute("plist", plist);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 리스트 | bitElectro</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%@include file="headWrap.jsp"%>
<!-- body 시작 -->
<body style="text-align:center;">
	<div id="container">
	  <div id="content">
	<h1 style="font-size: 3em;">Now on Sale</h1>
	
	<table id="prodItems" style="border : none; width:1060px;">
	<c:set var="i" value="0" /> <!-- 실제 반복할 숫자 -->
	<c:set var="j" value="4" /> <!-- 4개의 제품 출력 후 </tr> -->
	<c:forEach items="${plist }" var="pvo">
		<c:if test="${i%j == 0 }">
		<tr>
		</c:if>
		<td>
		<p><a href="prodCustView.jsp?pcode=${pvo.pcode }"><img src="./productImg/${pvo.pimage }" style="width:200px;"></a></p>
		<p><a href="prodCustView.jsp?pcode=${pvo.pcode }"><b>[ ${pvo.pname } ]</b></a></p>
		<p><a href="prodCustView.jsp?pcode=${pvo.pcode }"><b>￦_${pvo.pprice }</b></a></p>
		</td>

		
		<c:if test="${i%j == j-1 }">
		</tr> 
		</c:if>
		<c:set var="i" value="${i+1 }" />
	</c:forEach>
	</table>
	</div>
	</div>
</body>
<%@include file="footer.jsp" %>
</html>