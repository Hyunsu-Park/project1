$(function(){
//	alert($('#seq').html())
//	alert($('#title').html())
//	alert($('#content').html())
	let boardSeq = $('#boardSeq').html();
	if(boardSeq == 7){
		$(".body p").html("뉴스게시글")		
	}
	
	//alert($('#seq').html())
	$(".title").val($('#title').html())
	$(".content").val($('#content').html())
})