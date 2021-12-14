<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지 : 상품등록</title>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function() {
		/* 대분류별 중분류 */
		var bigMid = [ "TV/영상가전", "냉장고", "세탁기", "의류건조기" ]; //대형가전 중분류
		var weathMid = [ "에어컨", "제습기", "선풍기" ]; //계절가전 중분류
		var comMid = [ "컴퓨터", "PC부품" ];
		var camMid = "카메라";
		var phoneMid = [ "SKT", "KT", "LG", "알뜰폰" ];

		/* 중분류 별 소분류 */
		/* [대형가전의 소분류] */
		var tvSub = [ "TV", "미니빔/사운드바", "장식장/TV악세사리", "디지털액자" ];
		var pregSub = [ "양문형냉장고", "일반냉장고", "미니/차량용냉장고", "업소용냉장고", "김치냉장고" ];
		var washSub = [ "일반세탁기", "드럼세탁기", "탈수기" ];
		var drySub = "의류건조기";
		/* [계절가전의 소분류] */
		var airConSub = [ "스탠드형", "벽걸이형", "에어컨용품" ];
		var dehum = "제습기";
		var circulSub = [ "스탠드형", "벽걸이형", "미니선풍기" ];
		/* [컴퓨터의 소분류] */
		var comSub = [ "노트북", "데스크탑", "모니터", "태블릿PC" ];
		var comPartSub = [ "CPU", "RAM", "메인보드", "그래픽카드", "사운드카드", "파워", "쿨러" ];
		/* [카메라의 소분류] */
		var camSub = [ "DSLR", "미러리스", "디지털카메라", "액션캠/캠코더", "웹캠/CCTV" ];
		/* [핸드폰의 소분류] */
		var phoneSub = [ "삼성전자", "APPLE", "LG전자", "기타" ];

		//1.대분류를 클릭하였을 경우
		$("#categoryMain")
				.change(
						function() {
							/////////////////////////////////////////////			
							$("#categoryMid option").remove();
							if ($("#categoryMain").val() == "대형가전") {//대형가전일 경우

								var str = ""; //추가할 html문
								str += "<option>중분류</option>";
								$.each(bigMid, function(i, item) {//대형가전의 중분류 불러서 select 추가
									str += "<option value='"+item+"'>" + item
											+ "</option>";
								});
								$("#categoryMid").append(str);
								/* 1) 중분류 클릭하였을 경우 */
								$("#categoryMid")
										.change(
												function() {

													$("#categorySub option")
															.remove(); //categorySub단 지움

													if ($("#categoryMid").val() == "TV/영상가전") {//TV/영상가전일 경우

														var str = ""; //추가할 html문
														str += "<option>소분류</option>";
														$
																.each(
																		tvSub,
																		function(
																				i,
																				item) {//대형가전의 중분류 불러서 select 추가
																			str += "<option value='"+item+"'>"
																					+ item
																					+ "</option>";
																		});

														$("#categorySub")
																.append(str);

													} else if ($("#categoryMid")
															.val() == "냉장고") {

														var str = ""; //추가할 html문
														str += "<option>소분류</option>";
														$
																.each(
																		pregSub,
																		function(
																				i,
																				item) {//대형가전의 중분류 불러서 select 추가
																			str += "<option value='"+item+"'>"
																					+ item
																					+ "</option>";
																		});

														$("#categorySub")
																.append(str);

													} else if ($("#categoryMid")
															.val() == "세탁기") {

														var str = ""; //추가할 html문
														str += "<option>소분류</option>";
														$
																.each(
																		washSub,
																		function(
																				i,
																				item) {//대형가전의 중분류 불러서 select 추가
																			str += "<option value='"+item+"'>"
																					+ item
																					+ "</option>";
																		});
														$("#categorySub")
																.append(str);

													} else if ($("#categoryMid")
															.val() == "의류건조기") {

														var str = ""; //추가할 html문
														str += "<option>소분류</option>";
														$
																.each(
																		drySub,
																		function(
																				i,
																				item) {//대형가전의 중분류 불러서 select 추가
																			str += "<option value='"+item+"'>"
																					+ item
																					+ "</option>";
																		});
														$("#categorySub")
																.append(str);

													}
												});
								/* 중분류 클릭 종료 */

								/////////////////////////////////////////////		
							} else if ($("#categoryMain").val() == "계절가전") {//계절가전일 경우

								var str = ""; //추가할 html문
								str += "<option>중분류</option>";
								$.each(weathMid, function(i, item) {//계절가전의 중분류 불러서 select 추가
									str += "<option value='"+item+"'>" + item
											+ "</option>";
								});
								$("#categoryMid").append(str);

								$("#categoryMid")
										.change(
												function() {

													$("#categorySub option")
															.remove(); //categorySub단 지움

													if ($("#categoryMid").val() == "에어컨") {//에어컨일 경우

														var str = ""; //추가할 html문
														str += "<option>소분류</option>";
														$
																.each(
																		airConSub,
																		function(
																				i,
																				item) {//대형가전의 중분류 불러서 select 추가
																			str += "<option value='"+item+"'>"
																					+ item
																					+ "</option>";
																		});

														$("#categorySub")
																.append(str);

													} else if ($("#categoryMid")
															.val() == "제습기") {//제습기일 경우

														var str = ""; //추가할 html문
														str += "<option>소분류</option>";
														str += "<option value='"+dehum+"'>"
																+ dehum
																+ "</option>";

														$("#categorySub")
																.append(str);

													} else if ($("#categoryMid")
															.val() == "선풍기") { //선풍기

														var str = ""; //추가할 html문
														str += "<option>소분류</option>";
														$
																.each(
																		circulSub,
																		function(
																				i,
																				item) {//대형가전의 중분류 불러서 select 추가
																			str += "<option value='"+item+"'>"
																					+ item
																					+ "</option>";
																		});
														$("#categorySub")
																.append(str);

													}
												});
								/* 중분류 클릭 종료 */
								/////////////////////////////////////////////		
							} else if ($("#categoryMain").val() == "컴퓨터") {//컴퓨터일 경우

								var str = ""; //추가할 html문
								str += "<option>중분류</option>";
								$.each(comMid, function(i, item) {//컴퓨터 중분류 불러서 select 추가
									str += "<option value='"+item+"'>" + item
											+ "</option>";
								});
								$("#categoryMid").append(str);

								$("#categoryMid")
										.change(
												function() {

													$("#categorySub option")
															.remove(); //categorySub단 지움

													if ($("#categoryMid").val() == "컴퓨터") {//컴퓨터일 경우

														var str = ""; //추가할 html문
														str += "<option>소분류</option>";
														$
																.each(
																		comSub,
																		function(
																				i,
																				item) {
																			str += "<option value='"+item+"'>"
																					+ item
																					+ "</option>";
																		});

														$("#categorySub")
																.append(str);

													} else if ($("#categoryMid")
															.val() == "PC부품") {

														var str = ""; //추가할 html문
														str += "<option>소분류</option>";
														$
																.each(
																		comPartSub,
																		function(
																				i,
																				item) {
																			str += "<option value='"+item+"'>"
																					+ item
																					+ "</option>";
																		});

														$("#categorySub")
																.append(str);

													}
												});
								/* 중분류 클릭 종료 */
								/////////////////////////////////////////////
							} else if ($("#categoryMain").val() == "카메라") {//카메라 일경우

								var str = ""; //추가할 html문
								str += "<option>중분류</option>";
								str += "<option value='"+camMid+"'>" + camMid
										+ "</option>";
								$("#categoryMid").append(str);

								/* 중분류 클릭 */
								$("#categoryMid")
										.change(
												function() {

													$("#categorySub option")
															.remove(); //categorySub단 지움

													if ($("#categoryMid").val() == "카메라") {//카메라일 경우

														var str = ""; //추가할 html문
														str += "<option>소분류</option>";
														$
																.each(
																		camSub,
																		function(
																				i,
																				item) {
																			str += "<option value='"+item+"'>"
																					+ item
																					+ "</option>";
																		});

														$("#categorySub")
																.append(str);

													}
												});
								/* 중분류 클릭 종료 */

								/////////////////////////////////////////////	
							} else if ($("#categoryMain").val() == "휴대폰") {//휴대폰일 경우

								var str = ""; //추가할 html문
								str += "<option>중분류</option>";
								$.each(phoneMid, function(i, item) {//휴대폰 중분류 불러서 select 추가
									str += "<option value='"+item+"'>" + item
											+ "</option>";
								});
								$("#categoryMid").append(str);

								/* 중분류 클릭 */
								$("#categoryMid")
										.change(
												function() {

													$("#categorySub option")
															.remove(); //categorySub단 지움

													//모든 경우든 동일한 select 추가
													var str = ""; //추가할 html문
													str += "<option>소분류</option>";
													$
															.each(
																	phoneSub,
																	function(i,
																			item) {
																		str += "<option value='"+item+"'>"
																				+ item
																				+ "</option>";
																	});

													$("#categorySub").append(
															str);

												});
								/* 중분류 클릭 종료 */
							}

						}); //CategoryMain의 change function 끝
		////////////////////////////////////////////////////////////////

	});//Jquery끝

	//등록 버튼 눌렀을 때
	function send_submit() {

		if ($("#pname").val().trim() == "") {
			alert("제품명이 공란입니다.");
			$("#pname").focus();
			return;
		}
		if ($("#categoryMain").val().trim() == "대분류") {
			alert("대분류를 선택해주십시오.");
			$("#pname").focus();
			return;
		}
		if ($("#categoryMid").val().trim() == "중분류") {
			alert("중분류를 선택해주십시오.");
			$("#pname").focus();
			return;
		}
		if ($("#categorySub").val().trim() == "소분류") {
			alert("소분류를 선택해주십시오.");
			$("#pname").focus();
			return;
		}
		if ($("#pprice").val().trim() == "") {
			alert("제품의 가격을 입력해주십시오.");
			$("#pprice").focus();
			return;
		}
		if ($("#pstock").val().trim() == "") {
			alert("초기재고 수량을 입력해주십시오.");
			$("#pstock").focus();
			return;
		}

		// 등록 전 확인!
		let answer = confirm("해당 제품을 등록하시겠습니까?");
		if (answer) {
			$("#frm1").submit();
		} else {
			$("#pname").focus();
			return;
		}
	}
