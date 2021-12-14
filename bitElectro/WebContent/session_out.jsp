<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
session.setAttribute("vo", null);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session out</title>
<script>
alert("로그아웃 되었습니다!");
location.href="mainMenu.jsp";
</script>
</head>
<body>

</body>
</html>