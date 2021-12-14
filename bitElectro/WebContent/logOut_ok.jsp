<%@page import="com.bc.model.vo.LogInVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

	HttpSession Session = request.getSession(false);
	System.out.println("Session: " + Session.toString());

	LogInVO vo = (LogInVO)session.getAttribute("vo");
	System.out.println("logOut_ok vo: " + vo);
	
	System.out.println((LogInVO)session.getAttribute("vo"));
	
	session.invalidate();
	
	//System.out.println((LogInVO)session.getAttribute("vo"));
	
	//System.out.println("invalidate후 logOut_ok vo: " + vo);
	//System.out.println("vo.getMid(): " + vo.getMid());
	//request.getRequestDispatcher("logIn.jsp").forward(request, response);
	response.sendRedirect("logIn.jsp");

%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	/* alert("로그아웃 처리되었습니다.");
	location.href="index.jsp"; */
</script>
</head>
<body>
</body>
</html>