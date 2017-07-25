package com.nezha.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nezha.entity.User;
import com.nezha.entity.UserVo;
import com.nezha.service.UserService;

@Controller
public class UserController {

	@Autowired
	public UserService userService ;
	

	@ResponseBody
	@RequestMapping("/test")
	public String getString(){
		return "This is a boring world";
	}
	
	@RequestMapping("/login")
	public String userLogin(){
		System.out.println("come in");
		return "index";
	}
	
	@ResponseBody
	@RequestMapping("/user")
	public String getUser(UserVo userVo){
		String a = "空";
		if(userVo != null){
			int id = userVo.getId();
			User user = userService.selectById(id);
			a = user.getName();
		}
		
		return a;
	}
	
}
