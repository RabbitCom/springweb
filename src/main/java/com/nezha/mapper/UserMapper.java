package com.nezha.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.nezha.entity.User;
import com.nezha.entity.UserVo;

public interface UserMapper extends BaseMapper<User>{

	public UserVo getId(int id);
	
	public Integer insert(User entity);

	boolean registerUser(User user);
	
	User loginCheck(User user);
}
