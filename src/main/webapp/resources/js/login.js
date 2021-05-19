$(function(){
	$("#login").click(function(){
		let data = {
			id:$("#user_id").val(),
			pwd:$("#user_pwd").val()			
		}
		$.ajax ({
			url:"/user/login",
			type:"post",
			contentType:"application/json",
			data:JSON.stringify(data),
			success:function(result){
				location.href="/";
			},
			error:function() {
				alert("에러")
			}
		})
	})
	$("#user_pwd").keydown(function(e){
		if(e.keyCode == 13){
			$("#login").trigger("click");
		}
	}) //패스워드 작성후 엔터(키코드13번)치면 클릭이 되게 함
})
	