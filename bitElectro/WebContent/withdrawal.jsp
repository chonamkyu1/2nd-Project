<%@page import="com.bc.model.vo.LogInVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	LogInVO vo =  (LogInVO)session.getAttribute("vo");
	session.setAttribute("vo", vo);
	
	System.out.println("vo: " + vo);
%>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<link rel="stylesheet" href="./styles.css" />
<script>
	function withdrawal_btn() {
		
		var form = document.withdrawal; // 폼 이름이랑 연결 (document.withdrawal) 
		if (!form.mpw.value) {
			alert("비밀번호를 입력해주세요."); // 폼 값은 무조건 네임값이 넘어간다.
			return false;
		}
		
		if (form.mpw_check.value.trim() == "") {
			alert("비밀번호를 한번 더 입력해주세요.");
			return;
		}
		
		if (form.mpw.value != form.mpw_check.value) {
			alert("잘못입력하셨습니다. 다시입력해주세요.");
			return;
		}
		
		let check = confirm('정말로 탈퇴하시겠습니까?');
		if (check) {
			form.action = "withdrawal";
			form.submit();
			
		}
		
		
	}

</script>
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
                <!-- <button class="leftMenuTitle">마이전자</button>
                <hr />
                <button class="leftMenuBtn" onclick="noticeGo()">
                  공지사항
                </button>
                <button class="leftMenuBtn" onclick="faqGo()">
                  자주 묻는 질문
                </button>
                <button class="leftMenuBtn" onclick="inquireGo()">
                  나의 문의 내역
                </button> -->
                <button class="leftMenuBtn" onclick="location.href='memberInformation.jsp'">
                  회원정보
                </button><br>
                <button class="leftMenuBtn" onclick="location.href='memberModify.jsp'">
                  정보수정
                </button><br>
                <button class="leftMenuBtn">
                  주문내역조회
                </button><br>
                <button class="leftMenuBtn">
                  쿠폰조회
                </button><br>
                <button class="leftMenuBtn" onclick="location.href='pointInformation.jsp'">
                  포인트정보
                </button><br>
                <button class="leftMenuBtn" onclick="location.href='withdrawal.jsp'">
                  회원탈퇴
                </button>
              </ul>
            </div>
          </div>    
	
	<div id="mainArea">
		<div class="mainContent" style="overflow:auto;">
			<div>
				<div>
					<p>회원탈퇴시,소유하고 있는 쿠폰/포인트/e.POINT 등은 자동으로 소멸되며,</p>
					<p>재가입하더라도 복구되지 않습니다.</p>
					<p>(OK멤버십 탈퇴는 OK캐쉬백 사이트에서 가능합니다.)</p>
					<p>서비스 이용내역은 모두 삭제되며, 재가입하더라도 복구되지 않습니다.</p>
					<p>상품주문 및 취소/교환/반품 처리가 진행중일 경우에는 탈퇴처리가 이루어지지 않습니다.</p>
					<p>탈퇴 후 1개월 내 재가입이 불가합니다.</p>
				<hr>
					<form  id="withdrawal" name="withdrawal">
					<table id="prodItems">
					<tr>
					<td>비밀번호</td><td><input type="password" id="mpw" name="mpw"></td>
					</tr>
					<tr>
					<td>비밀번호확인</td><td><input type="password" id="mpw_check" name="mpw_check"></td>
					</tr>
					<tr>
					<th colspan="2"><input type="button" value="회원탈퇴" class="utilMenuOne"  onclick="withdrawal_btn()">
					 | <input type="button" value="취소" class="utilMenuOne"  onclick="history.go(-1)"></th>
					</tr>
					</table>
					</form>
				</div>
			</div>
		</div>
		</div>
	   </div>
	   </div>
	   </div>
	   <%@include file="footer.jsp" %>
</body>
</html>