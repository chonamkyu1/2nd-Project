<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.bc.model.vo.CartVO"%>
<%@page import="com.bc.model.vo.ProductVO"%>
<%@page import="com.bc.model.dao.CartDAO"%>
<%@page import="com.bc.model.dao.ProductDAO"%>
<%@page import="com.bc.model.dao.MemberDAO"%>
<%@page import="com.bc.model.vo.MemberVO"%>
<%@page import="com.bc.model.vo.OrderProdVO"%>

<%@page import="com.bc.model.common.Paging"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<%  

//테스트 아이디값

LogInVO lvo = (LogInVO)session.getAttribute("vo");

pageContext.setAttribute("mvo", lvo);

%> 

<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" /> -->
    <title>주문결제 | bitElectro</title>
    <link rel="stylesheet" href="./styles.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
      $(document).ready(function () {
        console.log("notice 실행");
        
        getJSONPayment();
        
        $("#csCenterBtn").click(getJSONNotice);
        $("#cartBtn").click(getCart);
        
        $("#noticeBtn").click(getJSONNotice);
        $("#faqBtn").click(getJSONFaq);
        $("#inquireBtn").click(getJSONInquire);
        $("#goToShoppingBtn").click(getMainMenu);
      });

      
      function getJSONNotice() {
          console.log(">> getJSONNotice() 실행~~~");
          location.href = "notice.jsp";
      };
      
      function getJSONFaq() {
        	console.log(">> getJSONFaq() 실행~~~");
            location.href = "faq.jsp";
      };

      function getJSONInquire() {
            console.log(">> getJSONInquire() 실행~~~");
            location.href = "inquire.jsp"; 
      };
      
      function getCart() {
    	  console.log(">> getCart() 실행~~~");
          location.href = "cart.jsp"; 
      }
      
      function getMainMenu() {
    	  console.log(">> getMainMenu() 실행~~~");
          location.href = "mainMenu.jsp"; 
      }
      
    </script>
  <%@include file="headWrap.jsp" %>
  <body>
  	<div id="wrapBody">
    <div id="container">
      <div id="content">
        <div class="locationArea">
          <h1>주문완료</h1>
          <hr />
        </div >
        
        <div id="bitContentArea">
          <div id="mainArea">
            <div class="mainContent">
            	<div>
            		<div class="paymentBorder">
            			<h1 style="color:#e71c2b; text-align:center;">[ <b style="color:black;">${mvo.mname }</b> ]고객님의 주문이 완료되었습니다.</h1>
            		</div>
            	</div>
           		<div>
             
              </div>
          </div>
          <div>
          </div>
        </div>
        <div class="rightArea"></div>
        <div class="cartContentBtnArea">
              	<ul class="cartContentBnUl">
	              <li class="cartContentBtn">
	              <button type="button" class="pageBtn" id="goToShoppingBtn">쇼핑계속하기</button>
	              </li>
	            </ul>
              </div>
      </div>
    </div>
    </div>
	<%@include file="footer.jsp" %>
    </div>
  </body>
</html>
        