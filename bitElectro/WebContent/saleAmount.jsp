<%@page import="java.util.Calendar"%>
<%@page import="java.sql.Date"%>
<%@page import="com.bitElectro.vo.CategoryVO"%>
<%@page import="com.bitElectro.vo.ProductVO"%>
<%@page import="com.bitElectro.dao.CategoryDAO"%>
<%@page import="com.bitElectro.dao.ProductDAO"%>
<%@page import="com.bitElectro.vo.OrderBookDetailVO"%>
<%@page import="java.util.List"%>
<%@page import="com.bitElectro.dao.OrderBookDetailDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
// 1. 전체 매출리스트


// 1-1. 이번달 매출리스트
List<OrderBookDetailVO> currMonthList = OrderBookDetailDAO.monthlyAmount();
pageContext.setAttribute("currMonthList", currMonthList);

// 2. 이번달 합계
int monthAmount = 0;
for(OrderBookDetailVO odvo : currMonthList){
	monthAmount += Integer.parseInt(odvo.getO_amount());
}
pageContext.setAttribute("monthAmount", monthAmount);
//System.out.println("currMonthList : "+currMonthList);

//오늘 날짜 저장
Calendar cal = Calendar.getInstance();
int year = cal.get(Calendar.YEAR);
int month = cal.get(Calendar.MONTH)+1;
String today = year + " / " + month;

// 3. 년/월/일별 매출리스트 (range)
// jquery <select> 연간 매출 html(<input>) <> 월간매출 <> 일간 매출<>
//--> 완료
// 4. 매출 게시판
// --> 완료
 

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bitElectro : 매출현황</title>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="style.css" rel="stylesheet" type="text/css">

<script>

function submit_period(){
	
	$("#tbody tr").remove();
	//검색 후 할 행동.
 	////////////////////////////////
	$.ajax({
		url:"salesAmount",
		type:"get",
		data:$("#salesForm").serialize(),
		datatype:"xml",
		success:function(data){
			if(!($(data).find("amount").text()=="")){
				
			$(data).find("amount").each(function(){
				let period = $(this).find("period").text();
				let periodAmount = $(this).find("period_amount").text();
				let html="";
				html += "<tr>";
				html += "<th>"+period+"</th>";
				html += "<td colspan=\"2\">"+periodAmount+"원</td>";
				html += "</tr>";
				
				$("#tbody").append(html);
			});
			}else{
				let html="";
				html += "<tr>";
				html += "<td colspan=\"3\">검색 결과를 찾을 수 없습니다.</th>";
				html += "</tr>";
				$("#tbody").append(html);
			}
			
		},error:function(){
			alert("검색이 불가능합니다. 입력하신 기간을 확인해주시기 바랍니다.");
		}
	});
	
	//게시할 내용이 없을 경우
	if(typeof($("#tbody").html()) == "undefined"){
		alert("검색기간내에 결과가 존재하지 않습니다.");
	} 
}
////////////////////////////////////////////////////////////////////
//이번달 매출 출력 함수

