<%@page import="com.bitElectro.vo.MemberVO"%>
<%@page import="com.bitElectro.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String mid = request.getParameter("mid");
MemberVO mvo = MemberDAO.getUserInfo(mid);
pageContext.setAttribute("mvo", mvo);


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bitElectro:관리자 상세 정보</title>
<%@include file="headTap.jsp"%>
</head>
<body>
	<table id="board" style = "width:450px;">
		<thead>
			<tr>
				<td id="tdHead" colspan="3" style="text-align: center;"><h1>관리자리스트</h1></td>
			</tr>
			<tr>
				<td id="tdHead"><button class="buttonBox"
						onclick="javascript:history.back()">뒤로가기</button></td>
				<td id="tdHead"><button class="buttonBox"
						onclick="javascript:location.href='adminModify.jsp?mid=${mvo.mid }'">정보수정</button></td>
				<td id="tdHead"><button class="buttonBox"
						onclick="javascript:location.href='adminDelete.jsp?mid=${mvo.mid }'">정보삭제</button></td>
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
		</tbody>
	</table>
	</div>
</body>
</html>