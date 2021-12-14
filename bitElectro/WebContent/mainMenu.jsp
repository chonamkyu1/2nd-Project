<%@page import="com.bitElectro.vo.ProductVO"%>
<%@page import="com.bitElectro.dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="com.bc.model.vo.NoticeVO"%>
<%@page import="java.util.List"%>
<%@page import="com.bc.model.common.Paging"%>
<%@page import="com.bc.model.dao.NoticeDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%
//best4 상품 불러오기
List<ProductVO> topFourlist =  ProductDAO.getTopSalFour();

//scope에 저장
pageContext.setAttribute("topFourlist", topFourlist);
//System.out.println("topFourlist : " + topFourlist);

%>

<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" /> -->
    <title>메인 메뉴 | bitElectro</title>
    <!-- <link rel="stylesheet" href="./styles.css" /> -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
      $(document).ready(function () {
        //console.log("notice 실행");  
        
        //고객센터 클릭 함수
        $("#csCenterBtn").click(getJSONNotice);
        //장바구니 클릭 함수
        $("#cartBtn").click(getCart);
        //공지사항 클릭 함수
        $("#noticeBtn").click(getJSONNotice);
        //faq 클릭 함수
        $("#faqBtn").click(getJSONFaq);
        
        $("#inquireBtn").click(getJSONInquire);
       
      });

      function getJSONNotice() {
          console.log(">> getJSONNotice() 실행~~~");
          location.href = "notice.jsp";
      };
      
      function getJSONFaq() {
        	console.log(">> faqGo() 실행~~~");
            location.href = "faq.jsp";
        };
      
      function getJSONInquire() {
          console.log(">> getJSONInquire() 실행~~~");
          location.href = "inquire.jsp"; 
        }
      
      function getCart() {
    	  console.log(">> getCart() 실행~~~");
          location.href = "cart.jsp"; 
      }
      
    </script>
 	<%@include file="headWrap.jsp" %>
    <body style="text-align:center;">
    <div id="container">
      <div id="content">
        <div class="mainMenuBannerArea">
          <img src="https://cdn.011st.com/11dims/resize/1240x400/quality/99/11src/http://cdn.011st.com/ds/2021/10/15/1311/87c6631a26f7c875e4255609166d01ff.jpg" height="300px" width="1000px">
        </div><br><br>
     	
          <div class="mainMenuTitleArea">
          <!--  -->
          <p></p>
          <!--  -->
          <h3>고객님 취향저격 추천 상품</h3>
          <h2 class="mainMenuTitle1">베스트 상품</h2>
          </div>
          <hr/>
			  <table id="prodItems" style="z-index: 1; border:none;">
			  <tr>
				  <c:forEach var="vo" items="${topFourlist }">
				  <td style ="width:25%; text-align:center; border : none; padding : 10px;">
				  <p><a href="prodCustView.jsp?pcode=${vo.pcode }"><img style="width:250px; height=:250px;" src="./productImg/${vo.pimage }" ></a></p>
				  <p><a href="prodCustView.jsp?pcode=${vo.pcode }"><b>${vo.pname }</b></a></p>
				  <p><a href="prodCustView.jsp?pcode=${vo.pcode }">현재가 : ${vo.pprice } (원)</a></p>
				  </td>
				  </c:forEach>
			  </tr>
			  </table>		  
         </div>
          
        <div class="rightArea"></div>
        </div>
 	 </body>
 	 
 	<!-- footer 영역 ============================================= -->
 	<%@include file="footer.jsp" %>
</html>
        