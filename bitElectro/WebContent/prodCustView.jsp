<%@page import="com.bitElectro.dao.CategoryDAO"%>
<%@page import="com.bc.model.vo.CateProdVO"%>
<%@page import="com.bitElectro.vo.ProductVO"%>
<%@page import="com.bitElectro.dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

request.setCharacterEncoding("UTF-8");
String pcode = request.getParameter("pcode");
//상품 정보 가져오기
ProductVO pvo = ProductDAO.selectProd(pcode);
pageContext.setAttribute("pvo", pvo);

//유저정보 가져오기
LogInVO lvo= (LogInVO)session.getAttribute("vo");
pageContext.setAttribute("mid", lvo.getMid());

//제품의 카테고리 정보 가져오기
String cno = pvo.getCno();
pageContext.setAttribute("cno", cno);

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세보기 | bitElectro</title>
<%@include file="headWrap.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

$(function(){ //jquery 시작

   //바로 구매시
   
   $("#buyNow").click(function(){
      //alert("buynow 클릭");
      if($("#pcnt").val().trim()==""){
         alert("구매수량을 입력하신 후 구매를 눌러주세요!");
         $("#pcnt").focus();
         return;
      }
      let pcnt = $('#pcnt').val();
      alert("상품 구매화면으로 이동합니다!");
      //alert("pcnt :" + pcnt);
      location.href='payment.jsp?pcode=${pvo.pcode}&pcnt='+pcnt;
   });
   
   //장바구니 담을시
   $("#insertCart").click(function(){
      alert("장바구니로 연결");
      if($("#pcnt").val().trim()==""){
         alert("구매수량을 입력하신 후 구매를 눌러주세요!");
         $("#pcnt").focus();
         return;
      }
      let answer = confirm("선택하신 제품을 장바구니에 담을까요?");
      if(answer){
         let pcnt = $('#pcnt').val();
         let mid = ${mid };
         let cno = ${pvo.cno };
         
         location.href="insertCart.jsp?pcode="+${pvo.pcode}+"&mid="+mid+"&cno="+cno+"&pcnt="+pcnt;
      }
   });
});
</script>

<body style="text-align: center;">
<div id="container">
 <div id="content">
    <br><br><br><br>
    
    <form id="frm1">
    <span><button style="border:2px solid darkgrey; background-color : white; width:300px; height:80px; color: black; font-size:2em; font-weight: bold; border-radius: 10px;">상품 상세페이지</button></span>
   <table id="prodItems" style="position:relative; ; top:120px; left: 250px;">
      <tr>
      <th colspan="3"><h2>PRODUCT INFO</h2></th>
      </tr>   
      <tr>
         <td width="50%" rowspan="4"><img src="./productImg/${pvo.pimage }" style ="border:solid 1px lightgrey; width:300px;"></td>
         <td width="15%"><b>상품명</b></td><td>${pvo.pname }</td>
         <td>
      </tr>
      <tr>
      <td><b>구매가격</b></td><td colspan="2"><b>${pvo.pprice }</b></td>
      </tr>
      <tr>
      <td><b>현재할인율</b></td><td colspan="2"><b>${pvo.pdiscount }</b></td>
      </tr>
      <tr>
      <td colspan ="2">
      <input type="number" name="pcnt" id="pcnt" placeholder="구매수량(EA)"> 대(EA)<br>
      </td>
      <tr>
      <td colspan="3">
      <button class="utilMenuOne" type='button' id="buyNow"><b>바로 구매</b></button><br><br>
      <button class="utilMenuOne" type='button' id="insertCart"><b>장바구니에 담기</b></button></td>
      
      </tr>
      <tr>
      <td colspan = "3"><img src ="./productImg/${pvo.pdescription }" style ="border:solid 1px lightgrey; width:300px;"> </td>
      </tr>
   
   </table>
   </form>
</div>
</div>
</body>

</html>