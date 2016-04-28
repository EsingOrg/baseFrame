package com.smf.web.service;

import java.util.List;

import com.smf.sys.domain.vo.UserVo;

public interface UserService {
	/**
	 * 获取所有用户信息
	 * @return List<UserVo>
	 */
	public List<UserVo> selectAll();
	
	public List<UserVo> selectUserbyId(Integer id);
}
