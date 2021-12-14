
<%@page import="java.util.List"%>
<%@page import="com.bitElectro.vo.MemberVO"%>
<%@page import="com.bitElectro.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bitElectro : 관리자등록</title>
<script src = "http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(function(){
	//아이디 체크

	var userIdCheck = RegExp(/^[A-Za-z0-9_\-]{4,12}$/);
	var passwdCheck = RegExp(/^(?=.*[A-Za-z])(?=.*[0-9]).{8,16}$/);
	var nameCheck = RegExp(/^[가-힣]{2,6}$/);
	var juminCheck = RegExp(/^[0-9]{13,13}$/);

	
	$("#ok").click(function(){

			if($("#mid").val().trim() == ""){//아이디 검증
				alert("ID가 공란입니다.");
				$("#mid").focus();
				return;
			}
			if(userIdCheck.test($("#mid").val())){ 
			}else{
				alert("아이디는 영문/숫자 4~12자이내로 입력해주세요");
				$("#mid").focus();
				return;
			}
			if($("#mpw").val().trim() == ""){//비밀번호 검증
				alert("비밀번호가 공란입니다.");
				$("#mpw").focus();
				return;
			}
			if(passwdCheck.test($("#mpw").val())){ 
			}else{
				alert("비밀번호는 영문과 숫자를 포함하여 8~16자로 입력해주세요");
				$("#mpw").focus();
				return;
			}
			if($("#mpw").val()==($("#mpw2").val())){ //비밀번호확인 검증
			}else{
				alert("2차 비밀번호가 다릅니다.");
				$("#mpw2").focus();
				return;
			}
			if($("#mname").val().trim() == ""){//이름 검증
				alert("이름이 공란입니다.");
				$("#mname").focus();
				return;
			}
			if(nameCheck.test($("#mname").val())){ 
			}else{
				alert("이름은 한글로 2-6자이내로 입력");
				$("#mname").focus();
				return;
			}
			if($("#mphone").val().trim() == ""){//연락처 검증
				alert("연락처가 공란입니다.");
				$("#mphone").focus();
				return;
			}
		
			if($("#maddress").val().trim() == ""){ //주소 빈칸확인
				alert("주소를 입력해주세요.");
				$("#maddress").focus();
				return;
			}
			
			if($("#mjumin").val().trim() == ""){ //주민번호 빈칸확인
				alert("주민번호를 입력해주세요.");
				$("#mjumin").focus();
				return;
			}
			if(juminCheck.test($("#mjumin").val())){ //주민등록번호 검증
				
			}else{
				alert("주민등록번호는 숫자 13자리를 입력해주세요.");
				$("#mjumin").focus();
				return;
			}
			
			if(confirm("위 정보로 등록하시겠습니까?")){
				//검증에 이상이 없으면 submit
				$("#frm1").submit();
			}else{
				$("#frm1 input").val("");
				$("#mid").focus();
				return;
			}
			
		
	 }); 

});

	
	


</script>
<%@include file="headTap.jsp"%>
</head>
<body>

<div id="container">
<form action="adminResist" method="post" id="frm1">
<table id="board" style="border:none">
<tr><td colspan="2" id="tdHead"><h1>관리자 정보 등록</h1></td></tr>
</table>
<table id="board">
<tr>
<th>관리자ID</th><td><input type="text" name="mid" id ="mid"placeholder="ID(영/숫자 4-12자리) 입력"></td>
</tr>
<tr>
<th>비밀번호</th><td><input type="password" name="mpw" id ="mpw"placeholder="Password(영/숫자 8-16자리) 입력"></td>
</tr>
<tr>
<th>비밀번호 확인</th><td><input type="password" name="mpw2" id ="mpw2"placeholder="password(영/숫자 8-16자리) 확인"></td>
</tr>
<tr>
<th>관리자명</th><td><input type="text" name="mname" id ="mname"placeholder="이름(한글만) 입력" ></td>
</tr>
<tr>
<th>전화번호</th><td><input type="text" name="mphone" id ="mphone"placeholder="전화번호(숫자만) 입력"></td>
</tr>
<tr>
<th>주소</th><td><input type="text" name="maddress" id ="maddress"placeholder="주소 입력"></td>
</tr>
<tr>
<th>주민등록번호</th><td><input type="number" name="mjumin" id ="mjumin" placeholder="(-)를 제외한 숫자 13자리"></td>
</tr>
<tr>
<th>E-Mail</th><td><input type="email" name="memail" id ="memail" placeholder="이메일 입력"></td>
</tr>
<tr><td colspan="2" id="tdBottom"></td></tr>
<tr>
	<td id="tdBottom" style="margin-left:auto" colspan="2">
	<button type = "button" id ="ok" class="buttonBox">관리자 등록</button>&nbsp;&nbsp;&nbsp;&nbsp;
	<button class="buttonBox" onclick='javascript:location.href="adminMenu.jsp"' type="button">취소</button></td>
</tr>
</table>
</form>

</div>
<script>

</script>
</body>

</html>