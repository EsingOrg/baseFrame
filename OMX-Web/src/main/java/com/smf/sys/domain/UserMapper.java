package com.smf.sys.domain;

import java.util.List;

import com.smf.base.dao.SqlMapper;
import com.smf.sys.domain.vo.UserVo;
/**
 * 用户表映射接口
 * @author joyzhang
 */
public interface UserMapper extends SqlMapper{
	/**
	 * 获取所有用户信息
	 * @return List<UserVo>
	 */
	List<UserVo> selectAll();
	/**
	 * 获取所有用户信息（存储过程）
	 * @return List<UserVo>
	 */
	List<UserVo> selectUserbyId(Integer id);
	
	
	
}
