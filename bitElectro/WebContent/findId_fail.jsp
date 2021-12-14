<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%

	request.setCharacterEncoding("UTF-8");
	String mname = request.getParameter("mname");
	String mphone = request.getParameter("mphone");

%>    
<!DOCTYPE html>
<html>
<script>
		
		alert("잘못입력하셨습니다. 다시입력해주세요.");
		history.go(-1);
	</script>	
<head>
<meta charset="UTF-8">
<title>아이디 찾기 실패</title>
</head>
<body>
	
	
</body>
</html>