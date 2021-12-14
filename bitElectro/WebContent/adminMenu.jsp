<%@page import="com.bitElectro.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
 
//request.getParameter("loginAdmin");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BitElectro : 관리자페이지</title>
<!-- headTap.jsp로 연결 -->
<%@include file="headTap.jsp"%>
<!-- headTap 끝 -->
</head>
<body>
<table id="board">
	<tr>
		<td id="tdHead" colspan="7"><img src="img/none.jpg" width="100px"
			height="100px"></td>
	</tr>
	<tr>
		<td id="tdHead" colspan="7"><b>${loginAdmin.mid }님 접속중</b></td>
	</tr>
	<tr>
		<th><a href="#">상품정보관리</a></th>
		<td id="tdBottom"></td>
		<th><a href="#">사이트 정보관리</a></th>
		<td id="tdBottom"></td>
		<th><a href="#">고객 정보관리</a></th>
		<td id="tdBottom"></td>
		<th><a href="#">관리자 정보관리</a></th>
	</tr>
	<tr>
		<td><a href="insertProd.jsp">상품등록</a></td>
		<td id="tdBottom"></td>
		<td><a href="couponList.jsp">쿠폰 관리</a></td>
		<td id="tdBottom"></td>
		<td><a href="custList.jsp">고객정보리스트</a></td>
		<td id="tdBottom"></td>
		<td><a href="adminResister.jsp">관리자정보 등록</a></td>
	</tr>
	<tr>
		<td><a href="prodList.jsp">상품 수정/삭제</a></td>
		<td id="tdBottom"></td>
		<td><a href="saleAmount.jsp">매출 조회</a></td>
		<td id="tdBottom"></td>
		<td></td>
		<td id="tdBottom"></td>
		<td><a href="adminList.jsp">관리자정보 확인/수정</a></td>
	</tr>


</table>
</body>
</html>