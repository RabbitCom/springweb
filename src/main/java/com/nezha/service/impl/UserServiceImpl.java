package com.nezha.service.impl;

import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.nezha.entity.User;
import com.nezha.mapper.UserMapper;
import com.nezha.service.UserService;

@Service
public class UserServiceImpl extends  ServiceImpl<UserMapper, User> implements UserService {

	@Override
	public boolean insert(User entity) {
		return super.insert(entity);
	}
	
}
