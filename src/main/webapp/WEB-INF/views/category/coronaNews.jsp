<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
	<title>Corona Live : 코로나 뉴스 게시판</title>
	<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
	<link rel="stylesheet" href="/resources/css/reset.css" />
	<link rel="stylesheet" href="/resources/css/coronaNews.css" />
	<script src="/resources/js/coronaNews.js"></script>

</head>
<body>
	<%@include file="/WEB-INF/views/includes/header.jsp" %>
	<div class="body">
		<p>코로나 뉴스 게시판</p>	
	
		<div class="newsArea">
			<div>번호</div>
			<div>제목</div>
			<div>내용</div>
			<div>담당자</div>
			<div>작성일</div>
		</div>
		<c:forEach items="${newsList}" var="post">
			<div class="newsList">
				<div class="seq">${post.pi_seq}</div>
				<div class="title"> <a href="/postDetailPage?pi_seq=${post.pi_seq}&pi_board_seq=${post.pi_board_seq}&pi_title=${post.pi_title}&pi_content=${post.pi_content}">${post.pi_title}</a></div>
				<div class="content"><a href="/postDetailPage?pi_seq=${post.pi_seq}&pi_board_seq=${post.pi_board_seq}&pi_title=${post.pi_title}&pi_content=${post.pi_content}">${post.pi_content}</a></div>
				<div class="owner">${post.pi_owner}</div>
				<div class="date">${post.pi_reg_date}</div>
				<c:if test="${userInfo.getType() == 0}">
					<div class="buttonArea">
						<form action="/postDetail" class="modifyNews" method="get">
							<input type="number"  name="newsBoardSeq" value="${post.pi_board_seq}" />
							<input type="number"  name="newsSeq" value="${post.pi_seq}" />
							<input type="text"  name="newsTitle" value="${post.pi_title}" />
							<input type="text"  name="newsContent" value="${post.pi_content}" />
							<input type="text"  name="newsOwner" value="${post.pi_owner}" />
							<input type="text"  name="newsDate" value="${post.pi_reg_date}" />
							<input type="submit" class="modify" value="수정"/>
						</form>						
						<button class="delete">삭제</button>
					</div>
				</c:if>
				
			</div>
		</c:forEach>
		<c:if test="${userInfo.getType() == 0}">
			<div class="addBox">	
				<form action="/postDetail" method="get">
					<input type="text" id="newsBoardSeq" name="newsBoardSeq" value="${newsList.get(0).pi_board_seq}" />
					<input type="submit" id="newsAdd" value="뉴스추가"/>
				</form>
			</div>
		</c:if>
	</div>

</body>
</html>