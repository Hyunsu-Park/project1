package com.corona.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.corona.vo.MainNewsVO;
import com.corona.vo.PostVO;
import com.corona.vo.VisitPostVO;

@Mapper
public interface PostMapper {
	public List<PostVO> selectNewsPostList(Integer num);
	public void insertPost(PostVO vo);
	public void updatePost(PostVO vo);
	public void deletePost(Integer seq);
	
	public List<VisitPostVO> selectVisitPostList();
	public void updateVisitPost(VisitPostVO vo);
	public void insertVisitPost(VisitPostVO vo);
	public void deleteVisitPost(Integer seq);
	
	public List<MainNewsVO> selectNewsListMain(Integer num);
}
