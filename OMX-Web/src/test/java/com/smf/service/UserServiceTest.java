package com.smf.service;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.smf.sys.domain.vo.UserVo;
import com.smf.web.service.UserService;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext-core.xml")
public class UserServiceTest extends AbstractJUnit4SpringContextTests{
	 
	@Resource
	private UserService userService;
	
	@Test
	public void selectAllTest(){
		
		List<UserVo> vos= userService.selectAll();
		for (int i = 0; i < vos.size(); i++) {
			//System.out.println("UserName:"+vos.get(i).getEsusNameCh());
		}
		
	}
	
	@Test
	public void selectUserbyIdTest(){
		List<UserVo> vos= userService.selectUserbyId(2);
		if(vos==null||vos.size()<1){
			System.out.println("no Result!");
		}else{
			for (int i = 0; i < vos.size(); i++) {
				System.out.println("UserName:"+vos.get(i).getEsusNameCh());
			}
		}
	}
}
