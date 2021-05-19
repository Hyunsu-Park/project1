<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	response.setHeader("Cache-Control", "no-cache, no-store, must_revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires", "0");
%>
<%
	 String strReferer = request.getHeader("referer");
	 
	 if(strReferer == null){
	%>
	 <script language="javascript">
		alert("URL 주소창에 주소를 직접 입력해서 접근하셨습니다.\n\n정상적인 경로를 통해 다시 접근해 주십시오.");
		document.location.href="../";
	 </script>
	<%
	  return;
	 }
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Corona Live : 회원가입</title>
	<link rel="stylesheet" href="/resources/css/reset.css" />
	<link rel="stylesheet" href="/resources/css/join.css" />
	<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
	<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="/resources/js/join.js"></script>
</head>
<body>
	<div class="join_form_wrap">
   		<div class="form_header">
   			<h1>회원가입</h1>
   			<p><span class="necessary">*</span>필수이력사항</p>
   		</div>
   		<table>
   			<tbody>
   				<tr>
   					<td>아이디<span class="necessary">*</span></td>
   					<td><input type="text" id="user_id" placeholder="6자 이상의 영문 혹은 영문과 숫자를 조합"/></td>
   					<td><button id="dup_check">중복확인</button></td>
   				</tr>
   				<tr>
   					<td>비밀번호<span class="necessary">*</span></td>
   					<td><input type="password" id="user_pwd" placeholder="비밀번호를 입력해주세요"/></td>
   				</tr>
   				<tr>
   					<td>비밀번호 확인<span class="necessary">*</span></td>
   					<td><input type="password" id="user_pwd_confirm" placeholder="비밀번호를 한번더 입력해주세요"/></td>
   				</tr>
   				<tr>
   					<td>이름<span class="necessary">*</span></td>
   					<td><input type="text" id="user_name" placeholder="이름을 입력해주세요"/></td>
   				</tr>
   				<tr>
   					<td>나이<span class="necessary">*</span></td>
   					<td><input type="text" id="user_age" placeholder="나이를 입력해주세요"/></td>
   				</tr>
   				<tr>
   					<td>성별<span class="necessary">*</span></td>
   					<td>
   						<input type="radio" name="user_gender" id="gender_male" class="user_gender" value="0"/>
		                <label for="gender_male" id="gender_male_text">남자</label>
   						
   						<input type="radio" name="user_gender" id="gender_female" class="user_gender" value="1"/>
   						<label for="gender_female" id="gender_female_icon">여자</label>
   					</td>
   				</tr>
   				<tr>
   					<td>주소<span class="necessary">*</span></td>
   					<td><input type="text" id="user_address" placeholder="주소를 입력해주세요"/></td>
   				</tr>
   				<tr>
   					<td>핸드폰번호</td>
   					<td><input type="text" id="user_phone_number" placeholder="핸드폰번호를 입력해주세요"/></td>
   				</tr>
   			</tbody>
   		</table>
   		<div class="btn_area">
   			<button id="join_btn">가입하기</button>
   		</div>
   	</div>
   	
</body>
</html>