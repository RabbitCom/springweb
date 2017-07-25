package com.nezha.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	
}
