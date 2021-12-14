<%@page import="com.bc.model.vo.LogInVO"%>
<%@page import="com.bc.model.dao.LogInDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<%
LogInVO vo =  (LogInVO)request.getAttribute("vo");
session.setAttribute("vo", vo);
%>

<html>
<head>
<meta charset="UTF-8">
<title>로그인성공</title>
</head>
<body>
	<script>
		alert("로그인에 성공하였습니다.")
		<%response.sendRedirect("mainMenu.jsp"); %>
	 	//location.href="mainMenu.jsp"; // 로그인 성공 시 메인페이지로 이동 
	 </script>
	 			
</body>
</html>