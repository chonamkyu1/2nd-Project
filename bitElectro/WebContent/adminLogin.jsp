<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
System.out.println("session.getAttribute(\"vo\") : " + session.getAttribute("vo"));
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BitElectro:관리자 로그인</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script>

</script>
</head>
<body>
<hr>
<h1 class="center">bitElectro : 관리자모드</h1>
<div id="container">
<form action="adminLogin" method="post">
<br><br>
<p><b>ADMIN ID</b></p>
<input type="text" name="mid" placeholder="id를 입력해주세요"><br><br>
<p><b>PASSWORD</b></p>
<input type="password" name="mpw" placeholder="password를 입력해주세요"><br><br>
<p><button class= "buttonBox" onclick="document.form.submit()">로그인</button>
<button class="buttonBox" type="button" onclick="javascript:history.back()">취소</button>
</form>
</div>
</body>
</html>