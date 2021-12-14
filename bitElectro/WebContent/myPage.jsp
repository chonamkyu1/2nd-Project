<%@page import="com.bc.model.vo.LogInVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
LogInVO vo = (LogInVO)session.getAttribute("vo");
pageContext.setAttribute("vo", vo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>마이페이지</title>
<%@include file="headWrap.jsp"%>
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
							<li><button class="leftMenuBtn"
								onclick="location.href='memberInformation.jsp'">회원정보</button></li>
							<li><button class="leftMenuBtn"
								onclick="location.href='memberModify.jsp'">정보수정</button></li>
							<li><button class="leftMenuBtn">주문내역조회</button></li>
							<li><button class="leftMenuBtn">쿠폰조회</button></li>
							<li><button class="leftMenuBtn"
								onclick="location.href='pointInformation.jsp'">포인트정보</button></li>
							<li><button class="leftMenuBtn"
								onclick="location.href='withdrawal.jsp'">회원탈퇴</button></li>
						</ul>
					</div>
				</div>
				<div id="mainArea">
					<div class="mainContent">
						<div>
							<div class="">
								<h1>${vo.mid }님안녕하세요.</h1>
								<h2>회원님 등급은 silver입니다.</h2>
							</div>
							<div>
								<h1>BIT LAND</h1>
								<h3>내가 구매한 상품</h3>
								<hr>
								구매한 상품이 없습니다.
								<!-- 여기 가운데정렬 -->
							</div>

							<div>
								<div>
									<h1>최근 주문내역</h1>
									주문일시 | 주문번호 | 상품정보 | 총 결제금액
								</div>
							</div>

							<div>
								<div>
									<h1>장바구니</h1>
									장바구니에 담긴 상품이 없습니다.
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
<%@include file="footer.jsp"%>
</html>