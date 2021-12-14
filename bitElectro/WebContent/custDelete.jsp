<%@page import="com.bitElectro.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String mid = request.getParameter("mid");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 정보 삭제 페이지</title>
<script>
let answer = confirm("해당 고객 정보를 정말로 삭제하시겠습니까?");
if(answer){
<% 
MemberDAO.deleteCust(mid);

%>	
alert("고객정보의 삭제가 완료되었습니다.");
location.href="custList.jsp";
}else{
alert("고객정보의 삭제를 취소처리 하고 뒤로 돌아갑니다.");
history.back();	
}

</script>

</head>
<body>

</body>
</html>