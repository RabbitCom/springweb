package com.nezha.mapper;

import org.mybatis.spring.annotation.MapperScan;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.nezha.entity.User;

@MapperScan
public interface UserMapper extends BaseMapper<User>{

	public User getId(int id);
	
	public Integer insert(User entity);
	
}
