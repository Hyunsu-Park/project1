<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
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
	<title>Corona Live : 로그인</title>
	<link rel="stylesheet" href="/resources/css/reset.css" />
	<link rel="stylesheet" href="/resources/css/login.css" />
	<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
	<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="/resources/js/login.js"></script>
	<script type="text/javascript">
		window.history.forward();
		function window.history.forward();	// 뒤로가기 제거
	</script>
</head>

<body onload="noBack();" onpageshow="if(event.persisted) noBack();" >
	<div class="login_area">
	   <h1>Login</h1>
	   <input type="text" id="user_id" placeholder="아이디를 입력해주세요." />
	   <input type="password" id="user_pwd" placeholder="비밀번호를 입력해주세요."/>
	   <button id="login"><span>Login</span></button>
	</div>
</body>
</html>