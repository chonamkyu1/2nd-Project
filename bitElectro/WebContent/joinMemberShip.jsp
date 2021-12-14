<%@page import="com.bc.model.vo.LogInVO"%>
<%@page import="java.util.List"%>
<%@page import="com.bc.model.dao.LogInDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- <%		
		int result = LogInDAO.idCheck("mid");
		pageContext.setAttribute("result", result);
		System.out.println("result: " + result);
		
		List<LogInVO> list = LogInDAO.getList();
		pageContext.setAttribute("list", list);
		
		 session.setAttribute("list", list);
		System.out.println("list: " + list);
%>
	<c:forEach var="vo" items="${list }">
		${vo.mid }
	</c:forEach> --%>
<!DOCTYPE html>
<%
response.setContentType("text/html;charset=UTF-8");
response.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입()joinMemberShip)</title>
<script src=https://code.jquery.com/jquery-3.6.0.min.js></script>
<title>초간단 테이블</title>
<script>
	
	 function join_btn() {
		 
		 var RegExp = /^[a-zA-Z0-9]{4,12}$/; // 아이디 유효성 검사 (비밀번호도)
		 var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/; // 이메일 유효성 검사
		 var nameExp = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/; // 이름 유효성 검사
		 var jumin = /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-4][0-9]{6}$/; // 주민등록번호
		 
		var form = document.joinMemberShipForm
		if (!form.mid.value) {
			alert("아이디를 입력해주세요.");
			return;
		}
		
		// id값 4~12 자리 이내에 작성
		if (!RegExp.test(form.mid.value)) {
			alert("4~12자리 영문대소문자와 숫자로만 입력해주세요.");
			form.mid.value == "";
			return;
		}
		 
		// id와 비밀번호 값이 같을 경우
		if (form.mid.value == form.mpw.value) {
			alert("ID와 비밀번호가 같습니다. 다시 입력해주세요.");
			return ;
		}
		
		if (!form.mpw.value) {
			alert("비밀번호를 입력해주세요.");
			return;
		}
		
		if (!form.mpw_check.value) {
			alert("비밀번호를 한번 더 입력해주세요.");
			return;
		}
		
		if (form.mpw.value != form.mpw_check.value) {
			alert("비밀번호가 다릅니다. 다시 입력해주세요.");
			return;
		}
		
		if (!form.mname.value) {
			alert("이름을 입력해주세요.");
			return;
		}
		
		// 이름 형식이 다를경우(영어가 섞여있을 때 )
		if(nameExp.test(form.mname.value) == false) {
			alert("이름 형식이 맞지 않습니다. 다시 입력해주세요.");
			return;
		}
		
		if (!form.mphone.value) {
			alert("전화번호를 입력해주세요.");
			return;
		}
		if (!form.mjumin.value) {
			alert("주민등록번호를 입력해주세요.");
			return;
		}
		
		if (!jumin.test(form.mjumin.value)) {
			alert("주민등록번호 형식에 맞게 입력해주세요.");
			return;
		}
		
		if (!form.maddress.value) {
			alert("주소를 입력해주세요.");
			return;
		}
		
		if (!form.memail.value) {
			alert("이메일을 입력해주세요.");
			return;
		}
		if (exptext.test(form.memail.value) == false) {
			alert("이메일형식이 맞지 않습니다.");
			return;
		}
		
		
		
		form.submit();
	} 
</script>	 
	 
