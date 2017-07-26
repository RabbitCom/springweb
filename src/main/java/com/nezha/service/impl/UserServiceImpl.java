package com.nezha.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.nezha.entity.User;
import com.nezha.mapper.UserMapper;
import com.nezha.service.UserService;

@Service
public class UserServiceImpl extends  ServiceImpl<UserMapper, User> implements UserService {

	@Autowired
	private UserMapper userMapper;
	
	@Override
	public boolean insert(User entity) {
		return super.insert(entity);
	}
	
	@Override
	public User selectById(int id) {
		// TODO Auto-generated method stub
		return userMapper.getId(id);
//		return super.selectById(id);
	}
	
}
