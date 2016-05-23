package com.smf.web.entity.home;

/**
 * @author tangguilin
 * 登录请求参数实体
 *
 */
public class LoginParmsRequest {
	private String accountName;
	private String password;
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAccountName() {
		return accountName;
	}
	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}

}
