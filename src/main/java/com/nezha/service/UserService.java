package com.nezha.service;

import com.nezha.entity.User;
import com.nezha.entity.UserVo;

public interface UserService {
	
	User selectById(int id);
	UserVo getId(int id);
	boolean registerUser(User user);
	User loginCheck(User user);
}
