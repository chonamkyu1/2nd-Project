<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
<%@include file="headWrap.jsp" %>
<body>
     <div id="container">
      <div id="content">
        <div class="locationArea">
          <h1>마이페이지</h1>
          <hr />
        </div>
        <div id="bitContentArea">
          <div class="leftArea">
            <div class="leftMenu">
              <ul class="leftMenuBar">
                <button class="leftMenuBtn" onclick="location.href='memberInformation.jsp'">
                  회원정보
                </button><br>
                <button class="leftMenuBtn" onclick="location.href='memberModify.jsp'">
                  정보수정
                </button>
                <button class="leftMenuBtn">
                  주문내역조회
                </button>
                <button class="leftMenuBtn">
                  쿠폰조회
                </button>
                <button class="leftMenuBtn" onclick="location.href='pointInformation.jsp'">
                  포인트정보
                </button>
                <button class="leftMenuBtn" onclick="location.href='withdrawal.jsp'">
                  회원탈퇴
                </button>
              </ul>
            </div>
          </div>    
		</div>
		</div>
		</div>
		
		<div id="content">
			
				<!--  아이디, 비밀번호, 이름 , 휴대전화, 이메일, 생년월일, 회원포인트, 누적금액, 가입일, 회원구분  -->
					<div>
						<table id="prodItems" style="position: relative; top : -90px; left:180px; width:500px;">
						<tr>
						<th colspan="2"><h2>회원 정보 수정</h2></th>
						</tr>
						<tr>
						<td>ID</td><td><input type="text" id="mid" name="mid" value="${vo.mid }" readonly="readonly"> </td>
						</tr>
						<tr>
						<td>비밀번호</td> <td><input type="password" id="mpw" name="mpw" value="${vo.mpw }" readonly="readonly"></td>
						</tr>
						<tr>
						<td>이름</td> <td><input type="text" id="mname" name="mname" value="${vo.mname }" readonly="readonly"></td>
						</tr>
						<tr>
						<td>휴대전화</td><td> <input type="text" id="mphone" name="mphone" value="${vo.mphone }" readonly="readonly"></td>
						</tr>
						<tr>
						<td>이메일</td><td> <input type="text" id="memail" name="memail" value="${vo.memail }" readonly="readonly"></td>
						</tr>
						<tr>
						<td>주소</td> <td><input type="text" id="maddress" name="maddress" value="${vo.maddress }" readonly="readonly"></td>
						</tr>
						<tr>
						<td>생년월일</td> <td><input type="text" id="mjumin" name="mjumin" value="${vo.mjumin }" readonly="readonly"></td>
						</tr>
						<tr>
						<td>회원포인트</td><td> <input type="text" id="mpoint" name="mpoint" value="${vo.mpoint }" readonly="readonly"></td>
						</tr>
						<tr>
						<td>회원구분</td><td> <input type="text" id="mclass" name="mclass" value="${vo.mclass }" readonly="readonly"></td>
						</tr>
						<tr>
						<td>누적금액</td> <td><input type="text" id="mcumulative_buy" name="mcumulative_buy" value= "${vo.mcumulative_buy }" readonly="readonly" ></td>
						</tr>
						<tr>
						<td>가입일</td> <td><input type="text" id="mjoindate" name="mjoindate" value="${vo.mjoindate }" readonly="readonly"></td>
						</tr>
						<tr>
						<td colspan="2"><input type="button" value="수정하기" class="utilMenuOne" onclick="location.href='memberModify.jsp';">
						</td>
						</tr>
						<tr>
						
						<td colspan="2"><input type="button" value="취소" class="utilMenuOne" onclick="history.go(-1)">
						</td>
						</tr>
						</table>
					</div>
					</div>
	   

<%@include file="footer.jsp" %>
</body>
</html>