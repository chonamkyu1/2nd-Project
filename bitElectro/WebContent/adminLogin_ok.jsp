<%@page import="com.bitElectro.dao.MemberDAO"%>
<%@page import="com.bitElectro.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% 
String mid = request.getParameter("mid");
String mpw = request.getParameter("mpw");

boolean loginOk = MemberDAO.validateUser(mid, mpw);

if(loginOk){
	//mid와 동일한 VO를 찾아서 session에 VO통째로 연결시키고
	session.setAttribute("loginAdmin",MemberDAO.getUserInfo(mid)); //연결확인
	//해당 session정보를 가지고 main페이지로 sendRedirect할 것.
	response.sendRedirect("adminMenu.jsp");
	
}else{
	//아니라면 alert("아이디 혹은 비밀번호를 확인하여주십시오");
	//출력 후 다시 로그인화면으로 복귀
	%>
	
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BitElectro:관리자 로그인 처리</title>
	<script>
	alert("아이디 혹은 비밀번호가 잘못되었습니다.");
	history.back();
	</script>
	<%	
}

%>
</head>
<body>
</body>
</html>