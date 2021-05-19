package com.corona.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.corona.vo.CategoryVO;


@Mapper
public interface CategoryMapper {
	public List<Map<String, CategoryVO>> selectCategoryList();
	public Integer getCategorySeq();
}
