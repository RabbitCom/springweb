package com.nezha.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nezha.entity.User;
import com.nezha.entity.UserVo;
import com.nezha.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;
	
	@ResponseBody
	@RequestMapping(value="/test",method=RequestMethod.GET)
	public String getString(){
		return "This is a boring world";
	}
	
	@RequestMapping("/login")
	public String userLogin(){
		System.out.println("come in");
		UserVo userVo = userService.getId(1);
		User user = userService.selectById(1);
		return "index";
	}
}
