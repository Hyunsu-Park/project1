package com.corona.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.corona.mapper.UserMapper;
import com.corona.utils.AESAlgorithm;
import com.corona.vo.LoginVO;
import com.corona.vo.UserVO;
import com.corona.vo.SimpleUserVO;

@Service
public class UserService {
	@Autowired
	UserMapper mapper;
	public boolean userLogin(LoginVO vo) {
		return mapper.userLogin(vo) == 1 ;	// 1일때 트루반환
	}
	public SimpleUserVO selectSimpleUserInfo(LoginVO vo) {
		return mapper.selectSimpleUserInfo(vo);
	}
	public UserVO getUserList(LoginVO vo){
		return mapper.getUserList(vo);
	}
	public void insertUserInfo(UserVO vo) {
		String password = vo.getUi_pwd();
		try {
			password = AESAlgorithm.Encrypt(password);			
		}
		catch(Exception e) {e.printStackTrace();}
		vo.setUi_pwd(password);
		mapper.insertUserInfo(vo);
	}
	public boolean userIdCheck(String id) {
		return !(mapper.selectUserCntById(id) > 0);
	}
}
