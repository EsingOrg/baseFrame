<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ include file="/WEB-INF/include/common/popDivHeader.jsp" %>
<html>
  <head>
    <title>线下充值新增</title>
  </head>
  <body>

<div class="popup_bg"></div>
<div class="dialog" style="width: 550px;">
  <div class="clearfix"> 
      <div class="title"><a href="javascript:void(0);" onClick="$.tbox.close()" class="out"></a>新增线下充值</div>
      <form action="<%=basePath %>finance/addFinanceBelowlineReacharge.do" method="post" id="auditing">
      <input type="hidden" name="userId" id="userId"/>
      <input type="hidden" name="token" value="${token}"/><!--  重复提交Token-->
      <div class="cotent">
         <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table">
          <tr>
            <td valign="top" width="30%" align="right"><span style="color:red;">*&nbsp;</span>用户名：</td>
            <td><input name="loginName" id="username" type="text" class="yhgl_input" validate="q" onblur="getUerid(this.value)" />
            <input name="input" type="button" class="btn_cs ml10" value="查询" onclick="search()"/>
            </td>
          </tr> 
          <tr>
            <td valign="top" align="right"><span style="color:red;">*&nbsp;</span>充值金额：</td>
            <td><input name="amount" type="text" class="yhgl_input" validate="q|amount" />
            </td>
          </tr> 
          <tr>
            <td valign="top" align="right">备注：</td>
            <td><textarea name="remark" cols="50" rows="3" class="border" maxlength="100"></textarea></td>
          </tr>          
        </table>
        
      </div>
      <div class="btn"><input type="button" onclick="submitRecharge()" class="btn_cs ml10" value="提交" />
      <input name="input" type="button" class="btn_cs ml10" value="取消" onclick="$.tbox.close()"/>
      </div> 
      </form>
    </div>
</div>

<div class="r_main clearfix" id="userBox" style="display:none;">
  	<div id="popCon" class="dialog" style="width:1000px;margin: -260px 0 0 -400px">
		<div class="clearfix"> 
			<div class="title"><a id="closeBtn" href="javascript:;" onClick="$('#userBox').hide();" class="out"></a>选择用户</div>
			<div class="me_con" style="max-height: 550px;">
			  	<form id="userForm" action="sysUserList.do" method="post">
				   <!--搜索框  -->
			      <div class="main_border clearfix">
			        <div class="admin_input clearfix">
			          <p class="userSearch">手机号：<input type="text" name="phone" class="yhgl_input"  maxlength="20"/></p>
			          <p class="shopSearch" style="display: none;">用户名：<input type="text" name="userName" class="yhgl_input"  maxlength="20"/></p>
			          <p class="userSearch">姓名：<input type="text" name="name" class="yhgl_input"  maxlength="20"/></p>
			          <!-- <p class="shopSearch" style="display: none;">店铺名称：<input type="text" name="shopFullName" class="yhgl_input" maxlength="40"/></p> -->
			          <p class="shopSearch" style="display: none;">
					            所在省份： 
					            <select name="provinces" id="provinces" class="yhgl_sel" onchange="changeProvince(this.value)">
					            </select>
			          </p>
			          <p class="shopSearch" style="display: none;">
					  	所在市区： 
					  	<select name="city" id="city" class="yhgl_sel">
						<option value="">全部</option>
			            </select>
					  </p>
			          <p class="lo_btn">
			               <input type="button" onclick="findUser();" class="userSearch search" value="搜索" /> 
			               <input type="button" onclick="findShop();" style="display: none" class="shopSearch search" value="搜索" /> 
			 		  </p>
			        </div>
			       </div> 
			              <!--搜索表框  --END-->  
				 </form>
				 
				 <div class="main_con" >
				 
				 	<div class="menubox clearfix">
						<ul>
							<li class="hover" onclick="userLi()" id="userLi"><a href="#">个人用户</a></li>
							<li onclick="shopLi()" id="shopLi"><a href="#">店铺用户</a></li>
						</ul>
					</div>
				 <!-- 表格框 -->
					 <table   width="100%" border="0" cellspacing="0" cellpadding="3" class="main_table tc" >
							<thead>
								<tr class="title">
									<td>   </td>
									<td>序号</td>
								    <td>用户名</td>
								    <td id="tdName">姓名</td>
								    <td class="userSearch">手机号</td>
								    <td class="shopSearch" style="display: none;">所在省份</td>
								    <td class="shopSearch" style="display: none;">所在市区</td>
									<td>状态</td>
								</tr>
					        </thead>
						<tbody id="userlistBody"></tbody>
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
  <script id="userData" type="text/x-jquery-tmpl">
{{each(index) list}}
       <tr {{if index %2 == 0}}class="grey" {{/if}}>
		<td><input type="radio" name="useridRadio" value="{{= loginName}}" id="{{= id}}"/></td>
		<td>{{= index+1}}</td>
        <td>{{= loginName }}</td>
	    <td>{{= realName}}</td>
		<td>{{= phone}}</td>
	    <td>{{if lockFlag == 'Y'}}
					锁定
			{{else}}
					正常
			{{/if}}
		</td>
      </tr>
 {{/each}}
