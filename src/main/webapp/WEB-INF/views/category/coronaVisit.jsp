<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

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
	<title>Corona Live : 코로나 이동경로 게시판</title>
	<link rel="stylesheet" href="/resources/css/reset.css" />
	<link rel="stylesheet" href="/resources/css/coronaVisit.css" />
	<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="/resources/js/coronaVisit.js"></script>

</head>
<body>
	<%@include file="/WEB-INF/views/includes/header.jsp" %>
	<div class="body">
		<p>코로나 이동경로 게시판</p>	
		<div class="visitArea">
			<div>번호</div>
			<div>지역구</div>
			<div>상호타입</div>
			<div>주소</div>
			<div>방문시작날짜</div>
			<div>방문종료날짜</div>
			<div>소독여부</div>
		</div>
		<c:forEach items="${visitList}" var="post">
			<div class="visitList">
				<div class="seq">${post.seq}</div>
				<div class="area">${post.area}</div>
				<div class="type">${post.type}</div>
				<div class="address">${post.address}</div>
				<div class="first_visit_date">${post.date1}</div>
				<div class="last_visit_date">${post.date2}</div>
				<div class="disinfection">${post.disinfection}</div>
				<c:if test="${userInfo.getType() == 0}">
					<div class="buttonArea">
						<button class="modify">수정</button>
						<button class="delete">삭제</button>
					</div>
				</c:if>
			</div>
		</c:forEach>

		<c:if test="${userInfo.getType() == 0}">
			<div class="addBox">	
				<button class="add">기록추가</button>
			</div>
		</c:if>
		
		<div class="modalContent">
			<p>  </p><br/><br/>
			<span>지역명 : <input type="text" id="modifyArea"/></span><br/><br/>
			<span>상호타입 : <input type="text" id="modifyType"/></span><br/><br/>
			<span>주소: <textarea id="modifyAddress"></textarea></span><br/><br/>
			<span>방문날짜1 : <input type="date" id="modifyDate1" /></span><br/><br/>
			<span>방문날짜2 : <input type="date" id="modifyDate2" /></span><br/><br/>
			<span>소독여부(O:0/X:1) : <input type="number" id="modifyDisinfection"/></span><br/><br/>
			<button class="save">저장</button>
			<button class="cancel">취소</button>
		</div>
	</div>
</body>
</html>
