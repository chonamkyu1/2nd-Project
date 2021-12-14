<%@page import="java.net.URLEncoder"%>
<%@page import="com.bitElectro.vo.CateProdVO"%>
<%@page import="com.bitElectro.vo.CategoryVO"%>
<%@page import="com.bitElectro.dao.CategoryDAO"%>
<%@page import="com.bitElectro.vo.ProductVO"%>
<%@page import="java.util.List"%>
<%@page import="com.bitElectro.dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%
//PRODUCT, CATEGORY JOIN 리스트 불러오기
List<CateProdVO> cpList= ProductDAO.getCateProdList();


//scope에 list저장
pageContext.setAttribute("cplist", cpList);

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bitElectro:상품리스트</title>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(function(){
	

	
//////////////////////////////////////////////////////////////
/////////////// 카테고리에 필요한 배열 선언

	/* 대분류별 중분류 */
	var bigMid =["TV/영상가전","냉장고","세탁기","의류건조기"]; //대형가전 중분류
	var weathMid = ["에어컨","제습기","선풍기"]; //계절가전 중분류
	var comMid = ["컴퓨터","PC부품"];
	var camMid = "카메라";
	var phoneMid = ["SKT","KT","LG","알뜰폰"];
	
	/* 중분류 별 소분류 */
	/* [대형가전의 소분류] */
	var tvSub =["TV","미니빔/사운드바","장식장/TV악세사리","디지털액자"];
	var pregSub=["양문형냉장고","일반냉장고","미니/차량용냉장고","업소용냉장고","김치냉장고"];
	var washSub=["일반세탁기","드럼세탁기","탈수기"];
	var drySub ="의류건조기";
	/* [계절가전의 소분류] */
	var airConSub=["스탠드형","벽걸이형","에어컨용품"];
	var dehum="제습기";
	var circulSub=["스탠드형","벽걸이형","미니선풍기"];
	/* [컴퓨터의 소분류] */
	var comSub=["노트북","데스크탑","모니터","태블릿PC"];
	var comPartSub=["CPU","RAM","메인보드","그래픽카드","사운드카드","파워","쿨러"];
	/* [카메라의 소분류] */
	var camSub=["DSLR","미러리스","디지털카메라","액션캠/캠코더","웹캠/CCTV"];
	/* [핸드폰의 소분류] */
	var phoneSub=["삼성전자","APPLE","LG전자","기타"];
	
	///////////////////////////////////////////////////////////
	//전체리스트 클릭시 function
	
	$("#listAll").click(function(){
		$("#tbody tr").remove();
		
		let tbody ="";
		tbody += "<c:forEach var='vo' items='${cplist }'>";
		tbody += "<tr>";
		tbody += "<td><a href=\"prodView.jsp?pcode='${vo.pcode }&cno='${vo.cno }'\"><b>${vo.pname }</b></a></td><td>${vo.cmain }</td><td>${vo.cmiddle }</td><td>${vo.csub }</td><td>${vo.pprice }</td><td>${vo.pstock }</td><td>${vo.pregist }</td>";
		tbody += "</tr>";
		tbody += "</c:forEach>";
		
		$("#tbody").html(tbody);
	});
	
	////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////
	//카테고리 변경시 change콜백함수
	
	$("#select").change(function(){
		
	///////////////////////////////////////////////////////
	// ------상품명으로 검색시
		if($("#select").val() == "pname"){
		
			$("#searchTool p").remove();
			let sHtml ="";
			sHtml += "<p><input type=\"text\" name=\"searchElement\" id=\"searchElement\">";
			sHtml += "</p>";
			$("#searchTool").append(sHtml);
			
	///////////////////////////////////////////////////////
	//-------카테고리로 검색시
		}else if($("#select").val() == "category"){
			
			$("#searchTool p").remove();
			let sHtml ="";
			sHtml += "<p>";
			sHtml += "<select name=\"categoryMain\" id=\"categoryMain\">";
			sHtml += "<option>대분류</option>";
			sHtml += "<option value=\"대형가전\">대형가전</option>";
			sHtml += "<option value=\"계절가전\">계절가전</option>";
			sHtml += "<option value=\"컴퓨터\">컴퓨터</option>";
			sHtml += "<option value=\"카메라\">카메라</option>";
			sHtml += "<option value=\"휴대폰\">휴대폰</option>";
			sHtml += "</select>";
			
			sHtml += "<select name=\"categoryMid\" id=\"categoryMid\">";
			sHtml += "<option>중분류</option></select>";
			
			sHtml += "<select name=\"categorySub\" id=\"categorySub\">";
			sHtml += "<option>소분류</option></select>";
			sHtml += "</p>";
			
			$("#searchTool").append(sHtml);
			
	////////////카테고리 클릭시 나올 콜백 함수
	
			$("#categoryMain").change(function(){
				
				/////////////////////////////////////////////			
					$("#categoryMid option").remove();
					if($("#categoryMain").val() == "대형가전"){//대형가전일 경우
						
						var str = ""; //추가할 html문
						str += "<option>중분류</option>";
						$.each(bigMid,function(i,item){//대형가전의 중분류 불러서 select 추가
							str += "<option value='"+item+"'>"+item+"</option>";					
						});
						$("#categoryMid").append(str);
							/* 1) 중분류 클릭하였을 경우 */
							$("#categoryMid").change(function(){
								
								$("#categorySub option").remove(); //categorySub단 지움
								
								if($("#categoryMid").val() == "TV/영상가전"){//TV/영상가전일 경우
									
									var str = ""; //추가할 html문
									str += "<option>소분류</option>";
									$.each(tvSub,function(i,item){//대형가전의 중분류 불러서 select 추가
										str += "<option value='"+item+"'>"+item+"</option>";					
									});
									
									$("#categorySub").append(str);
									
								}else if($("#categoryMid").val() == "냉장고"){
									
					
									var str = ""; //추가할 html문
									str += "<option>소분류</option>";
									$.each(pregSub,function(i,item){//대형가전의 중분류 불러서 select 추가
										str += "<option value='"+item+"'>"+item+"</option>";					
									});
									
									$("#categorySub").append(str);
									
								}else if($("#categoryMid").val() == "세탁기"){
									

									var str = ""; //추가할 html문
									str += "<option>소분류</option>";
									$.each(washSub,function(i,item){//대형가전의 중분류 불러서 select 추가
										str += "<option value='"+item+"'>"+item+"</option>";					
									});
									$("#categorySub").append(str);
									
								}else if($("#categoryMid").val() == "의류건조기"){
									

									var str = ""; //추가할 html문
									str += "<option>소분류</option>";
									$.each(drySub,function(i,item){//대형가전의 중분류 불러서 select 추가
										str += "<option value='"+item+"'>"+item+"</option>";					
									});
									$("#categorySub").append(str);
									
								}
							});
							/* 중분류 클릭 종료 */
							
					/////////////////////////////////////////////		
					}else if($("#categoryMain").val() == "계절가전"){//계절가전일 경우
						
						
						var str = ""; //추가할 html문
						str += "<option>중분류</option>";
						$.each(weathMid,function(i,item){//계절가전의 중분류 불러서 select 추가
							str += "<option value='"+item+"'>"+item+"</option>";					
						});
						$("#categoryMid").append(str);
						
						$("#categoryMid").change(function(){
							
							$("#categorySub option").remove(); //categorySub단 지움
							
							if($("#categoryMid").val() == "에어컨"){//에어컨일 경우
								
								var str = ""; //추가할 html문
								str += "<option>소분류</option>";
								$.each(airConSub,function(i,item){//대형가전의 중분류 불러서 select 추가
									str += "<option value='"+item+"'>"+item+"</option>";					
								});
								
								$("#categorySub").append(str);
								
							}else if($("#categoryMid").val() == "제습기"){//제습기일 경우
								
								var str = ""; //추가할 html문
								str += "<option>소분류</option>";
								str += "<option value='"+dehum+"'>"+dehum+"</option>";					
				
								$("#categorySub").append(str);
								
							}else if($("#categoryMid").val() == "선풍기"){ //선풍기
								
								var str = ""; //추가할 html문
								str += "<option>소분류</option>";
								$.each(circulSub,function(i,item){//대형가전의 중분류 불러서 select 추가
									str += "<option value='"+item+"'>"+item+"</option>";					
								});
								$("#categorySub").append(str);
								
							}
						});
						/* 중분류 클릭 종료 */
					/////////////////////////////////////////////		
					}else if($("#categoryMain").val() == "컴퓨터"){//컴퓨터일 경우
						
						var str = ""; //추가할 html문
						str += "<option>중분류</option>";
						$.each(comMid,function(i,item){//컴퓨터 중분류 불러서 select 추가
							str += "<option value='"+item+"'>"+item+"</option>";					
						});
						$("#categoryMid").append(str);
						
						$("#categoryMid").change(function(){
							
							$("#categorySub option").remove(); //categorySub단 지움
							
							if($("#categoryMid").val() == "컴퓨터"){//컴퓨터일 경우
								
								var str = ""; //추가할 html문
								str += "<option>소분류</option>";
								$.each(comSub,function(i,item){
									str += "<option value='"+item+"'>"+item+"</option>";					
								});
								
								$("#categorySub").append(str);
								
							}else if($("#categoryMid").val() == "PC부품"){
								
								var str = ""; //추가할 html문
								str += "<option>소분류</option>";
								$.each(comPartSub,function(i,item){
									str += "<option value='"+item+"'>"+item+"</option>";					
								});
								
								$("#categorySub").append(str);
								
							}
						});
						/* 중분류 클릭 종료 */
					/////////////////////////////////////////////
					}else if($("#categoryMain").val() == "카메라"){//카메라 일경우
						
						var str = ""; //추가할 html문
						str += "<option>중분류</option>";
						str += "<option value='"+camMid+"'>"+camMid+"</option>";					
						$("#categoryMid").append(str);
						
						/* 중분류 클릭 */
						$("#categoryMid").change(function(){
							
							$("#categorySub option").remove(); //categorySub단 지움
							
							if($("#categoryMid").val() == "카메라"){//카메라일 경우
								
								var str = ""; //추가할 html문
								str += "<option>소분류</option>";
								$.each(camSub,function(i,item){
									str += "<option value='"+item+"'>"+item+"</option>";					
								});
								
								$("#categorySub").append(str);
								
							}
						});
						/* 중분류 클릭 종료 */
						
					/////////////////////////////////////////////	
					}else if($("#categoryMain").val() == "휴대폰"){//휴대폰일 경우
					
						var str = ""; //추가할 html문
						str += "<option>중분류</option>";
						$.each(phoneMid,function(i,item){//휴대폰 중분류 불러서 select 추가
							str += "<option value='"+item+"'>"+item+"</option>";					
						});
						$("#categoryMid").append(str);
						
						/* 중분류 클릭 */
						$("#categoryMid").change(function(){
							
							$("#categorySub option").remove(); //categorySub단 지움
							
								//모든 경우든 동일한 select 추가
								var str = ""; //추가할 html문
								str += "<option>소분류</option>";
								$.each(phoneSub,function(i,item){
									str += "<option value='"+item+"'>"+item+"</option>";					
								});
								
								$("#categorySub").append(str);
								
							
						});
						/* 중분류 클릭 종료 */
					}
		});
			
	////////////////////////////////////////////////////////////		

		}else{ //검색기준 누를시
			$("#searchTool p").remove();
			$("#searchTool p").append("<p style=\"color:darkgrey;\">검색이 필요한 경우 기준을 선택</p>");
		}
		
		
	});

	/////////////////////////////////////////////////////////////
	//검색버튼을 누를 시 function
	$("#ok").click(function(){
		/* alert("검색버튼 연결완료"); */
		//$("#frm1").submit(); //임시 submit임 (ajax처리 예정임.)
		
		//검색 기준을 정하고 검색 버튼을 누르면 tbody에 새로이 작성하는 ajax작성
		$.ajax({
			url : "ProdSearch",
			type : "get",
			data : $("#frm1").serialize(),
			datatype : "xml",
			success : function(data){
				//alert("ajax처리 성공~");
				//게시물 결과 출력
				let tbody="";
				//이전의 내용을 먼저 지움.
				$("#tbody tr").remove();
				//전송받은 'data'에 대한 each function처리
				$(data).find("product").each(function(){
					
					let pcode= $(this).find("pcode").text();
					let pname= $(this).find("pname").text();
					let cno =$(this).find("cno").text(); //이후 개별보기에서 카테고리를 쉽게 도출하기 위함.
					let cmain= $(this).find("cmain").text();
					let cmiddle=$(this).find("cmiddle").text();
					let csub =$(this).find("csub").text();
					let pprice = $(this).find("pprice").text();
					let pstock = $(this).find("pstock").text();
					let presist = $(this).find("presist").text();

					tbody +="<tr>";
					tbody +="<td>"+"<a href='prodView.jsp?pcode="+encodeURI(pcode)+"&cno="+cno+"'><b>"+pname+"</b></a>"+"</td>";
					tbody +="<td>"+"<a href='prodView.jsp?pcode="+encodeURI(pcode)+"&cno="+cno+"'>"+cmain+"</a>"+"</td>";
					tbody +="<td>"+"<a href='prodView.jsp?pcode="+encodeURI(pcode)+"&cno="+cno+"'>"+cmiddle+"</a>"+"</td>";
					tbody +="<td>"+"<a href='prodView.jsp?pcode="+encodeURI(pcode)+"&cno="+cno+"'>"+csub+"</a>"+"</td>";
					tbody +="<td>"+"<a href='prodView.jsp?pcode="+encodeURI(pcode)+"&cno="+cno+"'>"+pprice+"</a>"+"</td>";
					tbody +="<td>"+"<a href='prodView.jsp?pcode="+encodeURI(pcode)+"&cno="+cno+"'>"+pstock+"</a>"+"</td>";
					tbody +="<td>"+"<a href='prodView.jsp?pcode="+encodeURI(pcode)+"&cno="+cno+"'>"+presist+"</a>"+"</td>";
					tbody +="</tr>";
					tbody +="</tbody>"
					
					$("#tbody").append(tbody);
					
				});
				
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
	
	
	
}); //Jquery문 종료
	
	

</script>

</head>
<body>
	<%@include file="headTap.jsp"%>
<br><br>
<form action ="ProdSearch" id="frm1" method="post">
<table style="width:860px;">

<tr>
		<td id="tdHead" colspan="2"><h1>상품 리스트</h1></td>
		<td id="tdHead" ><button class="buttonBox" id="listAll" type="button">전체리스트</button>&nbsp;</td>
		<td id="tdHead" >
			<select name = "select" id="select">
				<option>검색기준</option>
				<option value ="pname">상품명으로 검색</option>
				<option value ="category">카테고리로 검색</option>
			</select>&nbsp;
		</td>
		<td id="tdHead"  colspan ="2">
			<!-- 검색수단 컨테이너 -->
			<div id="searchTool">
			<p style="color:darkgrey;">검색이 필요한 경우 기준을 선택</p>
			</div>
		</td>
		<td id="tdHead"  colspan="2">
			<button class="buttonBox" id="ok" type="button">검색</button>&nbsp;
		</td>
	</tr>
</table>
<table id="board">
	<tr>
	<th>제 품 명</th><th>대분류</th><th>중분류</th><th>소분류</th><th>제품가격(Krw)</th><th>재고수량(EA)</th><th>최종수정일</th>
	</tr>
<tbody id="tbody">

<!-- 게시판 내용이 들어올 곳 -->
	<c:forEach var="vo" items="${cplist }">
	<tr>
		<c:url value="prodView.jsp" var="url">
			<c:param name ="pcode" value="${vo.pcode}"/>
		</c:url>
			<td><a href='${url }&cno=${vo.cno }'><b>${vo.pname }</b></a></td>
			<td><a href='${url }&cno=${vo.cno }'>${vo.cmain }</a></td>
			<td><a href='${url }&cno=${vo.cno }'>${vo.cmiddle }</a></td>
			<td><a href='${url }&cno=${vo.cno }'>${vo.csub }</a></td>
			<td><a href='${url }&cno=${vo.cno }'>${vo.pprice }</a></td>
			<td><a href='${url }&cno=${vo.cno }'>${vo.pstock }</a></td>
			<td><a href='${url }&cno=${vo.cno }'>${vo.pregist }</a></td>
	
	</tr>
	</c:forEach>
</tbody>
<tfoot>
</tfoot>
</table>
</form>

</body>
</html>