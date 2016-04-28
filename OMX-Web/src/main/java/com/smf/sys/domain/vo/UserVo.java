package com.smf.sys.domain.vo;

import java.util.Date;

public class UserVo {
	private Integer esusId;
	private String esusNameEn;
	private String esusNameCh;
	private String esusPassword;
	private Integer esrlId;
	private String creator;
	private Date createTime;
	private String modifier;
	private Date  modifyTime;
	private Integer orgId;
	private String esusNameEnLike;
	private String esusNameChLike;
	private Integer offset;
	private Integer limit;
	
	public Integer getEsusId() {
		return esusId;
	}
	public void setEsusId(Integer esusId) {
		this.esusId = esusId;
	}
	public String getEsusNameEn() {
		return esusNameEn;
	}
	public void setEsusNameEn(String esusNameEn) {
		this.esusNameEn = esusNameEn;
	}
	public String getEsusNameCh() {
		return esusNameCh;
	}
	public void setEsusNameCh(String esusNameCh) {
		this.esusNameCh = esusNameCh;
	}
	public String getEsusPassword() {
		return esusPassword;
	}
	public void setEsusPassword(String esusPassword) {
		this.esusPassword = esusPassword;
	}
	public Integer getEsrlId() {
		return esrlId;
	}
	public void setEsrlId(Integer esrlId) {
		this.esrlId = esrlId;
	}
	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getModifier() {
		return modifier;
	}
	public void setModifier(String modifier) {
		this.modifier = modifier;
	}
	public Date getModifyTime() {
		return modifyTime;
	}
	public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
	}
	public Integer getOrgId() {
		return orgId;
	}
	public void setOrgId(Integer orgId) {
		this.orgId = orgId;
	}
	public String getEsusNameEnLike() {
		return esusNameEnLike;
	}
	public void setEsusNameEnLike(String esusNameEnLike) {
		this.esusNameEnLike = esusNameEnLike;
	}
	public String getEsusNameChLike() {
		return esusNameChLike;
	}
	public void setEsusNameChLike(String esusNameChLike) {
		this.esusNameChLike = esusNameChLike;
	}
	public Integer getOffset() {
		return offset;
	}
	public void setOffset(Integer offset) {
		this.offset = offset;
	}
	public Integer getLimit() {
		return limit;
	}
	public void setLimit(Integer limit) {
		this.limit = limit;
	}
	
	
	
}
