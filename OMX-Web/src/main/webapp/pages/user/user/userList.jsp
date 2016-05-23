<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>个人列表信息</title>
<%@ include file="/WEB-INF/include/common/commHeader.jsp"%>
</head>
<body>

	<!---------------列表内容开始--------------->
	<div class="r_main clearfix">

		<!-- 搜索表框  -->
		<form id="dataForm" action="userPerList.do" method="post">
			<div class="main_con">
				<div class="admin_input clearfix">
					<p>
						用户名： <input type="text" name="userName" class="yhgl_input"
							value="${userreg.userName }" maxlength="20" />
					</p>
					<p>
						姓名： <input type="text" name="name" class="yhgl_input"
							value="${userreg.name }" maxlength="40" />
					</p>
					<p>
						手机号码： <input type="text" name="phone" class="yhgl_input"
							id="input" value="${userreg.phone }" maxlength="11" />
					</p>
					<p>
						注册时间： <input type="text" name="regStartTime"
							class="yhgl_input date" value="${userreg.regStartTime }"
							id="createTime1"
							onclick="WdatePicker({readOnly:true,maxDate: '#F{$dp.$D(\'createTime2\')}'})" />
						<span class="mr5">至</span> <input type="text" name="regEndTime"
							class="yhgl_input date" value="${userreg.regEndTime }"
							id="createTime2"
							onclick="WdatePicker({readOnly:true,minDate: '#F{$dp.$D(\'createTime1\')}'})" />
					</p>
					<p>
						注册来源：
						<dim:select name="source" enumType="UserSourceType" headName="全部"
							headValue="" exclude="" cssClass="yhgl_sel"></dim:select>

					</p>
					<p>
						状态：
						<form:select path="userreg.lockFlag" class="yhgl_sel">
							<form:option value="">全部</form:option>
							<form:option value="N">正常</form:option>
							<form:option value="Y">锁定</form:option>
						</form:select>
					</p>
					<p class="lo_btn">
						<input name="input" type="submit" class="search" value="搜索" />
						<shiro:hasPermission name="YHGL_YHXX_GRXX_DC">
							<input name="input" type="button" class="export ml10" value="导出"
								onclick="exportData('dataForm','exportuser.do');" />
						</shiro:hasPermission>
						<shiro:hasPermission name="YHGL_YHXX_GRXX_XZGRYH">
							<a href="javascript:void(0);" class="btn_cs ml10"
								onclick="addPerUser();"><i class="newly"></i>新增个人用户</a>
						</shiro:hasPermission>
					</p>
				</div>
			</div>

			<!-- 搜索表框END -->

			<!-- 列表框  -->
			<div class="main_con">
				<div class="menu_bd clearfix">
					<table width="100%" border="0" cellspacing="0" cellpadding="3"
						class="main_table tc" id="userTable">
						<tr class="title">
							<td>序号</td>
							<td>用户名</td>
							<td>姓名</td>
							<td>手机号码</td>
							<td>邮箱</td>
							<td>身份证</td>
							<td>注册时间</td>
							<td>登录次数</td>
							<td>注册来源</td>
							<td>状态</td>
							<td>操作</td>
						</tr>
					</table>
				</div>
				<!-- 分页 -->
				<div style="margin-top: 25px;" id="pageId">
					<dim:page url="userPerList.do"
						totalCount="${pageList.data.pageResult.recordCount }"
						formId="dataForm"
						showPages="${pageList.data.pageResult.pageSize }"
						curPage="${pageList.data.pageResult.pageIndex }"
						totalPages="${pageList.data.pageResult.pageTotal }" />
				</div>
				<!-- 分页END -->
			</div>
			<!-- 列表框END  -->
		</form>
	</div>
	<!---------------列表内容结束--------------->
	<!-- 增加用户信息弹出框start -->
	<div id="addDialog" style="display: none">
		<div class="popup_bg"></div>
		<div class="dialog">
			<div class="clearfix">
				<div class="title">
					<a href="javascript:void(0);" class="out"
						onclick="$('#addDialog').hide();"></a>新增个人账号
				</div>
				<div class="cotent">
					<form id="addForm" action="saveUser.do">
						<input type="hidden" name="token" value="${token}" />
						<!--  重复提交Token-->
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							class="table">

							<tr>
								<td valign="top" align="right"><span style="color: red;">*&nbsp;</span>手机号/邮箱：</td>
								<td id="mobile"></td>
							</tr>
							<tr>
								<td valign="top" align="right"><span style="color: red;">*&nbsp;</span>密码：</td>
								<td><input name="passWord" type="password"
									class="yhgl_input" validate="q|leng" leng="6,20" maxlength="20" />
								<p class="gray9">6~20个字符，区分大小写。</p></td>
							</tr>
							<tr>
								<td valign="top" align="right"><span style="color: red;">*&nbsp;</span>确认密码：</td>
								<td><input name="repassword" type="password"
									class="yhgl_input" onchange="clearTip();"
									onblur="checkRepassword(null,true);" /></td>
							</tr>

							<tr>
								<td colspan="2" id="msgTD"
									style="display: none; text-align: center; color: red;"></td>
							</tr>
						</table>
					</form>
				</div>
				<div class="btn">
					<a href="javascript:void(0);" class="btn_cs"
						onclick="addPerUserSubmit();">提交</a><a href="javascript:void(0);"
						class="btn_cs ml20" onclick="$('#addDialog').hide();">取消</a>
				</div>
			</div>
		</div>
	</div>
	<!-- 增加用户信息弹出框end -->
	<!-- 锁定用户弹出框start -->
	<div id="lockDialog" style="display: none">
		<div class="popup_bg"></div>
		<div class="dialog">
			<div class="clearfix">
				<div class="title">
					<a href="javascript:void(0);" class="out"
						onclick="$('#lockDialog').hide();"></a>确认<span id="lockid"></span>用户
				</div>
				<div class="cotent clearfix">
					<div class="conn">
						<input type="hidden" id="hd_userid" /> <input type="hidden"
							id="hd_islock" />
						<p class="tl f16 mt10" style="text-align: center">
							确定<span id="lockuser"></span>吗？
						</p>
					</div>
					<div class="btn">
						<a href="javascript:void(0);" class="btn_cs" onclick="islock()">确定</a><a
							href="#" class="btn_hs ml20" onclick="$('#lockDialog').hide();">取消</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script id="tableTemplate" type="text/x-jquery-tmpl">
		
		{{each(i,user) users}}
			<tr>
		      <td>{{= i+1}}</td>
		      <td>{{= user.loginName}}</td>
		      <td>{{= user.realName}}</td>
	    	  <td>{{= user.phone}}</td>
	    	  <td>{{= user.email}}</td>
	    	  <td>{{= user.idcard}}</td>
	    	  <td>{{= user.registerTime}}</td>
	    	  <td>{{= user.loginCount}}</td>
	    	  <td>{{= user.sourceName}}</td>
	    	  <td>
				{{if user.lockFlag=='Y'}}
					锁定
				{{else}}
                    	正常
				{{/if}}
			  </td>
	    	  <td>
				<shiro:hasPermission name="YHGL_YHXX_GRXX_SD">
	    	  	{{if user.lockFlag=='Y'}}
	    	  		<a class="orange" href="javascript:void(0);" onclick="lockinfo('{{= user.id}}','{{= user.lockFlag}}','{{= user.loginName}}')">解锁</a>
	    	  	{{else}}
	    	  		<a class="orange" href="javascript:void(0);" onclick="lockinfo('{{= user.id}}','{{= user.lockFlag}}','{{= user.loginName}}')">锁定</a>
	    	  	{{/if}}
				</shiro:hasPermission>
	   		    <a class="orange" href="javascript:void(0);" onclick="window.location.href='userPerShow.do?key={{= user.id}}&name={{= user.loginName}}';">查看</a>
				<shiro:hasPermission name="YHGL_YHXX_GRXX_XG">
	    			<a class="orange" href="javascript:void(0);" onclick="window.location.href='userPerShow.do?isEdit=true&key={{= user.id}}&name={{= user.loginName}}';">修改</a>
				</shiro:hasPermission>
				<shiro:hasPermission name="YHGL_YHXX_GRXX_DLCWCCZ">
				<a class="orange" href="javascript:void(0);" onclick="resetPsc('{{= user.id}}');">登陆错误数重置</a>
				</shiro:hasPermission>
	    	  </td>
		    </tr>
		{{/each}}
  </script>
	<!-- 锁定用户弹出框end -->
	<script type="text/javascript">
  
  	 $(function(){
  		searchUser();//jquery 模板demo
     });
	 
  	 //将用户列表数据放入table
	 var searchUser = function(){
 		var data = ${pageList.data.pageResult.list};
      	//清空模板类容
 		$('#tableTemplate').tmpl({users:data}).appendTo("#userTable");

	 };
  	
	 //锁定/解锁弹出框
 	function lockinfo(userid,islock,loginname){
 		
 		if(islock=='N'){
 			$("#lockid").text("锁定");
 			$("#lockuser").text("锁定"+loginname);
 			$("#hd_islock").val("Y");
 		}else{
 			$("#lockid").text("解锁");
 			$("#lockuser").text("解锁"+loginname);
 			$("#hd_islock").val("N");
 		}
 		$("#hd_userid").val(userid);
		
 		dmCheck.initForAjax("#lockDialog");
  		$("#lockDialog").show();
 	}	
  	
	 //解锁/锁定
 	function islock(){
 		var userid=$("#hd_userid").val();
 		var islock=$("#hd_islock").val();
 		$.ajax({ 
            type : "POST", 
            url : "userPerShowLock.do", 
            data : {"userId":userid,"lockFlag":islock}, 
            success : function(result) {
            	$('#lockDialog').hide();
            	if(result.statu.code == "000000"){
            		dm.alert("操作成功！",{
            			title:"提示",				//弹窗的标提
            			okName:"确定",			//如同alert确定按钮的value
            			picClass:"d_succeed",	//这里有三个值 "d_succeed" 显示成功图标,"d_error" 显示错误图标,"d_perfect" 显示信息提示图标,
            			notHaveClose:"xxx",
            			callback:function(){	//按确定后执行的函数
            				window.location.href="userPerList.do";
            			}
            		});
              	}else{
              		dm.alert(result.statu.description,{
            			title:"提示",				//弹窗的标提
            			okName:"确定",			//如同alert确定按钮的value
            			picClass:"d_error",	//这里有三个值 "d_succeed" 显示成功图标,"d_error" 显示错误图标,"d_perfect" 显示信息提示图标,
            			notHaveClose:"xxx",
            			callback:function(){	//按确定后执行的函数
            				window.location.href="userPerList.do";
            			}
            		});
              	}
            } 
        });
 	}
  
	 //新增用户弹出框
  	function addPerUser(){
  		$("#mobile").html('<input name="accountName" type="text" id="accountName" class="yhgl_input" onblur="checkMobileAndEmail(this.value)"/>');
  		dmCheck.initForAjax("#addForm");
  		$("#addDialog").show();
  	}
  	
	 //校验密码和确认密码是否相同
  	function checkRepassword(msg, isFocus) {
		var repassword =  $("#addForm input[name='repassword']");	  
		if (msg) {
			tip(repassword, msg);
		} else {
			if (!repassword.val() || repassword.val() != $("#addForm input[name='passWord']").val()) {
				tip(repassword, "两次输入的密码不一致！");
			} else {
				return true;
			}
		}
		if (!isFocus){	repassword.focus();}
		return false;
  	}
  	
	 //新增用户
  	function addPerUserSubmit(){
  		if((obj = dmCheck.returnObj("#addForm"))){	return obj.focus();}
  		if(!checkRepassword()){	return false;}
  		if(!checkMobileAndEmail($("#accountName").val())){ return false;}
  		$("#addForm input[name='passWord']").val(hex_md5($("#addForm input[name='passWord']").val()));
  		$.ajax({ 
            type : "POST", 
            url : "saveUser.do", 
            data : $("#addForm").serialize(), 
            success : function(result) { 
            	$('#addDialog').hide();
            	if(result.flag.code == "000000"){
            		dm.alert("新增成功！",{
            			title:"提示",				//弹窗的标提
            			okName:"确定",			//如同alert确定按钮的value
            			picClass:"d_succeed",	//这里有三个值 "d_succeed" 显示成功图标,"d_error" 显示错误图标,"d_perfect" 显示信息提示图标,
            			notHaveClose:"xxx",
            			callback:function(){	//按确定后执行的函数
            				window.location.href="userPerList.do";
            			}
            		});
              	}else{
              		dm.alert(result.flag.description,{
            			title:"提示",				//弹窗的标提
            			okName:"确定",			//如同alert确定按钮的value
            			picClass:"d_error",	//这里有三个值 "d_succeed" 显示成功图标,"d_error" 显示错误图标,"d_perfect" 显示信息提示图标,
            			notHaveClose:"xxx",
            			callback:function(){	//按确定后执行的函数
            				window.location.href="userPerList.do";
            			}
            		});
              	}
            } 
        });
  	}
  	
  	//手机号或邮箱校验
  	function checkMobileAndEmail(content){
  		if(content == ""){
  			$("#accountName").focus();
    		$("#accountName").before('<span class="pop-con"><div class="fl pop-pic"></div><div class="pop-info">手机号或邮箱不能为空</div></span>');
    		return false;
  		}else{
  			//非邮箱
  			if(content.indexOf('@')==-1){
  				//判断手机格式是否正确
  				if(dmCheck.regArray.Mobile.test(content)){
  					if(isExistPhone(content)){
  						$("#accountName").focus();
  	  		    		$("#accountName").before('<span class="pop-con"><div class="fl pop-pic"></div><div class="pop-info">手机号已存在</div></span>');
  	  		    		return false;
  					}
  				}else{
  					$("#accountName").focus();
  		    		$("#accountName").before('<span class="pop-con"><div class="fl pop-pic"></div><div class="pop-info">手机号格式不正确</div></span>');
  		    		return false;
  				}
  			}else{
  				//判断邮箱格式是否正确
				if(dmCheck.regArray.Email.test(content)){
					if(isExistEmail(content)){
  						$("#accountName").focus();
  	  		    		$("#accountName").before('<span class="pop-con"><div class="fl pop-pic"></div><div class="pop-info">邮箱已存在</div></span>');
  	  		    		return false;
  					}
  				}else{
  					$("#accountName").focus();
  		    		$("#accountName").before('<span class="pop-con"><div class="fl pop-pic"></div><div class="pop-info">邮箱格式不正确</div></span>');
  		    		return false;
  				}
  			}
  		}
  		return true;
  	}
  	
	
	//判断手机号是否存在
  function isExistPhone(phone){
	  var isExist=false;
	  if(phone != ''){
		  $.ajax({
			  async:false,
				type:"POST",
				url:"<%=basePath%>shop/isExistPhone.do",
				data:{"phone":phone,"userId":''},
				success:function(msg){
					if(msg.flag.code == '000000'){
						if(msg.flag.data == 'Y'){
		            		isExist=true;
						}
					}
				}
			});
	  }
	  return isExist;
  }
//判断邮箱是否存在
  function isExistEmail(email){
	  var isExist=false;
	  if(email != ''){
		  $.ajax({
			  async:false,
				type:"POST",
				url:"<%=basePath%>shop/isExistEmail.do",
				data : {
						"email" : email,
						"userId" : ''
					},
				success : function(msg) {
						if (msg.flag.code == '000000') {
							if (msg.flag.data == 'Y') {
								isExist = true;
							}
						}
					}
				});
			}
			return isExist;
		}
		/**
		重置登陆密码输入错误次数
		 */
		function resetPsc(userId) {
			DMGold.ajax({
				"data" : {
					'userId' : userId
				},
				"serialize" : true,
				"url" : "../resetPsc.do",
				"success" : function(data) {
					//显示提示信息
					if ("000000" == data.code) {
						dm.alert(data.description, {
							"picClass" : "d_succeed"
						});
					} else {
						dm.alert(data.description, {
							"picClass" : "d_error"
						});
					}
				}
			});
		}
	</script>

</body>
</html>