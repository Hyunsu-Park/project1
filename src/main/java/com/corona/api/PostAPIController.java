package com.corona.api;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.corona.service.PostService;
import com.corona.vo.PostVO;
import com.corona.vo.VisitPostVO;

@RestController
public class PostAPIController {
	@Autowired
	PostService service;
	@PutMapping("/addPost")
	public Map<String, String> addPost(@RequestBody PostVO vo) {
		Map<String, String> resultMap = new HashMap<String, String>();
		
		service.insertPost(vo);
		
		resultMap.put("status", "success");
		resultMap.put("message", "게시글이 추가되었습니다.");
		
		return resultMap;
	}	
	@PatchMapping("/updatePost/{seq}")
	public Map<String, String> updatePost(@PathVariable Integer seq, @RequestBody PostVO vo){
		Map<String, String> resultMap = new HashMap<>();
		
		vo.setPi_seq(seq);;
		service.updatePost(vo);
		
		resultMap.put("status","success");
		resultMap.put("message","수정되었습니다.");
		
		return resultMap;
				
	}
	@DeleteMapping("/deletePost")
	public Map<String, String> deletePost(@RequestParam Integer seq){
		Map<String, String> resultMap = new HashMap<>();
		
		service.deletePost(seq);
		resultMap.put("status", "success");
		resultMap.put("message", "삭제되었습니다.");
		
		return resultMap;
	}
	
	
	@PutMapping("/insertVisitPost")
	public Map<String, String> insertVisitPost(@RequestBody VisitPostVO vo) {
		Map<String, String> resultMap = new HashMap<>();
		
		service.insertVisitPost(vo);
		
		resultMap.put("status", "success");
		resultMap.put("message", "추가되었습니다.");
		
		return resultMap;
	}
	@PatchMapping("/updateVisit/{seq}")
	public Map<String, String> updateVisit(@PathVariable Integer seq, @RequestBody VisitPostVO vo){
		
		Map<String, String> resultMap = new HashMap<>();
		
		vo.setSeq(seq);
		service.updateVisitPost(vo);
		
		resultMap.put("status", "success");
		resultMap.put("message", "수정되었습니다.");	
		
		return resultMap;
	}
	@DeleteMapping("/deleteVisitPost")
	public Map<String, String> deleteVisitPost(@RequestParam Integer seq) {
		Map<String, String> resultMap = new HashMap<>();
		
		service.deleteVisitPost(seq);
		
		resultMap.put("status", "success");		
		resultMap.put("message", "삭제완료 하였습니다");		
		
		return resultMap;
	}


}