</script>
<script id="shopData" type="text/x-jquery-tmpl">
{{each(index) list}}
       <tr {{if index %2 == 0}}class="grey" {{/if}}>
		<td><input type="radio" name="useridRadio" value="{{= shopUserId}}" id="{{= shopId}}"/></td>
		<td>{{= index+1}}</td>
        <td>{{= shopUserId }}</td>
	    <td>{{= name}}</td>
		<td>{{= provinces}}</td>
		<td>{{= city}}</td>	
	    <td>{{if lockFlag == 'Y'}}
					锁定
			{{else}}
					正常
			{{/if}}
		</td>
      </tr>
 {{/each}}
</script>
<script>
dmCheck.init("#auditing");
var page = new Object();
	//判断用户名是否存在
	function getUerid(username){
		if(username!=''){
			$.ajax({ 
	            type : "POST", 
	            url : "getUserid.do", 
	            data : {"userName":username}, 
	            success : function(result) {
	            	if(result.user.code!='000000'){
	            		$("#username").focus();
	            		$("#username").before('<span class="pop-con"><div class="fl pop-pic"></div><div class="pop-info">用户名不存在</div></span>');
	            	}else{
	            		$("#userId").val(result.user.data.singleResult.id);
	            	}
	            }
			});
		}
		
	}
	//新增线下充值
	function submitRecharge(){
		if((obj = dmCheck.returnObj("#auditing")))	return obj.focus();
		$.ajax({ 
            type : "POST", 
            url : "addFinanceBelowlineReacharge.do", 
            data : $("#auditing").serialize(), 
            success : function(result) {
            	$.tbox.close();
            	if(result.flag.code=='000000'){
            		dm.alert("新增成功！",{
            			title:"提示",				//弹窗的标提
            			okName:"确定",			//如同alert确定按钮的value
            			picClass:"d_succeed",	//这里有三个值 "d_succeed" 显示成功图标,"d_error" 显示错误图标,"d_perfect" 显示信息提示图标,
            			notHaveClose:"xxx",
            			callback:function(){	//按确定后执行的函数
            				window.location.href="getFinanceBelowlineRecharge.do";
            			}
            		});
            	}else{
            		dm.alert(result.flag.description);
            	}
            }
		});
	}
	
	//弹出查询店铺框
	function search(){
		document.getElementById("userForm").reset();
		for(var index in DMGold.PageTag){
			page[index] = DMGold.PageTag[index];
		}
		findUser();
		getAllProvince();
		$("#userBox").show();
	}
	
	//查询店铺列表
	function findUser(){
		DMGold.ajax({"formId":"userForm","serialize":true,"url":"<%=basePath%>system/operationSet/sysUserList.do",
			  "success":userList}); 
	}
	
	//查询店铺列表
	function findShop(){
		DMGold.ajax({"formId":"userForm","serialize":true,"url":"<%=basePath%>business/platFormWarehouse/shopPerList.do",
			  "success":shopList}); 
	}
	
	//将个人用户数据放入表格
 	function userList(data){
 		//清空表格数据
		$("#userlistBody").empty();
		//填充数据
		 $('#userData').tmpl(data.pageResult).appendTo("#userlistBody");
		
		//初始化分页标签
		DMGold.PageTag.init({"divId":"sysUserListGridPage","formId":"userForm","curPage":data.pageResult.pageIndex,"totalCount":data.pageResult.recordCount,
	          "pageCount":data.pageResult.pageTotal,"url":"<%=basePath%>system/operationSet/sysUserList.do","toPageCallBack":userList});
  	 }
 	//将店铺用户数据放入表格
 	function shopList(data){
  	  	//清空表格数据
		$("#userlistBody").empty();
		//填充数据
		$('#shopData').tmpl(data.pageList.data.pageResult).appendTo("#userlistBody");
  	 	//初始化分页标签
  		DMGold.PageTag.init({"divId":"sysUserListGridPage","formId":"userForm","curPage":data.pageList.data.pageResult.pageIndex,"totalCount":data.pageList.data.pageResult.recordCount,
  				         "pageCount":data.pageList.data.pageResult.pageTotal,"url":"<%=basePath%>business/platFormWarehouse/shopPerList.do","toPageCallBack":shopList});
  	  	}
	
 	function confirm(){
		var val=$('input:radio[name="useridRadio"]:checked').val();
		var id=$('input:radio[name="useridRadio"]:checked').attr("id");
		if(val!=null){
			$("#userId").val(id);
			$("#username").val(val);
    		exit();
		}else{
			dm.alert("请选择用户！");
		}
	}
 	
 	function exit(){
 		$('#userBox').hide();
 		//刷新分页
 		  for(var index in DMGold.PageTag){
 			  DMGold.PageTag[index] = page[index];
 			}
 	}
 	
 	function userLi(){
 		$("#userLi").addClass("hover");
 		$("#shopLi").removeClass("hover");
 		$(".userSearch").show();
 		$(".shopSearch").hide();
 		document.getElementById("userForm").reset();
 		$("#tdName").text("姓名")
 		findUser();
 	}
 	function shopLi(){
 		$("#shopLi").addClass("hover");
 		$("#userLi").removeClass("hover");
 		$(".shopSearch").show();
 		$(".userSearch").hide();
 		document.getElementById("userForm").reset();
 		$("#tdName").text("店铺名称")
 		findShop();
 	}
 	
	//查询所有省份
	function getAllProvince(){
		$.ajax({
			type:"POST",
			url:"<%=basePath%>audit/getProvince.do",
			data:{"subRegionId":0},
			success:function(msg){
				var list=msg.data.data.list;
				$("#provinces").empty();
				$("#provinces").append("<option value=''>全部</option>");
				for(var i=0;i<list.length;i++){
					$("#provinces").append("<option value='"+list[i].id+"'>"+list[i].name+"</option>");
					
				}
			}
		});
	}
	//获取省下市区
	function changeProvince(pid){
		if(pid =='' || pid == null){
			$("#city").empty();
			$("#city").append("<option value=''>全部</option>");
		}else{
			$.ajax({
				type:"POST",
				url:"<%=basePath%>audit/getProvince.do",
				data:{"subRegionId":pid},
				success:function(msg){
					var list=msg.data.data.list;
					$("#city").empty();
					$("#city").append("<option value=''>全部</option>");
					for(var i=0;i<list.length;i++){
						$("#city").append("<option value='"+list[i].id+"'>"+list[i].name+"</option>");
						
					}
				}
			});
		}
	}
</script>
  </body>
</html>
