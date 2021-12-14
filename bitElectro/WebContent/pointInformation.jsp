<%@page import="com.bc.model.vo.LogInVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>포인트정보</title>
    <link rel="stylesheet" href="./styles.css" />
<%@include file="headWrap.jsp" %>
<body>
	
    <div id="container">
      <div id="content">
        <div class="locationArea">
          <h1>MY LAND</h1>
          <hr />
        </div>
        <div id="bitContentArea">
          <div class="leftArea">
            <div class="leftMenu">
              <ul class="leftMenuBar">

                <button class="leftMenuBtn" onclick="location.href='memberInformation.jsp'">
                  회원정보
                </button>
                <button class="leftMenuBtn" onclick="">
                  수취확인정보
                </button>
                <button class="leftMenuBtn" onclick="">
                  포인트정보
                </button>
                <button class="leftMenuBtn" onclick="">
                  주문배송조회
                </button>
               <button class="leftMenuBtn" onclick="">
                  주문내역조회
                </button>
                <button class="leftMenuBtn" onclick="">
                  쿠폰조회
                </button><br>
                <button class="leftMenuBtn" onclick="location.href='memberModify.jsp'">
                  정보수정
                </button><br>
                <button class="leftMenuBtn" onclick="location.href='withdrawal.jsp'">
                  회원탈퇴
                </button>
              </ul>
            </div>
          </div>
         
          <div id="mainArea">
		<div class="mainContent">
	   		<h1>포인트 정보</h1>
	   		<h2>${vo.mname }님</h2>
	   		<h2>사용가능한 포인트는 ${vo.mpoint }원입니다.</h2>
	   		<h2>이달 소멸  포인트는 0원입니다.</h2>
	   		<hr>
	   		<h2>포인트 유의사항</h2>
	   		<p>주문취소 또는 반품의 경우에는 적립된 포인트가 회수됩니다.</p>
	   		<p>포인트는 적립일로부터 3년간 유효하며, 유효기간이
	   		경과한 적립금은 자동적으로 소멸됩니다.</p>
			<p>포인트는 10,000원 이상부터 사용가능하며 당월 소멸 얘정포인트는
			1원부터 사용가능합니다.</p>	   		
	   </div>
	   </div>
	   </div>
	    </div>
          </div>
          <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
          <%@include file="footer.jsp" %>
	   </body>


</html>