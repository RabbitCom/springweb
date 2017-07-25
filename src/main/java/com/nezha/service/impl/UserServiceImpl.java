package com.nezha.service.impl;

import java.io.Serializable;

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
	
	@Override
	public User selectById(Serializable id) {
		// TODO Auto-generated method stub
		return super.selectById(id);
	}
	
}
