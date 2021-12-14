<%@page import="oracle.jdbc.internal.OracleConnection.XSSessionSetOperationCode"%>
<%@page import="com.bc.model.vo.LogInVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보수정</title>
    <link rel="stylesheet" href="./styles.css" />
<%
	//LogInVO lvo =  (LogInVO)request.getAttribute("vo");
	LogInVO vo = (LogInVO)session.getAttribute("vo");
	session.setAttribute("vo", vo);
		
	System.out.println("vo: "+  vo);
%>
<script>
	var RegExp = /^[a-zA-Z0-9]{4,12}$/; // 아이디 유효성 검사 (비밀번호도)
	var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/; // 이메일 유효성 검사
	var nameExp = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/; // 이름 유효성 검사
	
	function modify_btn(){
		var form = document.modifyMmeberForm
		if (form.mpw.value.trim() == "") {
			alert("비밀번호를 입력해주세요.");
			return;
		}
		if (form.mpw_check.value.trim() == "") {
			alert("비밀번호를 한번 더 입력해주세요.");
			return;
		}
		if (form.mpw.value != form.mpw_check.value) {
			alert("비밀번호를 잘못입력하셨습니다. 다시 입력해주세요.")
			return;
		}
		if (form.mphone.value.trim() == "") { //전화번호이메일주소
			alert("전화번호를 입력해주세요.");
			return;
		}
		
		if (form.memail.value.trim() == "") {
			alert("이메일을 입력해주세요");
			return;
		} if(form.maddress.value.trim() == "") {
			alert("주소를 입력해주세요");
			return;
		}
		
		form.submit();
		
	}
	
	function inputPhoneNumber(obj) {
		 var number = obj.value.replace(/[^0-9]/g, "");
		 var phone = "";
		 
		 if(number.length < 4) {
		        return number;
		    } else if(number.length < 7) {
		        phone += number.substr(0, 3);
		        phone += "-";
		        phone += number.substr(3);
		    } else if(number.length < 11) {
		        phone += number.substr(0, 3);
		        phone += "-";
		        phone += number.substr(3, 3);
		        phone += "-";
		        phone += number.substr(6);
		    } else {
		        phone += number.substr(0, 3);
		        phone += "-";
		        phone += number.substr(3, 4);
		        phone += "-";
		        phone += number.substr(7);
		    }
		    obj.value = phone;
		}
	 
	
</script>
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
                <li><button class="leftMenuBtn" onclick="location.href='memberInformation.jsp'">회원정보</button></li>
                <li><button class="leftMenuBtn" onclick="location.href='memberModify.jsp'">정보수정</button></li>
                <li><button class="leftMenuBtn">주문내역조회</button></li>
                <li><button class="leftMenuBtn">쿠폰조회</button></li>
                <li><button class="leftMenuBtn" onclick="location.href='pointInformation.jsp'">포인트정보</button></li>
                <li><button class="leftMenuBtn" onclick="location.href='withdrawal.jsp'">회원탈퇴</button></li>
              </ul>
            </div>
          </div>    
	
	<div id="mainArea">
		<div class="mainContent">
	   		
	   		
					  
		    <form action="modifyMmeber" method="post" id="modifyMmeberForm" name="modifyMmeberForm">
		      <table id="prodItems"  style="position: relative; top : 10px; left:50px; width:500px;">
		        <tr>
		        <td colspan="2"><h2>회원정보수정</h2></td>
		        </tr>
		        
		        <tr>
		          <td><label>이름<span style="color: red">*</span></label></td>
		          <td><input  type="text" name="mname" id="mname"  class="formControl"  required="required" value=${vo.mname } readonly="readonly" ></td>
		        </tr>
		        <tr>
			     <td>
			          <label>생년월일<span style="color: red">*</span></label>
			     </td>
			     <td> 
		          <input  type="text" name="mjumin" id="mjumin" class="formControl"  required="required" value=${vo.mjumin } readonly="readonly"  >
		        </td>
		        </tr>
		        <tr>
		        <td>
		          <label>아이디<span style="color: red">*</span></label></td>
		        <td>
		          <input type="text" name="mid" id="mid" class="formControl"  required="required" value="${vo.mid }" readonly="readonly"  >
		        </td>
		        </tr>
		        <tr>
		        <td>
		          <label>신규비밀번호<span style="color: red">*</span></label>
		        </td>
		        <td>
		        <input type="password" name="mpw" id="mpw" class="formControl" required="required"  maxlength="12">
		        </td>
		         </tr>
		         <tr>
		         <td>
		          <label>신규비밀번호확인<span style="color: red">*</span></label></td>
		          <td><input  type="password" name="mpw_check" id="mpw_check" class="formControl" required="required" onclick="confirm_pw()"  maxlength="12"></td>
		        </tr>
		        <tr>
		        <td>
		          <label>전화번호<span style="color: red">*</span></label></td>
		          <td><input type="text" name="mphone" id="mphone" class="formControl" required="required" placeholder="000-0000-0000"  maxlength="13" onkeyup="inputPhoneNumber(this);">
		        </td>
		        </tr>
		        <tr>
				<td>	
		          <label>이메일<span style="color: red">*</span></label></td>
		          <td><input type="text" name="memail" id="memail" class="formControl" required="required"></td>
		        </tr>
		        <tr>
		        <td>
		          <label>주소<span style="color: red">*</span></label></td>
		          <td><input type="text" name="maddress" id="maddress" class="formControl" required="required">
		          </td>
		        </tr>
		        <tr>
		        <td colspan="2">
		          <input type="button" value="정보수정" onclick="modify_btn()">
		        <input type="button" value="취소" onclick="history.go(-1)">
		        </td>
				</tr>
			    </table>
			    <input type="hidden" name="mpoint" id="mpoint" value="0">
		        <input type="hidden" name="mcumulative_buy" id="mcumulative_buy" value="0">
		        <input type="hidden" name="mjoindate" id="mjoindate"value="SYSDATE"> 
		        <input type="hidden" name="mclass" id="mclass" value="0">
			    </form>
			  </div>
		   </div>
		   </div>
		   </div>
		   </div>
		   
		   
		   <%@include file="footer.jsp" %>
		</body>
	</body>
</html>