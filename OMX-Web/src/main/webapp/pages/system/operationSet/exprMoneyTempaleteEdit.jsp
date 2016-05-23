<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ include file="/WEB-INF/include/common/popDivHeader.jsp" %>
<html>
  <head>
    <title>体验金手动充值</title>
  </head>
  
  <body>
	<div class="r_main clearfix" id="addBox">
	<div id="popCon" class="dialog" style="width:600px;margin: -260px 0 0 -400px">
		  <div class="clearfix"> 
		  <div class="title"><a id="closeBtn" href="javascript:;" onClick="$.tbox.close()" class="out"></a>充值</div>
	<div class="me_con">
	<form id="publicForm" action="saveRecharge.do" method="post">
            <div class="part" id="con_one_1">
            <ul class="infor clearfix" style="margin-top: 30px;">
                <li>
                    <div class="til"><span style="color:red;">*&nbsp;</span>用户名：</div>
                    <div class="info"> 
                      <input type="hidden" name="userId" id="userId" />
                      <input type="hidden" name="userNameH" id="userNameH" />
                      <input type="text" readonly id="userName" name="userName" class="yhgl_input w300" validate="q" maxlength="30"/>
                      <input value="查询" type="button" class="btn_cs ml10" onclick="searchUser();"/>
                    </div>                   
                </li>
                <li>
                    <div class="til"><span style="color:red;">*&nbsp;</span>金额：</div>
                    <div class="info"><input type="text" name="amucount" id="amucount"   class="yhgl_input w300" validate="q|amount|range"    maxlength="16"/></div>
                </li>  
                 <li>
                    <div class="til"><span style="color:red;">*&nbsp;</span>备注：</div>
                    <div class="info"><textarea name="remark" class="input w300" style="resize:none;height:100px;" validate="q|leng" leng="2,200"></textarea></div>
                </li>  
            </ul>
            <div class="btn w600">
            <input name="input" type="button" class="btn_cs ml10" value="确认" onclick="add()"/>
            <input type="button" class="btn_cs ml10" value="返回" onclick="$.tbox.close(); "/>
            </div>
            </div>
            </form>
	</div>
	</div>
</div>
</div>
  
  	<div class="r_main clearfix" id="userBox" style="display:none;">
  	<div id="popCon" class="dialog" style="width:800px;margin: -260px 0 0 -400px">
		  <div class="clearfix"> 
		  <div class="title"><a id="closeBtn" href="javascript:;" onClick="$.tbox.close()" class="out"></a>选择赠送用户</div>
	<div class="me_con">
  	<form id="userForm" action="sysUserList.do" method="post">
	   <!--搜索框  -->
      <div class="main_border clearfix">
        <div class="admin_input clearfix">
          <p>手机号：<input type="text" name="phone" class="yhgl_input"  maxlength="20"/></p>
          <p>姓名：<input type="text" name="name" class="yhgl_input"  maxlength="20"/></p>
          <p class="lo_btn">
               <input type="button" onclick="findUser();" class="search" value="搜索" /> 
 		  </p>
        </div>
       </div> 
              <!--搜索表框  --END-->  
	 </form>
	 <div class="main_con">
	 <!-- 表格框 -->
	 <table   width="100%" border="0" cellspacing="0" cellpadding="3" class="main_table tc" >
			<thead>
				<tr class="title">
					<td>   </td>
					<td>序号</td>
				    <td>用户名</td>
				    <td>姓名</td>
				    <td>手机号</td>
					<td>状态</td>
				</tr>
	        </thead>
		<tbody id="sysUserListGrid"></tbody>
	</table>
	
	<!-- 表格框 --END -->
	<!-- 分页组件-->
	<div id="sysUserListGridPage"></div>
	<!-- 分页组件 --END -->
	<p style="text-align: center;margin-top: 10px;">
       <input type="button" onclick="confirm();" class="btn_cs ml10"  value="确认" /> &nbsp&nbsp&nbsp
       <input type="button" onclick="exit();"  class="btn_cs ml10" value="退出" /> 
 	</p>
	</div>
	</div>
	</div>
	</div>
  	</div>
  </body>
  <script type="text/javascript">
  
  //增加校验模式
  dmCheck.init("#publicForm");
  var maxAmount = ${maxAmount};
  var range = [];
  range[0] = 0;
  range[1] = maxAmount;
  $('#amucount').attr("range",range);
  function add(){
	  if(!dmCheck.check("#publicForm")){
			return false;
		}
	  
	  DMGold.ajax({"formId":"publicForm","url":"saveRecharge.do","serialize":true,
		  "success":function(data){
			  debugger;
			  if(data.success){
				  $.tbox.close();
				  search();
			  }else{
				  
			  }
			  dm.alert(data.msg);
		  }});
  }
  //查询用户
  function searchUser(){
	  for(var index in DMGold.PageTag){
			page[index] = DMGold.PageTag[index];
		}
	  //隐藏当前新增框
	  $("#addBox").css("display","none");
	  //显示用户查找界面
	  $("#userBox").css("display","block");
	  DMGold.ajax({"formId":"userForm","url":"sysUserList.do",
		  "success":backFunc});
	  var userName = $("input[name='userName']").attr("value");
	  
  }
  var page = new Object();
  //分页跳转回调
	function backFunc(data){
	  debugger;
		//清空表格数据
		$("#sysUserListGrid").empty();
		//填充数据
		 $('#sysUserListTemplate').tmpl(data.pageResult).appendTo("#sysUserListGrid");
		
		//初始化分页标签
		DMGold.PageTag.init({"divId":"sysUserListGridPage","formId":"userForm","curPage":data.pageResult.pageIndex,"totalCount":data.pageResult.recordCount,
	          "pageCount":data.pageResult.pageTotal,"url":"sysUserList.do","toPageCallBack":backFunc});
	}
  //按条件查找用户信息
  function findUser(){
	  DMGold.ajax({"formId":"userForm","serialize":true,"url":"sysUserList.do",
		  "success":backFunc}); 
  }
  //确认事件
  function confirm(){
	  if($("input[name='userId']:checked").length == 0 && ($("#userName").val()=='')){
	  	dm.alert("没有选择用户",{"picClass":"d_error"});
	  	return;
	  }else{
	 	$("#userId").attr("value",$("input[name='userId']:checked").attr("id"));
	  	$("#userName").attr("value",$("#userNameH").attr("value"));
	  	exit();
	  }
  }
  //退出
  function exit(){
	  //隐藏用户查找界面
	  $("#userBox").css("display","none");
	  //显示新增框
	  $("#addBox").css("display","block");
	  //刷新分页
	  for(var index in DMGold.PageTag){
		  DMGold.PageTag[index] = page[index];
		}
  }
  function setUserName(userName){
	  $("#userNameH").attr("value",userName);
  }
</script>

<script id="sysUserListTemplate" type="text/x-jquery-tmpl">
 {{each(index) list}}
       <tr {{if index %2 == 0}}class="grey" {{/if}}>
        <td><input type="radio" name="userId" onclick="setUserName('{{= loginName}}');" id="{{= id}}" /></td> 
        <td>{{= index+1}}</td>
	    <td>{{= loginName}}</td>
	    <td>{{= realName}}</td>
		<td>{{= phone}}</td>
	    <td>{{= (lockFlag =="Y"?"锁定":"正常")}}</td>
       </tr>
  {{/each}}
 </script>
</html>
