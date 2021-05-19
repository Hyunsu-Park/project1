<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<title>Corona Live : DetailPage</title>
	<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
	<link rel="stylesheet" href="/resources/css/reset.css" />
	<link rel="stylesheet" href="/resources/css/detail.css" />
	<script src="/resources/js/detailPage.js"></script>

</head>
<body>
	<%@include file="/WEB-INF/views/includes/header.jsp" %>
	<%
		String boardSeq = request.getParameter("pi_board_seq");
		String seq = request.getParameter("pi_seq");
		String title = request.getParameter("pi_title"); 
 		String content = request.getParameter("pi_content"); 


		out.println( 
			"<div id='parameterData'>"+ 
				"<div id='boardSeq'>"+boardSeq+"</div>"+ 
				"<div id='seq'>"+seq+"</div>"+ 
				"<div id='title'>"+title+"</div>"+ 
				"<div id='content'>"+content+"</div>"+ 
 			"</div>"	 
		);
	%>

	<div class="body">
		<p>게시글</p>
		<div class="titleArea">
			<span>제목</span>
			<input type="text" class="title" disabled/>
		</div>
		<div class="contentArea">
			<span>내용</span>
			<textarea class="content" disabled></textarea>
		</div>
	</div>
</body>
</html>