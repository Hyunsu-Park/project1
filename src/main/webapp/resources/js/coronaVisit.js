$(function(){
	$(".modify").click(function(){
		$(".modalContent").addClass('open')
		$(".modalContent p").html('방문자 정보 수정')
		
		let seq = $(this).parent().parent().find($('.seq')).html();
		let originArea = $(this).parent().parent().find($('.area')).html();
		let originType = $(this).parent().parent().find($('.type')).html();
		let originAddress = $(this).parent().parent().find($('.address')).html();
		let originDate1 = $(this).parent().parent().find($('.first_visit_date')).html();
		let originDate2 = $(this).parent().parent().find($('.last_visit_date')).html();
		let originDisinfection = $(this).parent().parent().find($('.disinfection')).html();
		
		//alert(seq)
		
		$("#modifyArea").val(originArea)
		$("#modifyType").val(originType)
		$("#modifyAddress").val(originAddress)
		$("#modifyDate1").val(originDate1)
		$("#modifyDate2").val(originDate2)
		$("#modifyDisinfection").val(originDisinfection)
		
		$(".cancel").click(function(){
			location.reload();
		})
		
		$(".save").click(function(){
			
			let area =  $("#modifyArea").val()
			let type =  $("#modifyType").val()
			let address = $("#modifyAddress").val()
			let date1 = $("#modifyDate1").val()
			let date2 = $("#modifyDate2").val()
			let disinfection = $("#modifyDisinfection").val()
			
			let data = {
				"area" : area,
				"type" : type,
				"address" : address,
				"date1" : date1,
				"date2" : date2,
				"disinfection" : disinfection
			}
			
			$.ajax({
				url : "/updateVisit/"+seq,
				type : "patch",
				contentType : "application/json",
				data : JSON.stringify(data),
				success : function (data) {
					if(data.status == 'success'){
						alert(data.message);
						location.reload();
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
	})
	$(".add").click(function(){
		$(".modalContent").addClass('open')
		$(".modalContent p").html('방문자 정보 추가')
		
		$(".cancel").click(function(){
			location.reload();
		})
		
		$(".save").click(function(){
			
			let area =  $("#modifyArea").val()
			let type =  $("#modifyType").val()
			let address = $("#modifyAddress").val()
			let date1 = $("#modifyDate1").val()
			let date2 = $("#modifyDate2").val()
			let disinfection = $("#modifyDisinfection").val()
			
			let data = {
				"area" : area,
				"type" : type,
				"address" : address,
				"date1" : date1,
				"date2" : date2,
				"disinfection" : disinfection
			}
			
			$.ajax({
				url : "/insertVisitPost",
				type : "put",
				contentType : "application/json",
				data : JSON.stringify(data),
				success : function(data){
					if(data.status =='success'){
						alert(data.message);
						location.reload();
					}
					else{
						alert("추가실패");
					}
				},
				error : function(e) {
					alert("에러");
					console.log(e);
				}
			})
		})
	})
	
	$(".delete").click(function(){
		let seq = $(this).parent().parent().find($('.seq')).html();
		//alert(seq)
		if(!confirm(seq+"번 게시글을 정말 삭제 하시겠습니까?")) return;
		
		$.ajax({
			url : "/deleteVisitPost?seq="+seq,
			type : "delete",
			success : function(data) {
				if(data.status =='success'){
					alert(data.message)
					location.reload();
				}
				else{
					alert("삭제실패");
				}
			},
			error :function(e){
				alert("에러");
				console.log(e);
			}
		})
	})
})