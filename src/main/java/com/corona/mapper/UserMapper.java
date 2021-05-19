package com.corona.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.corona.vo.LoginVO;
import com.corona.vo.UserVO;
import com.corona.vo.SimpleUserVO;

@Mapper
public interface UserMapper {
	public Integer userLogin(LoginVO vo);
	public SimpleUserVO selectSimpleUserInfo(LoginVO vo);
	public UserVO getUserList(LoginVO vo);
	public void insertUserInfo(UserVO vo);
	public Integer selectUserCntById(String id);
}
