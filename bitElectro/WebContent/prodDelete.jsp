<%@page import="com.bitElectro.dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String pcode = request.getParameter("pcode");
ProductDAO.deleteProd(pcode);

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 삭제 페이지</title>
<script>
alert("삭제가 완료되었습니다!");
location.href="prodList.jsp";
</script>
</head>
<body>
<h1>삭제 프로세스 제작 필요</h1>
</body>
</html>