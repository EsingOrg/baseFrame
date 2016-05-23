package com.smf.web.controller.home;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.smf.web.entity.home.LoginParmsRequest;

@Controller
@RequestMapping(value="/home")
public class HomeController {
	/**
	 * 首页-登录页
	 */
	@RequestMapping(value="index.do")
	public String index(){
		return "pages/home/login.jsp";
	}

	/**
	 * 登录
	 */
	@RequestMapping(value="doLogin.do")
	@ResponseBody
	public Map loginSystem(LoginParmsRequest loginParms,HttpServletRequest request,HttpServletResponse response){
		Map result = new HashMap();
		result.put("success", "true");
		return result;
	}
	/**
	 * 登录后主页
	 */
	@RequestMapping(value="main.do")
	public String main(){
		return "pages/home/main.jsp";
	}
	/**
	 * 登录后主页--头部
	 */
	@RequestMapping(value="header.do")
	public String header(){
		return "WEB-INF/include/common/header.jsp";
	}
	/**
	 * 登录后主页--首页
	 */
	@RequestMapping(value="homepage.do")
	public String homepage(){
		return "pages/home/homepage.jsp";
	}
	/**
	 * 登录后主页--底部
	 */
	@RequestMapping(value="footer.do")
	public String footer(){
		return "WEB-INF/include/common/footer.jsp";
	}
}