</script>
</head>
<body>
	<%@include file="headTap.jsp"%>

	<form action="insertProd_proc.jsp" id="frm1"
		enctype="multipart/form-data" method="post">
		<div id="container">
			<table id="board">
				<thead>
					<tr>
						<td colspan="2" id="tdHead"><h1>상품 등록</h1></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th style="width: 100px;">상품명</th>
						<td><input type="text" name="pname" id="pname"
							placeholder="상품명을 입력해주세요"></td>
					</tr>
					<tr>
						<th>카테고리</th>
						<td>
							<!-- 카테고리 select --> <select name="categoryMain"
							id="categoryMain">
								<option>대분류</option>
								<option value="대형가전">대형가전</option>
								<option value="계절가전">계절가전</option>
								<option value="컴퓨터">컴퓨터</option>
								<option value="카메라">카메라</option>
								<option value="휴대폰">휴대폰</option>
						</select>&nbsp; <select name="categoryMid" id="categoryMid"><option>중분류</option></select>

							<select name="categorySub" id="categorySub"><option>소분류</option></select>

						</td>
					</tr>
					<tr>
						<th rowspan="2">썸네일이미지 등록</th>
						<td style="height: 200px;"><b>(주의!!)</b><br>썸네일 이미지는
							가로크기(width) 250px x 세로크기(height) 250px 이미지로 작업하여 올려주시기 바랍니다.<br>
							크기가 맞지 않을 경우 정상적으로 출력되지 않을 수 있습니다.</td>
					</tr>
					<tr>
						<td><input type="file" name="f_name"></td>
					</tr>
					<tr>
						<th>판매가격</th>
						<td><input type="number" name="pprice" id="pprice"
							placeholder="제품의 판매가격 입력">&nbsp;원(krw)</td>
					</tr>
					<tr>
						<th>재고수량</th>
						<td><input type="number" name="pstock" id="pstock"
							placeholder="제품의 초기수량 입력">&nbsp;대(EA)</td>
					</tr>
					<tr>
						<th colspan="2">상세페이지 이미지 등록</th>
					</tr>
					<tr>
						<td colspan="2" style="height: 200px;"><b>(주의!!)</b><br>상세페이지의
							이미지는 미리 작업한 가로크기 200px로 미리 작업한 파일만 허용됩니다.<br> 크기가 맞지 않을 경우
							화면에서 정상적으로 출력되지 않을 수 있습니다.</td>
					</tr>
					<tr>
						<td colspan="2"><input class="desImg" type="file"
							name="fd_name"></td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td id="tdBottom" colspan="2"><button type="button" class="buttonBox"
								onclick="send_submit()">제품 등록</button>&nbsp;
							<button type="button" class="buttonBox"
								onclick="javascript:history.back()">취소</button></td>
					</tr>
				</tfoot>
			</table>
		</div>
	</form>

</body>
</html>