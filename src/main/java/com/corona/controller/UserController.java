package com.corona.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {
	@GetMapping("/user/login") 
	public String getLogin() {
		return "/user/login";
	}
	@GetMapping("/user/logout")
	public String getLogout(HttpSession session) {
		session.setAttribute("userInfo", null) ;
		session.invalidate();
		return "redirect:/";
	}
	@GetMapping("/user/join")
	public String getUserJoin() {
		return "/user/join";
	}
}
