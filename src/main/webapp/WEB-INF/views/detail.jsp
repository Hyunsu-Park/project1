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
	<title>Corona Live : Detail</title>
	<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
	<link rel="stylesheet" href="/resources/css/reset.css" />
	<link rel="stylesheet" href="/resources/css/detail.css" />
	<script src="/resources/js/detail.js"></script>

</head>
<body>
	<%@include file="/WEB-INF/views/includes/header.jsp" %>
	<%
		String newsBoardSeq = request.getParameter("newsBoardSeq");
		String visitBoardSeq = request.getParameter("visitBoardSeq"); 

 		String newsSeq = request.getParameter("newsSeq");
 		String newsTitle = request.getParameter("newsTitle"); 
 		String newsContent = request.getParameter("newsContent"); 
		String newsOwner = request.getParameter("newsOwner"); 
		String newsDate = request.getParameter("newsDate"); 

		out.println( 
			"<div id='parameterData'>"+ 
				"<div id='newsBoardSeq'>"+newsBoardSeq+"</div>"+ 
				"<div id='visitBoardSeq'>"+visitBoardSeq+"</div>"+ 
				"<div id='newsSeq'>"+newsSeq+"</div>"+ 
				"<div id='newsTitle'>"+newsTitle+"</div>"+ 
				"<div id='newsContent'>"+newsContent+"</div>"+ 
				"<div id='newsOwner'>"+newsOwner+"</div>"+ 
				"<div id='newsDate'>"+newsDate+"</div>"+ 
 			"</div>"	 
		);
	%>

	<div class="body">
		<p>게시글 추가</p>
		<div class="titleArea">
			<span>제목</span>
			<input type="text" class="title"/>
			<select id="categoryList">
				<c:forEach items="${categories}" var="item">
                	<option value="${item.clc_seq}">${item.clc_name}</option>
				</c:forEach>
<!--                 	<option value="13" selected>공지</option> -->
            </select>
		</div>
		<div class="contentArea">
			<span>내용</span>
			<textarea class="content"></textarea>
			<button id="add">추가</button>
			<button id="modify">수정</button>
		</div>
		<div class="otherArea">
			<span>작성자</span>
			<input type="text" class="owner" />
			<span>작성일</span>
			<input type="date" class="date" />
			<span>게시판번호</span>
			<input type="text" class="boardSeq" disabled/>
<!-- 			<span>번호</span> -->
<!-- 			<input type="text" class="seq" disabled/> -->
		</div>
	</div>
	
</body>
</html>