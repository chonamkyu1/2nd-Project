<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	response.setContentType("text/html;charset=UTF-8");
	response.setCharacterEncoding("UTF-8");
	request.setCharacterEncoding("UTF-8"); // 한글처리 여기서 해줘야한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logIn : bitElectro</title>
    <link rel="stylesheet" href="./styles.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

</head>
<body style="position: relative; background: #f5f6f7;">
    <div id="loginHeader">
      <a href="mainMenu.jsp"><h1 style="font-size:40px; margin: 0px;">bitElectro</h1></a>
    </div>
    <form action="logIn" method="get" id="FormLogin" name="logInForm">
      <div id="loginContainer">
        <div id="loginContent">
          <div class="row_group">
            <div>
              <h3><label class="join" for="id">아이디</label></h3>
              <span class="ps_box">
                <input
                  class="logininput"
                  type="text"
                  id="mid"
                  name="mid"
                  maxlength="20"
                  placeholder="아이디 입력"
                  value="" />
                  <span class="step_url">@###.com</span>
                  </span><br />
              <span class="error"></span>
            </div>
            <div>
              <h3><label class="join" for="password">비밀번호</label></h3>
              <span class="ps_box">
                <input
                  class="logininput"
                  type="password"
                  id="mpw"
                  name="mpw"
                  value=""
                  placeholder="비밀번호(5~20자리)"/></span>
              <span class="error"></span>
            </div>
            
          </div>    
          <div class="btn_area">
              <input type="button" id="btnJoin" onclick="logIn_btn()" class="btn_type btn_primary" value="로그인"/>
          </div>      
            <div>
            	<div style="float:right">
	            	<a href="findId.jsp" onclick="window.open(this.href,'_blank','width=300,height=400, scrollbars=yes');return false;">아이디찾기</a>
	            	<a href="findPassword.jsp" onclick="window.open(this.href,'_blank','width=300,height=400, scrollbars=yes');return false;">비밀번호찾기</a>
	            	<a href="joinMemberShip.jsp">회원가입</a>
            	</div>
            </div>
          </div>
        </div>
    </form>
    <div id="loginFooter">@ bitElectro Corp.</div>
    <script>
	const id = document.querySelector("#mid");
	const password = document.querySelector("#mpw");
	const error = document.querySelectorAll(".error");
	
	// 이벤트 리스너
	id.addEventListener("input", checkId);
	password.addEventListener("input", checkPassword);
	
	// 함수 작성
	function checkId() {
	  const korPattern = /[a-zA-Z0-9_-]{5,20}/;
	  if (id.value === "") {
	    error[0].innerHTML = "아이디를 입력해주세요.";
	    error[0].style.color = "red";
	  } else if (!korPattern.test(id.value)) {
	    error[0].innerHTML =
	      "5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.";
	    error[0].style.color = "red";
	  } else if (korPattern.test(id.value)) {
	    error[0].innerHTML = "";
	    error[0].style.color = "red";
	  }
	}
	
	function checkPassword() {
	  const pwPattern = /[a-zA-Z0-9\[\]\{\}\/\(\)\.\?\<\>!@#$%^&*]{8,16}/;
	  if (password.value === "") {
	    error[1].innerHTML = "비밀번호를 입력해주세요.";
	    error[1].style.color = "red";
	  } else if (pwPattern.test(password.value)) {
	    error[1].innerHTML = "";
	  } else if (!pwPattern.test(password.value)) {
	    error[1].innerHTML = "8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.";
	    error[1].style.color = "red";
	  }
	}

	function logIn_btn() {
		var form = document.logInForm // 폼 변수에 액션태그 loginForm 연결 (name값에 연결)
		if (!form.mid.value){
			alert("아이디를 입력해주세요");
			return;
		}
		
		if (!form.mpw.value) {
			alert("비밀번호를 입력해주세요");
			return;
		}
		form.submit();
	}
	</script>
</body>
</html>