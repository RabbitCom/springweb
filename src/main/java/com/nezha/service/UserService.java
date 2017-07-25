package com.nezha.service;

import java.io.Serializable;

import com.baomidou.mybatisplus.service.IService;
import com.nezha.entity.User;

public interface UserService extends IService<User>{

	@Override
	boolean insert(User entity);
	
	@Override
	User selectById(Serializable id);
	
}