<script>	 
	
	 $(function(){
		 $("#idCheck").on("click", function(){
			 var mid = $("#mid").val();
			 console.log("mid_click!!");
			 $.ajax({
				 uri: "midCheck",
				 type: "get",
				 data: {mid: mid},
				 success: function(data) {
					 //alert("Ajax 처리 성공 -응답받은데이터: " + data.mid)
					 console.log(data);
					 let idCheck = JSON.parse(data);
					 if (idCheck.mid == 0) {
						 alert("중복된 아이디가 없습니다.");
						 //$("#notice").css("color", "blue").text("사용가능한 아이디입니다.");
					 } else {
						 alert("이미 사용중인 아이디가 있습니다.");
						 //$("notice").css("color", "red").text("이미 사용중인 아이디입니다,");
					 }
				 },
				 error: function(data) {
					 alert("Ajax 처리 실패")
					console.log(data);					 
				 }
			 });
			 
		 });
	 }); 
	
	 // 아이디 중복검사
	/*  function idCheck_btn() {
		 
		 let idCheck = document.getElementById("mid");
		 idCheck.action = "midCheck";
		 
		 idCheck.submit();
	 }  */

	
	
	 // 전화번호 하이픈 처리
	function inputPhoneNumber(obj) {
		 var number = obj.value.replace(/[^0-9]/g, "");
		 var phone = "";
		 
		 if(number.length < 4) {
		        return number;
		    } else if(number.length < 7) {
		        phone += number.substr(0, 3);
		        phone += "-";
		        phone += number.substr(3);
		    } else if(number.length < 11) {
		        phone += number.substr(0, 3);
		        phone += "-";
		        phone += number.substr(3, 3);
		        phone += "-";
		        phone += number.substr(6);
		    } else {
		        phone += number.substr(0, 3);
		        phone += "-";
		        phone += number.substr(3, 4);
		        phone += "-";
		        phone += number.substr(7);
		    }
		    obj.value = phone;
		}
	 
</script>	 
	 <!-- 생년월일 폼 --> 
<!-- <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		  $("#mjumin").datepicker({
		    	dateFormat : 'yy-mm-dd',
		    	monthNames : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    	showMonthAfterYear : true,
		    	yearSuffix : '년',
		    	showOtherMonths : true,
		    	dayNamesMin:['일','월','화','수','목','금','토']
		    });
	}); 
	
</script> -->
<%@include file="headWrap.jsp" %>

<body style="text-align: center;">
	
	 <div id="container">
	 <div id="content">
	 	<br><br><br><br><br>
	 	<h1>회원가입</h1>
		<form action="joinMemberShip" method="post" id="joinMemberShipForm" name="joinMemberShipForm">
				<table id="prodItems" style="position:relative; top:120px; left:260px;">
				<tr>
				<td>
					<label>아이디<b style="color: red">*</b></label>
				</td>	
				<td>
					<input type="text" name="mid" id="mid" class="formControl" maxlength="12" ><br>
					<input type="button" id="idCheck" name= "idCheck" class="utilMenuOne" value="중복확인" >
				</td>
				<td>
					  <small>4~12자리의 영문 대소문자와 숫자로만 입력 &nbsp;&nbsp;&nbsp;</small> 
				</td>
				</tr>
				<tr>
				<td>
					<label>비밀번호<b style="color: red">*</b></label>
				</td>
				<td>
					<input type="password" name="mpw" id="mpw" class="formControl" maxlength="12" >
				</td>
				<td>
					<small>4~12자리의 영문 대소문자와 숫자로만 입력</small>
				</td>
				</tr>
				<tr>
				<td>
				 	<label>비밀번호확인<b style="color: red">*</b></label>
				</td>
				<td>
					<input	type="password" name="mpw_check" id="mpw_check" class="formControl" maxlength="12"  onclick="confirm_pw()"> 
				</td>
				<td></td>
				<tr>
				<td>
					<label>이름<b style="color: red">*</b></label>
				</td>
				<td>
					<input	type="text" name="mname" id="mname" class="formControl" >
				</td>
				<td></td>
				</tr>
				<tr>
				<td>
					<label>전화번호<b style="color: red">*</b></label>
				</td>
				<td>
					<input type="text" name="mphone" id="mphone" class="formControl" onkeyup="inputPhoneNumber(this);"  maxlength="13" placeholder="000-0000-0000" >
				</td>
				<td></td>
				</tr>
				<tr>
				<td>
					<label>주민등록번호<b style="color: red">*</b></label>
				</td>
				<td> 
					<input	type="text" name="mjumin" id="mjumin" class="formControl" maxlength="14">
				</td>
				<td>	
					<small>예)123456-1234567</small>
				</td>
				<td></td>
				</tr>
				<tr>
				<td>
					<label>주소<b style="color: red">*</b></label>
				</td>
				<td>
					<input type="text" name="maddress" id="maddress" class="formControl" >
				</td>
				<td></td>
				</tr>
				<tr>
				<td>
					<label>이메일<b style="color: red">*</b></label>
				</td>
				<td>
					<input type="text" name="memail" id="memail" class="formControl" >
				</td>
				<td>
					<small>예)id@domain.com</small>
				</td>
				</tr>
				<tr>
				<td colspan="3">
				<input type="button" value="회원가입" class="utilMenuOne" onclick="join_btn()">
				<input type="reset" value="초기화" class="utilMenuOne">
				<input type="button" value="처음으로" onclick="location.href='mainMenu.jsp'" class="utilMenuOne">
				<input type="hidden" name="mpoint" id="mpoint" value="0">
				<input type="hidden" name="mcumulative_buy" id="mcumulative_buy" value="0">
				<input type="hidden" name="mjoindate" id="mjoindate" value="SYSDATE">
				<input type="hidden" name="mclass" id="mclass" value="2">
				</td>
				</tr>				
			</table>
			</form>
		</div>
	</div>
	
