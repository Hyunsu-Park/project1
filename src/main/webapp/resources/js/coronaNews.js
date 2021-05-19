
$(function(){
	$(".delete").click(function(){
		let seq = $(this).parent().parent().find($('.seq')).html()
		//alert(seq)
		if(!confirm( seq + "게시글을 정말로 삭제 하시겠습니까?")) return;
		
		$.ajax({
			url : "/deletePost?seq="+seq,
			type : "delete",
			success : function(data){
				if(data.status == 'success'){
					alert(data.message);
					location.reload();
				}
				else{
					alert("삭제실패");
				}
			},
			error :function(){
				alert("에러");
			}
		})

	})
})