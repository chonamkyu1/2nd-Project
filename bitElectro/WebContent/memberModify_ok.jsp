<%@page import="com.bc.model.vo.LogInVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="./styles.css" />
	<meta charset="UTF-8">

<title>정보수정OK</title>
<%@include file="headWrap.jsp" %>
<body>
	
     <div id="container">
      <div id="content">
        <div class="locationArea">
          <h1>마이페이지</h1>
          <hr />
        </div>
        <div id="bitContentArea">
          <div class="leftArea">
            <div class="leftMenu">
              <ul class="leftMenuBar">
                <button class="leftMenuBtn" onclick="location.href='memberInformation.jsp'">
                  회원정보
                </button>
                <button class="leftMenuBtn" onclick="location.href='memberModify.jsp'">
                  정보수정
                </button>
                <button class="leftMenuBtn">
                  주문내역조회
                </button>
                <button class="leftMenuBtn">
                  쿠폰조회
                </button>
                <button class="leftMenuBtn" onclick="location.href='pointInformation.jsp'">
                  포인트정보
                </button>
                <button class="leftMenuBtn" onclick="location.href='withdrawal.jsp'">
                  회원탈퇴
                </button>
              </ul>
            </div>
          </div>
          </div>
          </div>
          </div>
          
	<div id="mainArea">
		<div class="mainContent">
		<script>alert("정보가 수정되었습니다.")</script>
			<h1>정보수정OK</h1>
			<ul>
				<li>이름: ${lvo.mname }</li>
				<li>생년월일: ${lvo.mjumin}</li>
				<li>아이디: ${lvo.mid}</li>
				<li>비밀번호 :${lvo.mpw}</li>
				<li>전화번호: ${lvo.mphone}</li>
				<li>이메일: ${lvo.memail}</li>
				<li>주소: ${lvo.maddress}</li>
			</ul>	
	<a href="myPage.jsp">마이페이지로 이동</a>
	   </div>
           </div>

		</body>
		<%@include file="footer.jsp" %>
</html>