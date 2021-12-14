<%@page import="com.bc.model.dao.NoticeDAO"%>
 <%@page import="com.bc.model.vo.NoticeVO"%>
<%@page import="java.util.List"%>
<%@page import="com.bc.model.common.Paging"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
 <%
 request.setCharacterEncoding("UTF-8");

 System.out.println("inquireUpdate 실행 ~~");

 int ccategory = Integer.parseInt(request.getParameter("ccategory"));
 int rnum = Integer.parseInt(request.getParameter("rnum"));
 int pageNum = Integer.parseInt(request.getParameter("page"));

 int begin = 0;
 int end = 0;

 if(pageNum == 1) {
 	begin = 1;
 	end = 5;
 } else if(pageNum > 1){
 	begin = 5 * (pageNum - 1) + 1;
 	end = 5 * pageNum;
 }

 NoticeVO nvo = NoticeDAO.selectOne(ccategory, rnum, begin, end);
 
 pageContext.setAttribute("nvo", nvo);
 pageContext.setAttribute("page", pageNum);

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

        $("#noticeBtn").click(getJSONNotice);
        $("#csCenterBtn").click(getJSONNotice);
        $("#cartBtn").click(getCart);
        
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
		      	$("#csubject").focus();
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
    <div id="header">
      <div class="headerWrap">
        <div class="utilArea">
          <ul class="utilMenu">
            <li>
              <button class="utilMenuOne">로그인</button>
            </li>
            <li>
              <button class="utilMenuOne">회원가입</button>
            </li>
            <li>
              <button class="utilMenuOne" id="cartBtn">장바구니</button>
            </li>
            <li>
              <button class="utilMenuOne" id="csCenterBtn">고객센터</button>
            </li>
          </ul>
        </div>

        <div class="headerTop">
          <h1><a href="mainMenu.jsp">bitElectro</a></h1>
        </div>
        <div class="headerMenuArea">
          <ul class="headerMenu">
            <li class="bestItem">Best 100</li>
            <li>대형가전</li>
            <li>계절가전</li>
            <li>컴퓨터</li>
            <li>휴대폰</li>
            <li>카메라</li>
          </ul>
          <span class="headerMenuSearchBar">
            <input type="text" placeholder="검색어를 입력해주세요" />
          </span>
        </div>
      </div>
    </div>

    <div id="container" style="overflow-y:auto;">
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
          <div id="mainArea">
            <div class="mainContent">
              <form action="inquireModify?ccategory=3&page=${page }&rnum=${nvo.rnum }" method="post" id="frm1">
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
                          value=${nvo.mid }
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
                          value="${nvo.csubject }"
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
                          id="ccontent">${nvo.ccontent }</textarea>
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