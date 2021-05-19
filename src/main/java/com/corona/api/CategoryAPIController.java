package com.corona.api;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.corona.service.CategoryService;
import com.corona.vo.CategoryVO;

@RestController

public class CategoryAPIController {
	@Autowired
	CategoryService cservice;
	
	@PostMapping("/api/category")
	@ResponseBody
    public Map<String, Object> getCategories() {
		Map<String, Object> resultMap = new HashMap<>();
		
		List<Map<String, CategoryVO>> categories = cservice.getCategoryList();
		
		for(int i = 0; i < categories.size() ; i++ ) {
			//System.out.println(categories.get(i));
		}
		
		
		resultMap.put("categories", categories);
	
		//System.out.println(categories);
		
		return resultMap;
    }
}
