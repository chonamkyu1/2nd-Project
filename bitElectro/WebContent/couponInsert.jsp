<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지 : 쿠폰등록</title>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

$(function(){
	
	//쿠폰 발행조건
	$("#condition").change(function(){
		
		
		//전체 고객 쿠폰이 눌렸을 경우
		if($("#condition").val() == "allCust"){
		//이전 기록을 삭제
		$("#conditionInput td").remove();
		
		html ="";
		html += "<td colspan=\"2\">";
		html += "<p> <b>&lt;&lt; 전체 고객을 대상으로 쿠폰발행 &gt;&gt;</b> </p>"
		html += "</td>";
		
		
		
		$("#conditionInput").append(html);
		
		}
		
		//누적구매금액이 체크 되었을 시
		else if ($("#condition").val() == "sumPay"){
			$("#conditionInput td").remove();
			
			html ="";
			html += "<td>";
			html += "<p> <b>누적구매금액</b> </p>"
			html += "</td>";
			html += "<td>";
			html += "<input style=\"width:150px;\" type=\"number\" name=\"sumPayNum\"id=\"sumPayNum\" placeholder=\"누적구매금액(원)\">이상 구매고객";
			html += "</td>";
			
			$("#conditionInput").append(html);
		}
		
		//발행조건으로 다시 돌아갔을 시
		else{
			$("#conditionInput td").remove();
			html ="";
			html += "<td colspan=\"2\">";
			html += "<p> <b>&lt;&lt; 쿠폰의 발행조건을 선택해주세요 &gt;&gt;</b> </p>"
			html += "</td>";
			
			$("#conditionInput").append(html);
			
		}
		
	});
	
	//할인방식 및 할인범위 선택 함수
 	$("input[name='discount']").change(function(){
 		//radio 체크 데이터 인식작업
 		
 		$("input[name='discount']").each(function(){
 		var value = $(this).val();
 		var checked = $(this).prop("checked");
 		if(checked){
 			//할인방식에 따른 html 추가
 	 		if(value == 'ratio'){
 				$("#discValue td").remove();
 				html ="";
 				html += "<td><b>할인율(%)</b></td>";
 				html += "<td><input type='number' name ='discValNum' id='discValNum' placeholder='할인율_1-100(%) 입력'>";
 				html += "</td>";
 				
 				$("#discValue").append(html);
 				
 	 		}else{
 	 			$("#discValue td").remove();
 				html ="";
 				html += "<td><b>할인액(krw)</b></td>";
 				html += "<td><input type='number' name ='discValNum' id='discValNum' placeholder='할인금액(원) 입력'>";
 				html += "</td>";
 				
 				$("#discValue").append(html);
 	 		}
 			
 		}
 		});
	}); 
	
	//////////////////////////////////////////////////
	//검사 및 submit 함수
	function send_resist(){
		
		//쿠폰명이 공란일 경우
		if ($("#cname").val().trim() == "") {
			alert("쿠폰명이 공란입니다.");
			$("#cname").focus();
			return;
		}
		
		//발행조건이 선택되지 않았을 경우
		if($("#condition").val()=="::발행조건 선택::"){
			alert("발행조건을 선택해주시기 바랍니다.")
			$("#cname").focus();
			return;
		}
		
		//발행조건 중 누적구매 금액일 경우 금액이 없을 경우 
		
		if($("#condition").val() == "sumPay"){
		if($("#sumPayNum").val().trim() == ""){
			alert("쿠폰 발행대상의 누적구매금액을 입력하셔야 합니다.");
			$("#sumPayNum").focus();
			return;
		}
		}
		
		
		//쿠폰 유효기간이 공란일 경우
		if ($("#cvalidity").val().trim() == "") {
			alert("쿠폰의 유효기간을 입력해주세요");
			$("#cvalidity").focus();
			return;
		}
		
		//할인방식이 체크되어 있지 않을 경우
		if($("input[name='discount']:checked").val()){
			//alert("할인방식 체크됨");
			}else{
			alert("할인방식을 체크해주세요");
			$("#cname").focus();
			return;
		}
		
		//할인율 또는 할인 금액이 체크 되어 있는 상황중 내용이 안 적혀 있을 경우
		if($("#discValNum").val() == ""){
			alert("할인을 원하시는 범위를 숫자로 입력해주세요.");
			$("#discValNum").focus();
			return;
			}

		// 등록 전 확인!
		let answer = confirm("해당 제품을 등록하시겠습니까?");
		if (answer) {
			$("#frm1").submit();
		} else {
			$("#cname").focus();
			return;
		}
	}

	
	/////////////////////////////////////////////////
	//enter키를 눌렀을 때
	$("#frm input").keydown(function(enter){
		if(enter.keyCode==13){
		send_resist();
		}
	});
	
	//등록 버튼 눌렀을 때
	$("#ok").click(function(){
		send_resist();
	});
	//////////////////////////////////////////////////		
});//jQuery 종료

</script>
</head>
<body>
<%@include file="headTap.jsp"%>

	<form action="couponInsert" id="frm1">
	<table id="board" style="width:450px;">
		<tr>
			<td colspan="3" id="tdHead"><h1>쿠폰 등록 페이지</h1></td>
		</tr>
		<tr>
			<th>쿠폰명</th><td colspan="2"><input type="text" name="cname" id="cname" placeholder="쿠폰명을 입력">
		</tr>
		<tr>
			<th>발행조건</th>
			<td colspan="2"><select name = "condition" id="condition">
				<option>::발행조건 선택::</option>
				<option value="allCust">전체고객 발행 쿠폰</option>
				<option value="sumPay">누적구매금액으로 발행</option>
			</select></td>
		<!-- 누적구매 선택시 추가될 자리 -->
		<tr id="conditionInput">
		 <td colspan="2">
		 	<p><b>&lt;&lt; 쿠폰의 발행조건을 선택해주세요 &gt;&gt;</b>
		 </td>
		</tr>
		<tr>
			<th>쿠폰 유효기간</th>
			<td><input type="number" name= "cvalidity" id="cvalidity" placeholder="발행일로부터(--일)"></td> 
		</tr>
		<tr>
			<th>할인방식</th>
			<td style="font-size:1.1em;">
			<input style="width:20px;" type="radio" name="discount" value="ratio">할인율&nbsp;&nbsp;&nbsp;
			<input style="width:20px;" type="radio" name="discount" value="krw">할인금액 </td>
		</tr>
		<!-- 할인 방식 선택시 추가될 자리-->
		<tr id="discValue">
		</tr>
		<tr>
			<td colspan="2">
			<button type="button" class="buttonBox" id="ok">쿠폰 등록</button>
			<button type="button" class="buttonBox" onclick="javascript:history.back()">등록 취소</button>
			</td>
		</tr>
		
		
	
	</table>
	
	</form>
	




</body>
</html>