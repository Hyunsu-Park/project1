package com.corona.api;

import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.corona.service.UserService;
import com.corona.utils.AESAlgorithm;
import com.corona.vo.LoginVO;
import com.corona.vo.UserVO;
import com.corona.vo.SimpleUserVO;

@RestController
public class UserAPIController {
	@Autowired
	UserService service;
	
	@PostMapping("/user/login")
	public Map<String, String> postLogin(@RequestBody LoginVO vo, HttpServletResponse response, HttpSession session){
		Map<String, String> resultMap = new LinkedHashMap<String, String>();
		if(vo.getId() == null || vo.getPwd() == null ) {
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			resultMap.put("message", "id 또는 pwd 를 입력하세요.");
			return resultMap;
		}
		String pwd = vo.getPwd();
		try {
			pwd = AESAlgorithm.Encrypt(pwd);			
		}
		catch(Exception e) { e.printStackTrace();}
		vo.setPwd(pwd);
		
		if(service.userLogin(vo)) {
			response.setStatus(HttpServletResponse.SC_ACCEPTED);
			resultMap.put("message", "로그인 되었습니다.");
			
			SimpleUserVO userInfo = service.selectSimpleUserInfo(vo);
			session.setAttribute("userInfo", userInfo);
		}
		else {
			response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
			resultMap.put("message", "로그인 실패");
			
		}
		return resultMap;
	}
	@PostMapping("/user/join")
	public Map<String, String> postUserJoin(@RequestBody UserVO vo) {
		Map<String, String> resultMap = new LinkedHashMap<String, String>();
		
		service.insertUserInfo(vo);
		
		resultMap.put("status","success");
		resultMap.put("message","가입되었습니다.");
		
		return resultMap;
	}
	
	@GetMapping("/user/id_check")
	public Map<String,String>getMemberIdCheck(@RequestParam String id){
		Map<String, String> resultMap = new LinkedHashMap<String, String>();
		
		if(service.userIdCheck(id)) {
			resultMap.put("status", "OK");
			resultMap.put("message", "가입 가능한 아이디입니다.");
		}
		else {
			resultMap.put("status", "failed");
			resultMap.put("message", "이미 가입한 아이디입니다.");
		}
		
		return resultMap;
	}

}
