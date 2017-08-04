package com.nezha.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.nezha.entity.User;
import com.nezha.service.UserService;

@Controller
@RequestMapping("/userController")
public class UserController {

	@Autowired
	private UserService userService;
	
	@ResponseBody
	@RequestMapping(value="/test",method=RequestMethod.GET)
	public String getString(){
		return "This is a boring world";
	}
	
	@RequestMapping("/login")
	public String userLogin(HttpServletRequest req,User user){
		System.out.println("come in");
		User userCheck = userService.loginCheck(user);
		if(userCheck == null){
			return  "index";
		}
		System.out.println("sss"+userCheck.toString());
	    HttpSession session = req.getSession(); 
	    session.setAttribute("name", userCheck.getName());
	    session.setAttribute("id", userCheck.getId());
		return  "page/main";
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
