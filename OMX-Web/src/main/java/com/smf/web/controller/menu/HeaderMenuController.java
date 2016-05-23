package com.smf.web.controller.menu;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.smf.web.entity.home.LoginParmsRequest;

/**
 * @author tangguilin
 * 头部菜单管理-
 */
@Controller
@RequestMapping(value="/headerMenu")
public class HeaderMenuController {
	/**
	 * 用户管理-左侧菜单加载
	 */
	@RequestMapping(value="userMgt.do")
	public String index(){
		return "WEB-INF/include/menus/userMenu.jsp";
	}

}
