package com.nezha.controller;

import com.nezha.entity.User;
import com.nezha.entity.UserVo;
import com.nezha.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.*;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	@RequestMapping("/register")
	public String register(){
		System.out.println("navigation to register");
		return "register";
	}

	@RequestMapping("/registerUser")
	public ModelAndView registerUser(User user){
		userService.registerUser(user);
		Map<String,Object> datas = new HashMap<String,Object>();
		datas.put("registerUser",user);
		return new ModelAndView("registerSuccess",datas);
	}

	@RequestMapping("/upload")
	public String upload(){
		System.out.println("navigate to upload");
		return "user/upload";
	}

	@RequestMapping("fileUpload")
	public String fileUpload(@RequestParam("fileName")CommonsMultipartFile file){
		long start = System.currentTimeMillis();
		String fileName = file.getName();
		OutputStream os = null;
		InputStream is = null;
		try {
			os = new FileOutputStream("E:/"+new Date().getTime()+file.getOriginalFilename());
			is = file.getInputStream();
			int temp ;
			while ((temp = is.read()) != -1){
				os.write(temp);
			}
			os.flush();
		} catch (java.io.IOException e) {
			e.printStackTrace();
		} finally {
			if (os != null){
				try {
					os.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if (is != null){
				try {
					is.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		long end = System.currentTimeMillis();
		System.out.println("方法一的运行时间："+String.valueOf(end-start)+"ms");
		return "icons";

	}

	@RequestMapping
	@ResponseBody
	public String getUserName(@RequestParam(name = "username",required = true, defaultValue = "david")List<String> username){
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < username.size(); i++) {
			System.out.println("username = "+username.get(i));
			sb.append(username.get(i));
		}

		return sb.toString();
	}

	@ResponseBody
	@RequestMapping("/{name}/{id}")
	public String getUser(@PathVariable("name") String name,@PathVariable("id") int id){
		return "id="+id+";name="+name;
	}
}
