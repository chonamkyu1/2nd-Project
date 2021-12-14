<%@page import="com.bc.model.vo.LogInVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	LogInVO lvo = (LogInVO)request.getAttribute("findPWvo");
	System.out.println("lvo: " + lvo);
	pageContext.setAttribute("findPWvo", lvo);
	System.out.println("lvo: " + lvo);
%>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호찾기 성공여부</title>
<script>
	//alert("본인인증이 완료되었습니다.\n새로운 비밀번호를 입력해주세요.");

	function check() {
		var form = document.pwCheckForm
		if (form.updatepw.value.trim() == "") {
			alert("비밀번호를 입력해주세요.");
			return;
		}
		if (form.updatepwCheck.value.trim() == "") {
			alert("비밀번호를 한번 더 입력해주세요.");
			return;
		}
		
		if (form.updatepw.value != form.updatepwCheck.value) {
			alert("잘못입력하셨습니다. 다시 입력해주세요.")
			return;
			
		} else {
		 	form.submit();		
		}
		
	}	
</script>	
</head>
<body>
	 <div>
	<form action="findPWCheck" method="get" id="pwCheckForm" name="pwCheckForm">
		<p>
			비밀번호 재설정: <input type="password" id="updatepw" name="updatepw"> 
		</p>
		<p>
			비밀번호 재설정확인: <input type="password" id="updatepwCheck" name="updatepwCheck">
		</p>
			<input type="button" value="확인" onclick="check()">
			<input type="reset" value="초기화">
			
			<input type="hidden" id="mid" name="mid" value="${findPWvo.mid }">
		
	</form>
	</div> 
	
</body>
</html>