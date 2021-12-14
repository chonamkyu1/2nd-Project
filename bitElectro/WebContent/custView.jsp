<%@page import="com.bitElectro.vo.MemberVO"%>
<%@page import="com.bitElectro.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("UTF-8");

String mid = request.getParameter("mid");

MemberVO mvo = MemberDAO.getCustInfo(mid);


pageContext.setAttribute("mvo", mvo);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bitElectro : 고객정보 상세정보확인</title>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<!-- 상단메뉴 -->
<body>
<%@include file="headTap.jsp"%>
<br><br>
<!--  -->
<table id="board" style="width :450px;">
		<thead>
			<tr>
				<td id="tdHead" colspan="3" style="text-align: center;"><h1>고객 상세 정보</h1></td>
			</tr>
			<tr>
				<td id="tdHead" width="33%"><button class="buttonBox"
						onclick="javascript:history.back()">뒤로가기</button></td>
				<td id="tdHead"><button class="buttonBox"
						onclick="javascript:location.href='custModify.jsp?mid=${mvo.mid }'">수정</button></td>
				<td id="tdHead"><button class="buttonBox"
						onclick="javascript:location.href='custDelete.jsp?mid=${mvo.mid }'">삭제</button></td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th>ID</th>
				<td colspan="2">${mvo.mid }</td>
			</tr>
			<tr>
				<th>이름</th>
				<td colspan="2">${mvo.mname }</td>
			</tr>
			<tr>
				<th>연락처</th>
				<td colspan="2">${mvo.mphone }</td>
			</tr>
			<tr>
				<th>주소</th>
				<td colspan="2">${mvo.maddress }</td>
			</tr>
			<tr>
				<th>Email</th>
				<td colspan="2">${mvo.memail }</td>
			</tr>
			<tr>
				<th>고객포인트</th>
				<td colspan="2">${mvo.mpoint }</td>
			</tr>
			<tr>
				<th>누적구매액</th>
				<td colspan="2">${mvo.mcumulative_buy }</td>
			</tr>
			<tr>
				<th>회원가입일</th>
				<td colspan="2">${mvo.mjoindate }</td>
			</tr>
		</tbody>
	</table>
	</div>
</body>
</html>