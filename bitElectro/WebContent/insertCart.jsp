<%@page import="com.bc.model.vo.CartVO"%>
<%@page import="com.bc.model.dao.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//파라미터가 값 다 받기
request.setCharacterEncoding("UTF-8");
String pcode = request.getParameter("pcode");
String mid = request.getParameter("mid");
String cno = request.getParameter("cno");
String pcnt = request.getParameter("pcnt");
CartVO cvo=new CartVO();
cvo.setPcode(pcode);
cvo.setMid(mid);
cvo.setCno(cno);
cvo.setPcnt(pcnt);

CartDAO.insertCart(cvo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 등록</title>
<script>
alert("장바구니에 제품이 담겼습니다!");
history.go(-2);
</script>
</head>
<body>

</body>
</html>