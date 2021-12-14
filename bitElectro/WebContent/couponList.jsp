<%@page import="com.bitElectro.vo.CouponVO"%>
<%@page import="java.util.List"%>
<%@page import="com.bitElectro.dao.CouponDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
request.setCharacterEncoding("UTF-8");

//기본적으로 모든 종류의 쿠폰을 가져옴
//다만, 같은 이름인 쿠폰은 모두 Groupby 처리할 것

List<CouponVO> cList =  CouponDAO.getCouponList();


for(CouponVO cvo: cList){
	
	String cdisper = cvo.getCdisper();
	String cdiscash = cvo.getCdiscash();
	//할인율의 데이터가 null이 아닐경우 % 붙임
	if(cdisper != null){ 
		cdisper += "(%)";
		cvo.setCdisper(cdisper);
	//할인 금액이 데이터가 null이 아닐경우 (원)을 붙임.
	}else{ 
		cdiscash += "(원)";
		cvo.setCdiscash(cdiscash);
	}
	
	//날짜 표현방식 지정(yy-mm-dd) 변경
	String date = cvo.getCordate().substring(2,10);
	cvo.setCordate(date);
}

pageContext.setAttribute("cList", cList);


//


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bitElectro : 쿠폰 관리</title>
<script src = "http://code.jquery.com/jquery-3.6.0.min.js"></script>
<%@include file="headTap.jsp"%>
<script>

	let couponDate =null;
	

	//jquery 시작
	$(function(){
		
		//검색 버튼 클릭시 발생 함수
		$("#ok").click(function(){
			//먼저 있던 내용 지움
			$("#tbody tr").remove();
			
			//ajax요청 후 응답처리 할 건데 실패 할 경우 검색결과를 찾을 수 없음 띄움/
			$.ajax({
				url :"couponSearchName",
				data :$("#frm1").serialize(),
				datatype : "xml",
				type:"GET",
				success : function(data){
					//alert("ajax연결 완료");
					
					$(data).find("cpvo").each(function(){
					let cordate = $(this).find("cordate").text();
					cordate = cordate.substring(2,10); //날짜 자르기
					let cvalidity = $(this).find("cvalidity").text();
					let cname = $(this).find("cname").text();
					let cdisper = $(this).find("cdisper").text();
					let cdiscash = $(this).find("cdiscash").text();
					let custCnt = $(this).find("custCnt").text();
					
					if(cdisper != "null"){
						cdisper += "(%)";
						cdiscash ="";
						
					}else{
						cdiscash += "(원)";
						cdisper ="";
					}
					
					html="";
					html += "<tr>"
					html += "<td>" + cordate + "</td>";
					html += "<td>" + cvalidity + "</td>";
					html += "<td>" + cname + "</td>";
					html += "<td>" + cdisper + cdiscash + "</td>";
					html += "<td>" + custCnt + "</td>";
					html += "<td>" + "<button type='button' class='buttonBox' onclick=\"javascript:location.href='deleteCoup.jsp?cname="+cname+"'\" style='width:35px; height:25px'> [-]</button>" + "</td>";
					html += "</tr>";
					
					$("#tbody").append(html);
					});
				
				},error : function(){
					alert("검색결과에 문제가 있습니다. 검색어를 확인해주세요");
				}
			});//ajax 끝
		//////////////////////////////////////////////////
		});
		
		//쿠폰리스트를 클릭하였을 때의 함수
		$("#coupListBtn").click(function(){
			//먼저 있던 내용 지움
			$("#tbody tr").remove();
			
			//그대로 전체리스트 끌어옴.
				tbody =  "";	
				tbody += "<c:forEach var='vo' items='${cList }'>";
				tbody += "<tr>";
				tbody += "<td>${vo.cordate }</td><td id=\"validDate\">발행일로부터 ${vo.cvalidity }일</td>";
				tbody += "<td>${vo.cname }</td><td>${vo.cdisper }${vo.cdiscash }</td><td>대상 고객 ${vo.cnt } 명</td>";
				tbody += "<td><button type='button' class='buttonBox' onclick='javascript:location.href=\"deleteCoup.jsp?cname=\"${vo.cname }\"' style=\'width:35px; height:25px\'>[-]</button></td>";
				tbody += "</tr>";
				tbody += "</c:forEach>";

			$("#tbody").append(tbody);
		});
		
		
	});//jquery 끝
	
</script>
</head>
<body>


<form action ="couponSearch" id="frm1">
<table id="board" >
	<thead>
	<tr>
		<td id="tdHead" colspan="2"><h1 style="text-align:center;">쿠폰발행 등록 / 삭제</h1></td>
		<td id="tdHead" colspan="2"><input type="text" name ="searchElement" id="searchElement" placeholder="검색어(쿠폰명)를 입력">
		<button class="buttonBox" id="ok" type="button">검색</button>
			</td>
		<td id="tdHead"><button type="button" id="coupListBtn" class="buttonBox">쿠폰리스트</button></td>
		<td id="tdHead"><button type="button" class="buttonBox" onclick="javascript:location.href='couponInsert.jsp'">쿠폰등록</button></td>
	</tr>
	<tr>
		<th>발행일</th><th>유효기간</th><th>쿠폰명</th><th>할인율(할인액)</th><th>발행 대상 고객수</th><th>삭제</th>
	</tr>
	</thead>
	<tbody id="tbody">
			<c:forEach var="vo" items="${cList }" >
				<tr>
					<td>${vo.cordate }</td><td id="validDate">발행일로부터 ${vo.cvalidity }일</td>
					<td>${vo.cname }</td><td>${vo.cdisper }${vo.cdiscash }</td><td>대상 고객 ${vo.cnt } 명</td>
					<td><button type='button' class='buttonBox' onclick='javascript:location.href="deleteCoup.jsp?cname=\"${vo.cname }\""' style='width:35px; height:25px'>[-]</button></td>
				</tr>
			</c:forEach>
	</tbody>
</table>
</form>

</body>
</html>