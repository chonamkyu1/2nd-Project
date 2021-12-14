 <%@page import="com.bc.model.vo.LogInVO"%>
<%@page import="com.bc.model.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
//세션에 저장된 값을 불러온다.
//꼭 수정해야 함.
System.out.println("session.getAttribute(\"vo\") : " + session.getAttribute("vo"));
System.out.println(">>session id : "+ session.getId() + ", new :" + session.isNew());

%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

$(function(){//jQuery시작
	
	//로그아웃 함수
	$("#logOutBtn").click(function(){
		
		location.href="session_out.jsp";
	});
	
	//장바구니 가는 함수
	$("#cartBtn").click(function(){
		location.href="cart.jsp";
	});
	
	//공지사항으로 이동하는 함수
	$("#csCenterBtn").click(function(){
		location.href="notice.jsp";
	});
	
	//로그인 페이지로 이동하는 함수
	$("#loginBtn").click(function(){
	location.href="logIn.jsp";
	});
	
	//회원가입으로 이동하는 함수
	$("#joinBtn").click(function(){
	location.href="joinMemberShip.jsp";
	});
	
});//jqeury 종료
</script>    
 <link rel="stylesheet" href="./styles.css" />
 <div id="header">
      <div class="headerWrap">
        <div class="utilArea">
          <ul class="utilMenu">
          	
          	<!-- 세션에 저장된 유저가 null인지 확인 후 페이지를 전환-->
         	<c:set var="voOne" value="${vo }"/>
         	<c:if test="${vo ==null }">
            <li>
              <button class="utilMenuOne" type="button" id="loginBtn">로그인</button>
            </li>
            <li>
              <button class="utilMenuOne" type="button"  id="joinBtn">회원가입</button>
            </li>
           	</c:if>
           	<c:if test="${vo != null }">
            <li>
            <button class="utilMenuOne" type="button" onclick="javascript:location.href='memberInformation.jsp'">${vo.mid }</button>님 환영합니다!!
            </li>
            <li>
            <button class="utilMenuOne" id="logOutBtn">로그아웃</button>
            </li>
            <li>
              <button class="utilMenuOne" id="cartBtn">장바구니</button>
            </li>
            </c:if>
			<!--  -->
            <li>
              <button class="utilMenuOne" id="csCenterBtn">고객센터</button>
            </li>
            <li>
              <button class="utilMenuOne" onclick="javascript:location.href='adminLogin.jsp'">관리자모드</button>
            </li>

            
          </ul>
        </div>

        <div class="headerTop">
          <h1><a href="mainMenu.jsp"><img src="./image/logo.png"></a></h1>
        </div>
        <br><br>
        <div class="headerMenuArea">
          <ul class="headerMenu">
            <li class="bestItem"> <a href="showProdList.jsp?cmain=1">Best 100</a></li>
            <li><a href="showProdList.jsp?cmain=2">대형가전</a></li>
            <li><a href="showProdList.jsp?cmain=3">계절가전</a></li>
            <li><a href="showProdList.jsp?cmain=4">컴퓨터</a></li>
            <li><a href="showProdList.jsp?cmain=5">휴대폰</a></li>
            <li><a href="showProdList.jsp?cmain=6">카메라</a></li>
          </ul>
        </div>
      </div>
    </div>
    </head>
    