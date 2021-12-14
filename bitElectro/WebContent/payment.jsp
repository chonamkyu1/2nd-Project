<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.bc.model.vo.CartVO"%>
<%@page import="com.bc.model.vo.ProductVO"%>
<%@page import="com.bc.model.dao.CartDAO"%>
<%@page import="com.bc.model.dao.ProductDAO"%>
<%@page import="com.bc.model.dao.MemberDAO"%>
<%@page import="com.bc.model.vo.LogInVO"%>
<%@page import="com.bc.model.vo.MemberVO"%>

<%@page import="com.bc.model.vo.OrderProdVO"%>
<%@page import="java.util.List"%>

<%@page import="com.bc.model.common.Paging"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<%  
request.setCharacterEncoding("UTF-8");

//테스트 아이디값
LogInVO vo = (LogInVO)session.getAttribute("vo");
MemberVO mvo = MemberDAO.getMemberUserInfo(vo.getMid());

//장바구니에서 결제로 오는 목록
List<OrderProdVO> op = (List<OrderProdVO>)request.getAttribute("oplist");

if(op != null){

	System.out.println("장바구니 구매로 연결");
	pageContext.setAttribute("op", op);
}else{
	System.out.println("바로구매로 연결");
//바로 구매로 올 경우 상품 정보
String pcode = request.getParameter("pcode");

int pcnt = Integer.parseInt(request.getParameter("pcnt"));
ProductVO pvo =  ProductDAO.selectProd(pcode);

System.out.println("pcnt : " + pcnt);

//선택한 상품의 PVO와 String Pcnt를 scope저장
pageContext.setAttribute("pvo", pvo);
pageContext.setAttribute("pcnt", pcnt);

}


/* System.out.println("전달 받은 op : " + op);
for(OrderProdVO opvo : op){
	System.out.println("vo.getFinalprice() : " + opvo.getFinalprice());
} */

//로그인 유저의 정보를 불러옴
pageContext.setAttribute("mvo", mvo);

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
      
    </script>
  <%@include file="headWrap.jsp" %>
  <body>
  	<div id="wrapBody">
    <div id="container">
      <div id="content">
        <div class="locationArea">
          <h1>주문결제</h1>
          <hr />
        </div >
        
        <div id="bitContentArea">
          <div id="mainArea">
          <form action="orderResist" method="get" id="frm">
            <div class="mainContent">
            	<div>
            		<h1>1. 배송정보</h1>
            		<div class="paymentBorder">
            			<input type="radio" name="deleveryAddress" id="defaultAddress" value="defaultAddress">
            			<label for="defaultAddress">기본배송지</label>
            			<input type="radio" name="deleveryAddress" id="otherAddress" value="otherAddress">
            		    <label for="otherAddress">직접입력</label>
            		    <p><b>고객명</b> :: ${mvo.mname }</p>
            		    <p><b>고객 주소</b> :: ${mvo.maddress }</p>
            		    <p><b>연락처</b> :: ${mvo.mphone }</p>
            		    <select>
            		        <option value="aa">배송시 요청사항 선택하기</option>  
            		    	<option value="aa">빠르게 보내주세요.</option>  
            		    	<option value="aa">퀵으로 보내주세요.</option>           		    	
            		    </select>
            		</div>
            	</div>
            	<div>
            		<h1>2. 주문상품</h1>
              <table class="tableContent marginTop">
                <thead>
                  <tr>
                    <th>상품명</th>
                    <th>수량</th>
                    <th>주문금액</th>
                    <th>배송정보</th>
                  </tr>
                </thead>
                <tbody id="noticeList">
               
                	<c:set var="volist" value="${op }"/>
                	<c:if test="${volist != null }">
                	<c:forEach var="vo" items="${volist }">
			        	<tr>
				          	<td>${vo.pname }</td>
				          	<input type="hidden" name="pname" value="${vo.pname }"/>
					       	<td>${vo.pcnt }</td>
					       	<input type="hidden" name="pcnt" value="${vo.pcnt }"/>
					        <td>${vo.realprice }</td>
					        <input type="hidden" name="realprice" value="${vo.realprice }"/>
					        <td>무료배송</td>
				        </tr>
				        </c:forEach>
				      </c:if>
				      
				      <c:set var="vo" value="${pvo }"/>
				      <c:if test="${vo != null }">
				      <tr>
				          	<td>${vo.pname }</td>
				          	<input type="hidden" name="pname" value="${vo.pname }"/>
					       	<td>${pcnt }</td>
					       	<input type="hidden" name="pcnt" value="${pcnt }"/>
					        <td>${vo.pprice }</td>
					        <input type="hidden" name="realprice" value="${vo.pprice }"/>
					        <td>무료배송</td>
				        </tr>
				        </c:if>
                </tbody>
                <tfoot id="pageBlock">
                </tfoot>
              </table>
              </div>
              <div>
              <div class="paymentBottomArea">
              <ul class="paymentBottomMiddle">
              	  <li>
            		<h1 style="width:340px;">3. 할인/포인트</h1>
            		<div class="paymentBorderSmall">
            			<p>쿠폰 할인 0원</p>
            		<button type="button" class="submitButtonType">쿠폰변경</button>
            			<p>포인트 ${mvo.mpoint }원</p>
            		<input type="text" placeholder="0원">
            		<button type="button" class="submitButtonType">전액 사용</button>
            		</div>
            	  </li>
            	  <li>
            	  	<div>
            	  	<h1 style="width:340px;">4. 결제방법</h1>
            	 	 <div class="paymentBorderSmall">
	            		<input type="radio" name="paymentType" id="accountTransfer" value="accountTransfer">
	            			<label for="accountTransfer">계좌이체</label>
	           			<input type="radio" name="paymentType" id="depositWithout" value="depositWithout">
	           				<label for="depositWithout">무통장 입금</label>
	           			<input type="radio" name="paymentType" id="creditCard" value="creditCard">
            				<label for="creditCard">신용카드</label>
       				</div>
       				</div>
            	  </li>
            	</ul>
            	</div>
            	<div class="paymentFinalArea">
            		<h1>5. 최종결제 금액 확인</h1>
            		<div class="paymentBorderSmall"> 
            			<p>총 상품 금액 :: ${pvo.pprice }</p>
	            		<input type="hidden" name="payAll" />
	            		<%-- <p>총 상품 금액 ${op.finalprice }원</p> --%>
	            		<p>배송비  0원</p>
	            		<input type="hidden" name="delevery" />
	            		<!-- <p>결제 방법</p> -->
	            		<p>최종결제 금액 :: ${pvo.pprice }</p>
	            		<input type="hidden" name="finalPayAll" />
            		</div>
            	</div>
            	</div>
              <div class="cartContentBtnArea">
              	<ul class="cartContentBnUl">
	              <li class="cartContentBtn">
	              <button type="button" class="pageBtn">취소하기</button>
	              </li>
	        	  <li class="cartContentBtn">
	              <button type="submit" class="submitButtonType" id="finalOrderSubmit">결제하기</button>
	              </li>
	            </ul>
              </div>
          </div>
          </form>
          
        </div>
        <div class="rightArea"></div>
      </div>
    </div>
    </div>
    </div>
  </body>
  <%@include file="footer.jsp" %>
</html>
        