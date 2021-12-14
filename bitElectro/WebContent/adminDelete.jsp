<%@page import="com.bitElectro.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<script>
let answer = confirm("요청하신 정보를 정말로 삭제합니까?");
if(answer){ //confirm "확인"일 경우 삭제 진행.
<%
String mid = request.getParameter("mid");
MemberDAO.deleteAdmin(mid);

%>
alert("요청하신 정보가 삭제되었습니다.");
location.href="adminList.jsp";
}else{ //confirm "취소"일 경우 뒤로가기
	alert("삭제취소");
history.back();
}

</script>
<meta charset="UTF-8">
<title>관리자 삭제</title>
</head>
<body>

</body>
</html>