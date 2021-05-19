package com.corona.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.corona.service.CategoryService;
import com.corona.service.DataService;
import com.corona.service.PostService;
import com.corona.vo.CategoryVO;
import com.corona.vo.DataVO;
import com.corona.vo.MainNewsVO;
import com.corona.vo.PostVO;



@Controller
public class MainController {
	@Autowired
	DataService dservice;
	@Autowired
	CategoryService cservice;
	@Autowired
	PostService pservice;
	
	@GetMapping("/")
	public String getMain(Model model) {
		Integer dailyNewPatient = dservice.getDailyNewPatientSum(1);
		model.addAttribute("dailyNewPatient",dailyNewPatient);
		Integer patient = dservice.getPatientSum();
		model.addAttribute("patient",patient);
		
		
		DataVO areaDeadList = dservice.getAreaDeadList(1);
		model.addAttribute("areaDeadList", areaDeadList);
		Integer	dailyNewDead = dservice.getDailyNewDeadSum(1);
		model.addAttribute("dailyNewDead",dailyNewDead);
		Integer	dead = dservice.getDeadSum();
		model.addAttribute("dead",dead);
		
		DataVO areaQuarantineList = dservice.getAreaQuarantineList(1);
		model.addAttribute("areaQuarantineList", areaQuarantineList);
		Integer	dailyNewQuarantine = dservice.getDailyNewQuarantineSum(1);
		model.addAttribute("dailyNewQuarantine",dailyNewQuarantine);
		Integer	quarantine = dservice.getQuarantineSum();
		model.addAttribute("quarantine",quarantine);
		
		DataVO areaSuspicionList = dservice.AreaSuspicionList(1);
		model.addAttribute("areaSuspicionList", areaSuspicionList);
		Integer	dailyNewSuspicion = dservice.getDailyNewSuspicionSum(1);
		model.addAttribute("dailyNewSuspicion",dailyNewSuspicion);
		Integer	suspicion = dservice.getSuspicionSum();
		model.addAttribute("suspicion",suspicion);
		
		List<PostVO> postNewsList = pservice.selectNewsPostList(7);
		model.addAttribute("postNewsList", postNewsList);		
		
		List<MainNewsVO> postNewsListMain = pservice.selectNewsListMain(7);
		model.addAttribute("postNewsListMain", postNewsListMain);
		
		return "/main";
	}
	@GetMapping("/postDetail")
	public String getPostDetail(Model model) {

		List<Map<String, CategoryVO>> categories = cservice.getCategoryList();

		model.addAttribute("categories",categories);
		
		return "/detail";
	}
	
	@GetMapping("/postDetailPage")
	public String getPostDetailPage(Model model) {
		
		List<Map<String, CategoryVO>> categories = cservice.getCategoryList();
		
		model.addAttribute("categories",categories);
		
		return "/detailPage";
	}
}
