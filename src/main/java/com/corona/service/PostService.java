package com.corona.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.corona.mapper.PostMapper;
import com.corona.vo.MainNewsVO;
import com.corona.vo.PostVO;
import com.corona.vo.VisitPostVO;

@Service
public class PostService {
	@Autowired
	PostMapper mapper;
	public List<PostVO> selectNewsPostList(Integer num){
		return mapper.selectNewsPostList(num);
	}
	public void insertPost(PostVO vo) {
		mapper.insertPost(vo);
	}
	public void updatePost(PostVO vo) {
		mapper.updatePost(vo);
	}
	public void deletePost(Integer seq) {
		mapper.deletePost(seq);
	}
	
	public List<VisitPostVO> selectVisitPostList() {
		return mapper.selectVisitPostList();
	}
	public void updateVisitPost(VisitPostVO vo) {
		mapper.updateVisitPost(vo);
	}
	public void insertVisitPost(VisitPostVO vo) {
		mapper.insertVisitPost(vo);
	}
	
	public void deleteVisitPost(Integer seq) {
		mapper.deleteVisitPost(seq);
	}
	public List<MainNewsVO> selectNewsListMain(Integer num) {
		return mapper.selectNewsListMain(num);
	}
}
