$(function(){
	let id_check =false;

	$("#dup_check").click(function(){
		if($("#user_id").val() == null || $("#user_id").val() == "" ){
			alert("아이디를 입력해 주세요");
			return;
		}
		$.ajax({
			url:"/user/id_check?id="+$("#user_id").val(),
			type:"get",
			success:function(result){
				if(result.status == "OK") {
					id_check = true;
				}
				alert(result.message);
			}
		});
	});
	$("#dup_check").change(function(){	
		id_check =false;
	});
	$("#join_btn").click(function(){
		let id = $("#user_id").val();
		
		if(id.length < 4){
			alert("아이디를 4글자 이상 입력하세요.");
			return
		}
		if(!id_check) {
			alert("아이디 중복체크를 눌러주세요.");
			return;
		}
		let pwd = $("#user_pwd").val()
		if(pwd.length < 4){
			alert("비밀번호를 4글자 이상 입력하세요.");
			return;
		}
		else if(pwd != $("#user_pwd_confirm").val()){
			alert("비밀번호와 비밀번호 확인이 다릅니다.");
			return;
		}
		let name = $("#user_name").val();
		if(name == "" || name == null){
			alert("이름에 공백을 사용하실 수 없습니다.")
			return;
		}
		let data = {
			"ui_id":$("#user_id").val(),
			"ui_pwd":$("#user_pwd").val(),
			"ui_name":$("#user_name").val(),
			"ui_age":$("#user_age").val(),
			"ui_gender":$(".user_gender:checked").val(),
			"ui_address":$("#user_address").val(),
			"ui_phone_number":$("#user_phone_number").val(),
		}
		//console.log(JSON.stringify(data));
		$.ajax({
			url:"/user/join",
			type:"post",
			contentType:"application/json",
			data:JSON.stringify(data),
			success:function(result){
				alert(result.message);
				location.href="/";
			},
			error:function(){
				alert("에러")
			}
		})
	})
	$("#user_address").keydown(function(e){
		if(e.keyCode == 13){
			$("#join_btn").trigger("click");
		}
	}) 
	$("#user_phone_number").keydown(function(e){
		if(e.keyCode == 13){
			$("#join_btn").trigger("click");
		}
	}) 
})



