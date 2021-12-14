<%@page import="com.bitElectro.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="com.bitElectro.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
List<MemberVO> list = MemberDAO.adminList();

pageContext.setAttribute("list", list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bitElectro:관리자페이지</title>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<%@include file="headTap.jsp"%>
<script>

	//Jquery호출
	$(function(){
	
		$("#listAll").click(function(){
			$("#tbody tr").remove(); //테이블에 불러와 있는 주소 삭제
			let tbody ="";
			
			tbody += "<c:forEach var='vo' items='${list }'>";
			tbody += "<tr>";
			tbody += "<td width='26%'><a href='adminView.jsp?mid=${vo.mid }'>${vo.mid }</a></td>";
			tbody += "<td><a href='adminView.jsp?mid=${vo.mid }'>${vo.mname }</a></td>";
			tbody += "<td>${vo.mphone }</td>";
			tbody += "<td><button type = 'button' class='buttonBox' type='button'><a href='adminModify.jsp?mid=${vo.mid }'>수정</a></button>";
			tbody += "<button class='buttonBox' type = 'button' onclick=\"javascript:location.href='adminDelete.jsp?mid=${vo.mid }'\">삭제</button></td>";
			tbody += "</tr>";
			tbody += "</c:forEach>";
			
			$("#tbody").html(tbody);
			
		});
	
	
		//검색시 function
		$("#ok").click(function(){ //검색버튼을 눌렀을 때 할 실시할 내용
		
		$("#tbody tr").remove(); //테이블에 불러와 있는 주소 삭제
		
			/* alert("searchElement : " + $("#searchElement").val());
			alert("select : " + $("#select").val()) */
			$.ajax({
				url:"adminSearchName", //url : Sevlet 으로 연결하는 주소
				type:"GET", // 데이터전송방식 GET 
				data : $("#adminSearch").serialize(), //form의 파라미터 값 전부 전달 받기
				datatype: "xml", //응답받을 데이터 타입
				success : function(data){
					/* alert(">>ajax 연결 성공."); */
					//전달받은 XML 데이터 처리
					let tbody = "";
					$(data).find("member").each(function(){//<member>태그 내용만 찾아 배열로 만들기
					let mid = $(this).find("mid").text();
						
					tbody += "<tr>";
					tbody += "<td width='26%'><a href='adminView.jsp?mid="+mid+"'>"+ $(this).find("mid").text()+ "</td>";
					tbody += "<td><a href='adminView.jsp?mid="+mid+"'>"+ $(this).find("mname").text()+ "</td>";
					tbody += "<td>"+ $(this).find("mphone").text()+ "</td>";
					tbody += "<td><button type = 'button' class='buttonBox' ";
					tbody += "onclick =\"javascript:location.href='adminModify.jsp?mid="+mid+"'\"";
					tbody += ">수정</button>";
					tbody += "<button class='buttonBox' type = 'button' onclick=\"javascript:location.href='adminDelete.jsp?mid="+mid+"'\">삭제</button></td>";
					tbody += "</tr>";
					
					});
					$("#tbody").html(tbody);
				
				},
					
				error : function(){
					let tbody = "";
					tbody += "<tr>";
					tbody += "<td colspan=\"4\">검색결과를 찾을 수 없습니다</td>";
					tbody += "</tr>";
					$("#tbody").html(tbody);
				}	
			});  
		});
	
	});

</script>
</head>
<!-- 상단메뉴 -->
<body>
<br><br>
<!--  -->
<form id="adminSearch">
<table id="board" style ="border:none;">
	<tr>
		<td id="tdHead"><h1>관리자리스트</h1></td>
		<td id="tdHead"><button class="buttonBox" id="listAll" type="button">전체리스트</button>&nbsp;</td>
		<td id="tdHead"><select name = "select" id="select">
			<option value ="mid">ID로 검색</option>
			<option value ="mname">이름으로 검색</option></select>&nbsp;
		<input style = "width:100px;"type="text" name="searchElement" id="searchElement"></td>
		<td id="tdHead">
		<button class="buttonBox" id="ok" type="button">검색</button>&nbsp;
		</td>
		<td id="tdHead">
		<button type = "button" class="buttonBox" onclick="javascript:location.href='adminResister.jsp'">관리자 등록</button>
		
		</td>
	</tr>
</table>
</form>
<form action="adminView" id="adminView">
<table id="board">
	
		<tr>
			<th>관리자ID</th><th>관리자명</th><th>연락처</th><th>작업분류</th>
		</tr>
	
<tbody id="tbody">
<!-- 게시판 내용이 들어갈 장소 -->
	<c:forEach var='vo' items='${list }'>
		<tr>
			<td width='26%'><a href='adminView.jsp?mid=${vo.mid }'>${vo.mid }</a></td>
			<td><a href='adminView.jsp?mid=${vo.mid }'>${vo.mname }</a></td>
			<td>${vo.mphone }</td>
			<td><button type = 'button' class='buttonBox' onclick="javascript:location.href='adminModify.jsp?mid=${vo.mid }'">수정</button>
			<button class='buttonBox' type = 'button' onclick="javascript:location.href='adminDelete.jsp?mid=${vo.mid }'">삭제</button></td>
		</tr>
	</c:forEach>
</tbody>

</table>
</form>

</body>
</html>