<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="com.bc.model.vo.NoticeVO"%>
<%@page import="java.util.List"%>
<%@page import="com.bc.model.common.Paging"%>
<%@page import="com.bc.model.dao.NoticeDAO"%>
    
<%
request.setCharacterEncoding("UTF-8");

System.out.println("------ NoticeOne dao selectOne 처리 전 --------");

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

System.out.println("ccategory : " + ccategory);
System.out.println("rnum : " + rnum);
System.out.println("begin : " + begin);
System.out.println("end : " + end);

NoticeVO nvo = NoticeDAO.selectOne(ccategory, rnum, begin, end);

System.out.println("------ NoticeOne dao selectOne 처리 후 --------");

System.out.println("nvo : " + nvo);
System.out.println("nvo.getCcategory : " + nvo.getCcategory());
System.out.println("nvo.getRnum : " + nvo.getRnum());
System.out.println("pageNum : " + pageNum);

pageContext.setAttribute("nvo", nvo);
pageContext.setAttribute("pageNum", pageNum);

	%>
    <html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>게시글 보기 | bitElectro</title>
    <link rel="stylesheet" href="./styles.css" />
    <script src ="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
      $(document).ready(function () {
        console.log("noticeOne 실행");
        
        $("#csCenterBtn").click(getJSONNotice);
        $("#cartBtn").click(getCart);

        $("#noticeBtn").click(getJSONNotice);
        $("#faqBtn").click(getJSONFaq);
        $("#inquireBtn").click(getJSONInquire);

        $("#login").click(getLogin);
        $("#joinMember").click(getJoinMember);
      })
      
      function getLogin() {
    	  console.log(">> getLogin() 실행~~~");
          location.href = "logIn.jsp"; 
      }
      
      function getJoinMember() {
    	  console.log(">> getLogin() 실행~~~");
          location.href = "joinMemberShip.jsp"; 
      }

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
    <div id="container">
      <div id="content">
        <div class="locationArea">
          <h1>공지사항</h1>
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
                <button class="leftMenuBtn" id="inquireBtn">
                  나의 문의 내역
                </button>
              </ul>
            </div>
          </div>
          <div id="mainArea">
            <div id="mainAreaHeader">
              <div class="mainAreaHeaderTop">
                <button class="pageBtn btnOne" onclick="javascript:history.back()">목록으로</button>
               
                <button type="button" class="mainAreaHeaderTopRight pageBtn btnOne" 
                onclick="javascript:location.href='inquireUpdate.jsp?ccategory=${nvo.ccategory }&page=${pageNum }&rnum=${nvo.rnum }'">
                  수정하기
                </button>
                <button type="button" class="mainAreaHeaderTopRight pageBtn btnOne" 
                onclick="javascript:location.href='inquireDelete.jsp?ccategory=${nvo.ccategory }&page=${pageNum }&rnum=${nvo.rnum }'">
                  삭제하기
                </button>
              </div>
              <div class="mainAreaHeaderMiddle">
                <h2>${nvo.csubject }</h2>
              </div>
              <div class="mainAreaHeaderMiddleLeft">
                <span>${nvo.crdate }</span>
              </div>
            </div>
            <div class="mainContentWriteArea">
            <p>${nvo.ccontent }</p>
            </div>
          </div>
          <div class="mainContentWriteAreaBottom">
            <button class="mainContentWriteBottomBtn" onclick="javascript:history.back()">목록으로</button>
          </div>
        </div>

        <div class="rightArea"></div>
      </div>
    </div>
  </body>
  <%@include file="footer.jsp" %>
</html>