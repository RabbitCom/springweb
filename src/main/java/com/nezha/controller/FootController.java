package com.nezha.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.util.JSONPObject;
import com.nezha.service.FootService;

@Controller
@RequestMapping("/footController")
public class FootController {

	@Autowired
	private FootService footService;
	
	@ResponseBody
	@RequestMapping(value="/test",method=RequestMethod.GET)
	public Object getString(){
		Map<String,Object>  a = new HashMap<String,Object>();
		a.put("upToken", "DBDyvzcYa4O7gpAiwbXG2_d2xi5LoRIDVrhep6ky:pZiblG7Ki1KppO1lsU9ol3LvA1g=:eyJzY29wZSI6ImNubGl2ZXRlc3QiLCJkZWFkbGluZSI6MTUwMzA0MTgxNX0=");
		a.put("domain", "test.qnvod.cnlive.com");
		a.put("key", "1/2/");
		
		String b = "{\"upToken\":\"DBDyvzcYa4O7gpAiwbXG2_d2xi5LoRIDVrhep6ky:pZiblG7Ki1KppO1lsU9ol3LvA1g=:eyJzY29wZSI6ImNubGl2ZXRlc3QiLCJkZWFkbGluZSI6MTUwMzA0MTgxNX0=\",\"domain\":\"test.qnvod.cnlive.com\",\"key\":\"1/2\"}"; 
//		a.put(arg0, arg1);
		return b;
	}
	
	
}
