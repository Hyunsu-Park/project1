<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Corona Live : Hearder</title>
	<link rel="stylesheet" href="/resources/css/reset.css" />
	<link rel="stylesheet" href="/resources/css/header.css">
	<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
	<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script type="text/javascript"> 

		$.ajax({	 
             url: "/api/category",
             type: "post", 
             success: function(result){
             	//console.log(result);
             	fn_headDisplay(result);
             },
             error: function (error) {
             	console.log(error)
             }
         });	
 		function fn_headDisplay(data) {
 				var categories = data.categories;
 				var userInfo = data.userInfo;
 				
 				for(var i = 0; i < categories.length; i++){
 					if(categories[i].clc_parent_seq == 0) {
 						$(".parent_area").append('<a href="'+categories[i].clc_url+'" class="parent'+categories[i].clc_seq+'">'+categories[i].clc_name+'</a>');
 					}
 					if(categories[i].clc_parent_seq != 0) {
 						$(".child_area").append('<a href="'+categories[i].clc_url+'" class="child'+categories[i].clc_parent_seq+'">'+categories[i].clc_name+'</a>');
 					}
 				}
 				
 				$(".child1").hide();
 				$(".child4").hide();
 				$(".child7").hide();
 				$(".child9").hide();
		
 			    $(".parent1, .child1").mouseover(function(){
 			      $(".child1").show()
 			    }).mouseout(function(){
 			      $(".child1").hide();
 			    });
 			    $(".parent4, .child4").mouseover(function(){
 			      $(".child4").show()
 			    }).mouseout(function(){
 			      $(".child4").hide();
 			    });
 			    $(".parent7, .child7").mouseover(function(){
 			      $(".child7").show()
 			    }).mouseout(function(){
 			      $(".child7").hide();
 			    });
 			    $(".parent9, .child9").mouseover(function(){
 			      $(".child9").show()
 			    }).mouseout(function(){
 			      $(".child9").hide();
 			    });
 		}
 		
	
 	</script>
</head>
<body>
	 <header>
	 	<div class="header_box">

			<c:if test="${userInfo == null }">
		       	<nav class="nav_area">
		       		<div class="nav_area_content">
			       		<div class="parent_area1">
			       			<div>코로나 바로 알기</div>
			       			<div>코로나 동향</div>
			       			<div>코로나 뉴스</div>
			       			<div>코로나 공지</div>
			       			<div>코로나 FAQ</div>
			       		</div>
					</div>
					<div class="child_area" >
					</div>
					<div class="user_info">
						<p>
							<a href="/">로그인 해주세요</a>
						</p>
				    </div>
		        </nav>
			</c:if>
			<c:if test="${userInfo != null }">
				
		        <nav class="nav_area">
		       		<div class="nav_area_content">
			       		<div class="parent_area">
				       	
				       	</div>
						<div class="search_area"> 
							<input type="text" id="search_input" placeholder="검색어를 입력하세요"/>
							<button id="search_btn"><i class="fas fa-search"></i></button>
						</div>
					</div>
					<div class="child_area">
					
					</div>
			        <div class="user_info">
				        <p>
							<c:if test="${userInfo.getType() == 0}">
								${userInfo.getId()}관리자님 반갑습니다
							</c:if>
							<c:if test="${userInfo.getType() != 0}">
								${userInfo.getId()}님 반갑습니다
							</c:if>
							<a href="/user/logout">로그아웃</a>
							<a href="/">메인으로</a>
				        </p>
					</div>
		        </nav>
	        </c:if>
	   	</div>
    </header>
</body>
</html>