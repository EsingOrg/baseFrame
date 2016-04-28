package com.smf.web.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {

	@RequestMapping(value="/login/{name}")
	public String loginSystem(@PathVariable("name") String name,Map model){
		String url="/jsp/main";
		System.out.println(url+"  name:"+name);
		 model.put("name",name);
		return url;
	}
	
	@RequestMapping(value="/")
	public String firstPage(){
		String url="index";
		System.out.println(url);
		return url;
	}
	
}
