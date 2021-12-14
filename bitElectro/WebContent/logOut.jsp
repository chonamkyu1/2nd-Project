<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 session.setAttribute("loginUser", null);
 %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그아웃</title>
 <script>
 alert("정상적으로 로그아웃되었습니다!");
 location.href="mainMenu.jsp";
 </script>
</head>
<body>

</body>
</html>