function currSalesList(){
	$("#tbody tr").remove();
	let html="";
	html += "<c:forEach var='vo' items='${currMonthList}'>";
	html += "<tr>";
	html += "<td>${vo.odate }</td><td colspan=\"2\">${vo.o_amount } 원 (krw)</td>";
	html += "</tr>";
	html += "</c:forEach>";
	$("#tbody").append(html);
}
////////////////////////////////////////////////////////////////////
//Jquery 시작
$(function(){
	//연도별 매출 눌렀을 때
	$("#year").click(function(){
		//연도별 데이터 출력
		
		//alert("연도별 매출 연결");
		//먼저 있던 내용 삭제
		$("#searchTools p").remove();
		$("#year").css("border","2px solid black");
		$("#month").css("border","1px solid darkgrey");
		$("#date").css("border","1px solid darkgrey");
		let html = "";
		html += "<p>연도별 전체 매출을 검색합니다.</p>";
		html += "<p><input type=\"hidden\" name=\"year\" id=\"year\" value=\"year\"><br><br>";
		html += "<button type=\"button\" class=\"buttonBox\" onclick=\"submit_period()\">연도별 검색</button>";
		html += "</p>";
		$("#searchTools").append(html);
		
		});

	
	$("#month").click(function(){
		//월별 데이터 출력
		
		//alert("월별 매출 연결");
		//먼저 있던 내용 삭제.
		$("#searchTools p").remove();
		$("#year").css("border","1px solid darkgrey");
		$("#date").css("border","1px solid darkgrey");
		$("#month").css("border","2px solid black");
		//월 지정 후 파라미터 넘길 것
		let html = "";
		html += "<p>지정한 기간의 월별 전체 매출을 검색합니다.</p>";
		html += "<p><input type=\"number\" name=\"month\" id=\"month\" placeholder='검색연도(4자리) 입력' maxlength='4'><br><br>";
		html += "<button type=\"button\" class=\"buttonBox\" onclick=\"submit_period()\">검색</button>";
		html += "</p>";
		$("#searchTools").append(html);
		////////////////////////////////
		
		});
	

	$("#date").click(function(){
		//alert("일별 매출 연결");
		//일 지정후 파라미터 넘길 것.
		
		//alert("일별 매출 연결");
		//먼저 있던 내용 삭제.
		$("#searchTools p").remove();
		$("#year").css("border","1px solid darkgrey");
		$("#month").css("border","1px solid darkgrey");
		$("#date").css("border","2px solid black");
		//월 지정 후 파라미터 넘길 것
		let html = "";
		$("#date").css("border","2px solid black");
		html += "<p>지정한 기간의 일별 전체 매출을 검색합니다.</p>";
		html += "<p><input type=\"month\" name=\"date\" id=\"date\" placeholder=\"검색할 월을 입력(YYYY-MM)\"><br><br>";
		html += "<button type=\"button\" class=\"buttonBox\" onclick=\"submit_period()\">검색</button>";
		html += "</p>";
		$("#searchTools").append(html);
		
		});
	
	///////////////////////////////////////
	
	
	
});//jQuery 끝


</script>


</head>
	<!-- 상단메뉴 시작 -->
	<body>
	<%@include file="headTap.jsp"%>

	<br><br>
	<h1>매출 현황</h1><br><br>
	<!-- 상단메뉴 끝 -->
	<form id="salesForm" action="salesAmount">
		<table id="board" style="width:500px;">
		<!-- thead 시작 -->
			<thead>
				<tr>
					<td colspan="3" id ="tdHead"><hr></td>
				</tr>
				<tr>
					<th> [ <%=today %> 월 ] 매출액 </th>
					<fmt:formatNumber value="${monthAmount }" pattern ="###,###" var="monthAmountResult" type="number"/>
					<td colspan="2"> <a href="javascript:void(0)" onclick='currSalesList()'><b>${monthAmountResult }원(Krw)</b></a> </td>
				</tr>
				<tr>
					<td colspan ="3"  id ="tdHead"><hr></td>
				</tr>
				<tr>
					<td id="tdHead" style="width:33%"><button type = "button" class="buttonBox" id="year">연도별 매출</button></td>
					<td id="tdHead"><button type = "button" class="buttonBox" id="month">월별 매출</button></td>
					<td id="tdHead"><button type = "button" class="buttonBox" id="date">일별 매출</button></td>
				</tr>	
				<tr>
					<td id="searchTools" colspan="3">
					<!-- 검색기간과 검색 버튼이 나올 자리 -->
						<p>연 / 월 / 일 단위로 매출 조회가 가능합니다.</p>
						
					</td>
				</tr>
				<tr>
					<td colspan="3" id ="tdHead"><hr></td>
				</tr>
				<tr>
					<th>날짜</th><th colspan="2">판매금액</th>
				</tr>
			</thead>
			<!-- thead 끝 -->
			<!-- tbody 시작 -->
			<tbody id="tbody">
				<!-- 매출 검색 내용이 올 자리 -->
				<!-- 최초 접속시 당월 매출 현황 게시 -->
					<c:forEach var="vo" items="${currMonthList}">
					<tr>
						<th>${vo.odate }</th><td colspan="2">${vo.o_amount } 원 (krw)</td>
					</tr>
					</c:forEach>
			</tbody>
			<!-- tbody 끝 -->
			<tfoot>
			<tr>
			<td colspan="3"><button type="button" class="buttonBox" onclick="javascript:location.href='#'"> ▲ TOP ▲ </button></td>
			</tr>
			</tfoot>
		</table>
	</form>
</body>
</html>