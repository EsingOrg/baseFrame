package com.smf.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.smf.sys.domain.UserMapper;
import com.smf.sys.domain.vo.UserVo;
import com.smf.web.service.UserService;
@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserMapper usermapper;
	
	@Override
	@Transactional(rollbackFor = { Exception.class })
	public List<UserVo> selectAll() {
		//TransactionAspectSupport.currentTransactionStatus()
		return usermapper.selectAll();
	}

	@Override
	public List<UserVo> selectUserbyId(Integer id) {
		// TODO Auto-generated method stub
		return usermapper.selectUserbyId(id);
	}

}
