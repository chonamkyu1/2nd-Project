<%@page import="com.bc.model.dao.NoticeDAO"%>
 <%@page import="com.bc.model.vo.NoticeVO"%>
<%@page import="java.util.List"%>
<%@page import="com.bc.model.common.Paging"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<script>
let answer = confirm("문의내역을 정말로 삭제하시겠습니까?");
if(answer){ 

<%
request.setCharacterEncoding("UTF-8");
System.out.println("inquireDelete 실행 ~~");

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

System.out.println("nvo.getCno() : " + nvo.getCno());

int cno = nvo.getCno();

NoticeDAO.deleteNoticeOne(cno);
%>

alert("문의 내역이 삭제되었습니다.");
location.href="inquire.jsp";
}else{ //confirm "취소"일 경우 뒤로가기
	alert("삭제취소");
history.back();
}
</script>
<meta charset="UTF-8">
<title>관리자 삭제</title>
</head>
<body>

</body>
</html>