package com.korea.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.korea.mapper.UserMapper;
import vo.UserVO;

@Service
public class UserServicelmpl implements UserService{

	@Autowired
	UserMapper usermapper;

	@Override
	public void userJoin(UserVO user) throws Exception {
		// TODO Auto-generated method stub
			usermapper.userJoin(user);
	}
	
	
	
}