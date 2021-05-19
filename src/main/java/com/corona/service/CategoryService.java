package com.corona.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.corona.mapper.CategoryMapper;
import com.corona.vo.CategoryVO;

@Service
public class CategoryService {
	@Autowired
	CategoryMapper mapper;
	public List<Map<String, CategoryVO>> getCategoryList(){
		return mapper.selectCategoryList();
	}
}
