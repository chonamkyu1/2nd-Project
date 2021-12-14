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
<head>
<meta charset="UTF-8">
<title>아이디 찾기 성공</title>
</head>
<body>
	<script>alert("아이디 찾기 성공")</script>
	<h1>아이디 찾기 성공</h1>
	<h3>사용한 아이디는 ${findIdvo.mid} 입니다.</h3>
	<form action="logIn" method="get" id="FormLogin" name="logInForm">
		<table border>
			<tr>
				<td>로그인</td>
			</tr>
			<tr>
				<td>ID: <input type="text" id="mid" name="mid" value="" placeholder="아이디를 입력해주세요." ></td>
			</tr>
			<tr>
				<td>PASSWORD: <input type="password" id="mpw" name="mpw" value="" placeholder="비밀번호를 입력해주세요."></td>
			</tr>
			<tr>
				<td>
					<input type="button" value="로그인" onclick="logIn_btn()">
					<input type="button" value="비회원 주문"  onclick="location.href='index.jsp'"> 
				</td>
			</tr>
			<tr>
				<td>
					<a href="findPassword.jsp">비밀번호찾기</a>
					<a href="joinMemberShip.jsp">회원가입</a>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>