<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<script src=https://code.jquery.com/jquery-3.6.0.min.js></script>
<script>
	// 함수를 정의하고 실행하는거랑 함수를 바로 실행하는지 알아보기

	
	function findPW_btn() {
		
		var RegExp = /^[a-zA-Z0-9]{4,12}$/; // 아이디 유효성 검사 (비밀번호도)
		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/; // 이메일 유효성 검사
		var nameExp = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/; // 이름 유효성 검사
		 
		var form = document.findPWForm
		if (!form.mid.value) {
			alert("아이디를 입력해주세요.");
			return;
		}
		
		if (!RegExp.test(form.mid.value)) {
			alert("4~12자리 영문대소문자와 숫자로만 입력해주세요.");
			form.mid.value == "";
			return;
		}
		
		if (!form.mname.value) {
			alert("이름을 입력해주세요.");
			return;
		}
		
		if(nameExp.test(form.mname.value) == false) {
			alert("이름 형식이 맞지 않습니다. 다시 입력해주세요.");
			return;
		}
		
		if (!form.mphone.value) {
			alert("전화번호을 입력해주세요.")
			return;
		}
		form.submit();
	}

	
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
</head>
<body>
	<h1>비밀번호 찾기</h1>
	<div>
		<form action= "findPW" method="get" id="findPWForm" name="findPWForm">
			<!-- <p>
				<button class="findId">아이디찾기</button>
				<button class="findPassword">비밀번호찾기</button>
			</p> -->
			<p>
				아이디: <input type="text" name="mid" name="mid" placeholder="아이디 입력">
			</p>
			<p>
				이름: <input type="text" id="mname" name="mname" placeholder="이름 입력">
			</p>
			<p>
				전화번호: <input type="text" id="mphone" name="mphone" onkeyup="inputPhoneNumber(this);" maxlength="13"  placeholder="전화번호 '-' 없이 입력">
			<!-- <input type="button" name="본인인증">인증요청 -->
			</p>
			<!-- <p>
				<input type="text" id="memail" name="memail" placeholder="이메일입력">
			</p> -->
			<p>
				<input type="button" value="비밀번호찾기" onclick="findPW_btn()">
				<input type="button" value="취소" onclick="history.back()">
			</p>	
		</form>
	</div>
</body>
</html>


<!--  	$(function(){
		if($("#mid").val() == "") {
			alert("아이디를 입력해주세요.");
			$("#mid").focus;
			return false;
		}
		
		if ($("#mname").val() =="") {
			alert("이름을 입력해주세요.");
			$("#mname").focus;
			return false;
		}
		
		if($("#mphone").val() == "") {
			alsert("전화번호를 입력해주세요.");
			$("#mphone").focus;
			return false;
		} 
	});  -->