</body>
<%@include file="footer.jsp" %>
</html>


<!--  회원가입 연습하는데 아이디에 한글로 입력하면 오류가난다. -->


<!--  	$(function(){
		
	// 아이디, 비밀번호, 비밀번호확인, 이름, 전화번호, 생년월일, 주소, 이메일  정규식
	var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	var getCheck = RegExp(/^[a-zA-Z0-9]{4,12}$/);
	var getName = RegExp(/^[가-힣]+$/);

	// 아이디 칸 공백 일 떄 
	$("#mid").click(function(){
		if ($("#mid").val() == "") {
			alert("아이디를 입력해주세요");
			$("#mid").focus;
			return false;
		}
	});

	// 아이디 유효성 검사
	if (!getCheck.test($("#mid").val())) {
		alert("잘못입력하셨습니다. 형식에 맞게 입력해주세요.");
		$("#mid").val(""); // 공백처리
		$("#mid").focus;
		return false;
	}

	// 비밀번호 칸 공백일 때
	$("#mpw").click(){
		if ($("#mpw").val() == "") {
			alert("비밀번호를 입력해주세요");
			$("#mpw").focus;
			return false;
		}
		
	};

	// 비밀번호가 아이디랑 같을 떄
	if ($("#mpw").val() == ($("#mid").val())) {
		alert("아이디와 비밀번호가 같습니다. 다시 입력해주세요.");
		$("mpw").val("");
		$("#mpw").focus;
		return false;
	}

	// 비밀번호 유효성 검사 
	if (!getCheck.test($("#mpw").val())) {
		alert("잘못입력하셨습니다. 형식에 맞게 입력해주세요.");
		$("#mpw").val(""); // 공백처리
		$("#mpw").focus;
		return false;
	}

	// 비밀번호 , 비밀번호 확인 
	if ($("#mpw").val != $("#mpw_check").val()) {
		alert("비밀번호가 다릅니다. 다시입력해주세요.");
		$("#mpw").val("");
		$("#mpw_check").val("");
		$("#mpw").focus();
		return false;
	}
	
	// 이름칸이 공백일 때
	if ($("#mname").val() == "") {
		alert("이름을 입력해주세요");
		$("#mname").focus;
		return false;
	}
	
	// 전화번호칸 공백일 떄
	if ($("#mphone").val() == "") {
		alert("전화번호를 입력해주세요");
		$("#mphone").focus;
		return false;
	}
	
	// 생년월일 공백일 때
	if ($("#mjumin").val() == "") {
		alert("이름을 입력해주세요");
		$("#mjumin").focus;
		return false;
	}
	
	// 주소가 공백일때
	if ($("#maddress").val() == "") {
		alert("주소 입력해주세요");
		$("#address").focus;
		return false;
	}
	
	// 이메일 공백일때
	if ($("#memail").val() == "") {
		alert("이메일을 입력해주세요");
		$("#email").focus;
		return false;
	}
	
	// 이름 유효성 검사
	if ()
	
	
	return true;
	});

		
} 

  생년월일 폼 
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>

	$( function() {
		  $( "#mjumin" ).datepicker({
		    	dateFormat : 'yy-mm-dd',
		    	monthNames : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    	showMonthAfterYear : true,
		    	yearSuffix : '년',
		    	showOtherMonths : true,
		    	dayNamesMin:['일','월','화','수','목','금','토']
		    });
	} ); 
	
	-->


