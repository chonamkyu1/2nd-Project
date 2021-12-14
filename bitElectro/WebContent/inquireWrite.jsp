<%@page import="com.bc.model.vo.MemberVO"%>
<%@page import="com.bc.model.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

    
<%
request.setCharacterEncoding("UTF-8");

/* String mid = request.getParameter("mid"); */
// 테스트용
String mid = "test1";
MemberVO mvo = MemberDAO.getMemberUserInfo(mid);

System.out.println("mvo : " + mvo);

pageContext.setAttribute("mvo", mvo);

%>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>1대1 문의 | bitElectro</title>
    <link rel="stylesheet" href="./styles.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
         $(document).ready(function () {
           console.log("notice 실행");

           $("#csCenterBtn").click(getJSONNotice);
           $("#cartBtn").click(getCart);
           
           $("#noticeBtn").click(getJSONNotice);
           $("#faqBtn").click(getJSONFaq);
           $("#inquireBtn").click(getJSONInquire);

           $("#confirm").click(function(){
        	   console.log("confirm 실행");
        	   
		      if($("#mjumun").val().trim() == ""){
		      	alert("주문번호가 공란입니다.");
		      	$("#mjumun").focus();
		      	return;
		      }
		
		      if($("#csubject").val().trim() == ""){
		      	alert("제목이 공란입니다.");
		      	$("#csubject").focus();
		      	return;
		      }
		
		      if($("#ccontent").val().trim() == ""){
		      	alert("내용이 공란입니다.");
		      	$("#ccontent").focus();
		      	return;
		      }
		
		      if(confirm("위 정보로 등록하시겠습니까?")){
		      	$("#frm1").submit();
		      }else{
		      	$("#frm1 input").val("");
		      	$("#mid").focus();
		      	return;
		      }
           });
          });
         function getJSONNotice() {
             console.log(">> getJSONNotice() 실행~~~");
             location.href = "notice.jsp";
         }

         function getJSONFaq() {
           	console.log(">> getJSONFaq() 실행~~~");
               location.href = "faq.jsp";
         }

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
  <body>
   
    <div id="container">
      <div id="content">
        <div class="locationArea">
          <h1>1대1 문의하기</h1>
          <hr />
        </div>
        <div id="bitContentArea">
          <div class="leftArea">
            <div class="leftMenu">
              <ul class="leftMenuBar">
                <button class="leftMenuTitle">고객센터</button>
                <button class="leftMenuBtn" id="noticeBtn">
                  공지사항
                </button>
                <button class="leftMenuBtn" id="faqBtn">
                  자주 묻는 질문
                </button>
                <button
                  class="leftMenuBtn" id="inquireBtn">
                  나의 문의 내역
                </button>
              </ul>
            </div>
          </div>
          <div id="mainArea" style="overflow-y:auto">
            <div class="mainContent">
              <form action="inquireResist" method="post" id="frm1">
                <table class="tableContentInquireWrite">
                  <tbody>
                    <tr>
                      <td>아이디</td>
                      <td>
                        <input
                          class="pageBtn"
                          type="text"
                          name="mid"
                          id="mid"
                          value=${mvo.mid }
                          readonly
                        />
                      </td>
                    </tr>
                    <tr>
                      <td>주문번호</td>
                      <td>
                        <input
                          class="pageBtn"
                          type="text"
                          name="mjumun"
                          id="mjumun"
                        />
                      </td>
                    </tr>
                    <tr>
                      <td>제목</td>
                      <td>
                        <input
                          class="pageBtn"
                          type="text"
                          name="csubject"
                          id="csubject"
                        />
                      </td>
                    </tr>
                    <tr>
                      <td>문의 내용</td>
                      <td>
                        <textarea
                          class="pageBtn"
                          rows="5"
                          cols="45"
                          name="ccontent"
                          id="ccontent"></textarea>
                      </td>
                    </tr>
                  </tbody>
                </table>
                <div class="mainContentBottom">
                  <button
                    type="button"
                    class="pageBtn mainPageBtn"
                    id="confirm">
                    확인
                  </button>
                  <button
                 	type="button"
                    class="pageBtn mainPageBtn"
                    onclick="javascript:history.back()">
                    취소
                  </button>
                </div>
              </form>
            </div>
          </div>
        </div>

        <div class="rightArea"></div>
      </div>
    </div>

<%@include file="footer.jsp" %>
  </body>
</html>