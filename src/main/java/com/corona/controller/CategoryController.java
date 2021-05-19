package com.corona.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.corona.service.PostService;

import com.corona.vo.PostVO;
import com.corona.vo.VisitPostVO;

@Controller
public class CategoryController {
	@Autowired
	PostService pservice;
	
	@GetMapping("/category/corona_know")
	public String getCoronaKnow() {
		return "/category/coronaKnow";
	}
	@GetMapping("/category/corona_trends")
	public String getCoronaTrends() {
		return "/category/coronaTrends";
	}
	
	@GetMapping("/category/corona_news")
	public String getCoronaNews(Model model) {
		List<PostVO> newsList = pservice.selectNewsPostList(7);

		model.addAttribute("newsList", newsList);
		
		return "/category/coronaNews";
	}
	
	@GetMapping("/category/corona_notice")
	public String getCoronaNotice() {
		return "/category/coronaNotice";
	}
	@GetMapping("/category/corona_distance")
	public String getCoronaDistance() {
		return "/category/coronaDistance";
	}
	@GetMapping("/category/corona_guid")
	public String getCoronaGuid() {
		return "/category/coronaGuid";
	}
	
	@GetMapping("/category/corona_visit")
	public String getCoronaVisit(Model model) {

		List<VisitPostVO> visitList = pservice.selectVisitPostList();
		
		model.addAttribute("visitList", visitList);
		
		return "/category/coronaVisit";
	}
	
	@GetMapping("/category/corona_occu_trend")
	public String getCoronaOccuTrend() {
		return "/category/coronaOccuTrend";
	}
	@GetMapping("/category/corona_press_release")
	public String getCoronaPressRelease() {
		return "/category/coronaPressRelease";
	}
	@GetMapping("/category/corona_public_notice")
	public String getCoronaPublicNotice() {
		return "/category/coronaPublicNotice";
	}
	@GetMapping("/category/corona_isolation_notice")
	public String getCoronaIsolationNotice() {
		return "/category/coronaIsolationNotice";
	}
	@GetMapping("/category/corona_entrant_notice")
	public String getCoronaEntrantNotice() {
		return "/category/coronaEntrantNotice";
	}
	@GetMapping("/category/corona_FAQ")
	public String getCoronaFAQ() {
		return "/category/coronaFAQ";
	}
}
