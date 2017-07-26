package com.nezha.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nezha.entity.User;
import com.nezha.mapper.UserMapper;
import com.nezha.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	
	@Override
	public User selectById(int id) {
		return userMapper.selectById(id);
	}
	
}
