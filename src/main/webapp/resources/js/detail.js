$(function(){
	
		boardSeq = null;
		$("#categoryList").val("")
		
		let newsBoardSeq = $("#newsBoardSeq").text();
		//let visitBoardSeq = $("#visitBoardSeq").text();
		
		let newsSeq = $("#newsSeq").text();
		let newsTitle = $("#newsTitle").text();
		let newsContent = $("#newsContent").text();
		let newsOwner = $("#newsOwner").text();
		let newsDate = $("#newsDate").text();
		
		$(".boardSeq").val(newsBoardSeq);

	if(newsBoardSeq != "null"){
		seq = newsSeq;
//		alert(newsSeq)
		
		if(newsTitle != "null"){
			$("#categoryList").val("7").prop("selected", true);
			$(".body p").html("뉴스 게시판 게시글 수정");
			$("#categoryList").attr('disabled', 'true');
			$(".title").val(newsTitle);
			$(".content").val(newsContent);
			$(".owner").val(newsOwner);
			$(".date").val(newsDate);
			$(".seq").val(newsSeq);
			
			$("#add").css("display","none");	
			
		}
		else{
			$("#categoryList").val("7").prop("selected", true);
			$(".body p").html("뉴스 게시판 게시글 추가")
			$("#categoryList").attr('disabled', 'true');	
			
			$("#modify").css("display","none");

		}
	}
//	else if(visitBoardSeq != "null"){
//		boardSeq = visitBoardSeq;
//		$("#categoryList").val("5").prop("selected", true);
//		$(".body p").html("이동경로 게시판 게시글 추가")
//		$("#categoryList").attr('disabled', 'true');
//	}
	
	$("#modify").click(function(){
		
		let title = $(".title").val()
		let content = $(".content").val()
		let owner = $(".owner").val()
		let date = $(".date").val()
		
		let data = {
				"pi_title": title,
				"pi_content": content,
				"pi_owner" : owner,
				"pi_reg_date": date,
				"pi_board_seq": newsBoardSeq,
				"pi_seq": seq
			}
//			alert(JSON.stringify(data))
//			alert(newsBoardSeq)
//			alert(seq)
		$.ajax({
			url : "/updatePost/"+seq,
			type : "patch",
			contentType : "application/json",
			data : JSON.stringify(data),
			success : function (data) {
				if(data.status == 'success'){
					alert(data.message);
					history.back();
				}
				else{
					alert("수정실패");
				}
			},
			error : function(e) {
				alert("에러")
				console.log(e)
			}
		})
	})
	
	$("#add").click(function(){
	
		let data =  {
				"pi_title": $(".title").val(),
				"pi_content": $(".content").val(),
				"pi_owner" : $(".owner").val(),
				"pi_reg_date": $(".date").val(),
				"pi_board_seq": $(".boardSeq").val()
		}
//		console.log(JSON.stringify(data))
//		alert(JSON.stringify(data))
		$.ajax({
			url : "/addPost",
			type : "put",
			contentType : "application/json",
			data : JSON.stringify(data),
			success :function(data) {
				if(data.status == 'success'){
					alert(data.message);
					history.back();
				}
				else{
					alert("추가실패");
				}
			},
			error :function(){
				alert("에러")
			}
		})
	})
	
	
		
})
