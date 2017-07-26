package com.nezha.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.nezha.entity.User;

public interface UserMapper extends BaseMapper<User>{

	public User getId(int id);
	
	public Integer insert(User entity);
	
}
