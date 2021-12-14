<%@page import="com.bitElectro.vo.MemberVO"%>
<%@page import="com.bitElectro.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String mid = request.getParameter("mid");
MemberVO mvo = MemberDAO.getCustInfo(mid);

pageContext.setAttribute("mvo", mvo);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bitElectro : 고객 정보 수정</title>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function() {

		var userIdCheck = RegExp(/^[A-Za-z0-9_\-]{4,12}$/);
		var passwdCheck = RegExp(/^(?=.*[A-Za-z])(?=.*[0-9]).{8,16}$/);
		var nameCheck = RegExp(/^[가-힣]{2,6}$/);
		var juminCheck = RegExp(/^[0-9]{13,13}$/);

		$("#ok").click(function() {

			if (userIdCheck.test($("#mid").val())) { //아이디 검증
			} else {
				alert("아이디는 영문/숫자 4~12자이내로 입력해주세요");
				$("#mid").focus();
				return;
			}
			if (passwdCheck.test($("#mpw").val())) { //비밀번호 검증
			} else {
				alert("비밀번호는 영문과 숫자를 포함하여 8~16자로 입력해주세요");
				$("#mpw").focus();
				return;
			}
			if ($("#mpw").val() == ($("#mpw2").val())) { //비밀번호확인 검증
			} else {
				alert("2차 비밀번호가 다릅니다.");
				$("#mpw2").focus();
				return;
			}
			if (nameCheck.test($("#mname").val())) { //이름 검증
			} else {
				alert("이름은 한글로 2-6자이내로 입력");
				$("#mname").focus();
				return;
			}
			if ($("#mphone").val().length == 0) { //연락처 빈칸확인
				alert("연락처('-'제외)를 입력해주세요.");
				$("#mphone").focus();
				return;
			}
			if ($("#maddress").val().length == 0) { //주소 빈칸확인
				alert("주소를 입력해주세요.");
				$("#maddress").focus();
				return;
			}
			if (juminCheck.test($("#mjumin").val())) { //주민등록번호 검증

			} else {
				alert("주민등록번호는 숫자 13자리를 입력해주세요.");
				$("#mjumin").focus();
				return;
			}

			if (confirm("이대로 수정하시겠습니까?")) {
				//검증에 이상이 없으면 submit
				$("#frm1").submit();
			} else {
				$("#pwd2").focus();
				return;
			}

		});
	});
</script>

</head>
<body>
	<%@include file="headTap.jsp"%>

	<br>
	<br>

	<form action="custModify" method="post" id="frm1">
		<table id ="board" style="width:450px;">

			<tr>
				<td id="tdHead" colspan="2"><h1>고객 정보 수정</h1></td>
			</tr>
			<tr>
			<tr>
				<th>관리자ID</th>
				<td><input type="text" name="mid" id="mid" value="${mvo.mid }"
					readonly></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="mpw" id="mpw"
					value="${mvo.mpw }"></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input type="password" name="mpw2" id="mpw2"
					placeholder="password 확인 (영/숫자 8-16자리) 확인"></td>
			</tr>
			<tr>
				<th>관리자명</th>
				<td><input type="text" name="mname" id="mname"
					value="${mvo.mname }" readonly></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="mphone" id="mphone"
					value="${mvo.mphone }"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="maddress" id="maddress"
					value="${mvo.maddress }"></td>
			</tr>
			<tr>
				<th>주민등록번호</th>
				<td><input type="number" name="mjumin" id="mjumin"
					value="${mvo.mjumin }" readonly></td>
			</tr>
			<tr>
				<th>E-Mail</th>
				<td><input type="email" name="memail" id="memail"
					value="${mvo.memail }"></td>
			</tr>
			<tr>
				<td id="tdBottom" colspan="2"></td>
			</tr>
			<tr>
				<td id="tdBottom" colspan="2"><button type="button" id="ok" class="buttonBox">정보수정</button>&nbsp;&nbsp;&nbsp;&nbsp;
				<button class="buttonBox" type="button" onclick='javascript:history.back()'>취소</button></td>
			</tr>
		</table>
	</form>


	<script>
		
	</script>
</body>

</html>