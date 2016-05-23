<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp" %>
<html>
  <head>
  <title>系统用户列表</title>
  </head>
  <body>
	<div class="systemUser">	
		<div class="r_main clearfix ">
			<form id="form" method="post">
			   <!--搜索框  -->
		      <div class="main_border clearfix">
		        <div class="admin_input clearfix">
		          <p>用户名：<input type="text" name="loginName" class="yhgl_input"  maxlength="20"/></p>
		          <p>用户组：<form:select path="sysUserReq.userGrop" cssClass="yhgl_sel" >
		                     <option value="">全部</option>  
	                         <form:options items="${roleList}"/> 
		                  </form:select>
		           </p>
		           <p>状态：<dim:select name="status" enumType="SysUserStatus" headName="全部" headValue="" exclude="D" cssClass="yhgl_sel"></dim:select></p>
		           <p>创建时间：<input type="text" name="createTimeBefore"
								class="yhgl_input date"
								class="Wdate" id="startDate"
								onclick="WdatePicker({readOnly:true,maxDate:'#F{$dp.$D(\'endDate\')}'})" />
							<span class="mr5">至</span> <input type="text" name="createTimeEnd"
								 class="yhgl_input date"
								class="Wdate" id="endDate"
								onclick="WdatePicker({readOnly:true,minDate:'#F{$dp.$D(\'startDate\')}'})" />
					</p>
		            <p class="lo_btn">
		               <input type="button" onclick="search();" class="search" value="搜索" /> 
		               <shiro:hasPermission name="XTGL_HTZHGL_YHLB_XZ">
		               <a onclick="popDiv('<%=basePath %>system/consoleAccountMgt/editSysUser.do?t=<%=Math.random() %>')" href="javascript:void(0)" class="btn_cs ml10"><i class="newly"></i>新增</a>
		               </shiro:hasPermission>
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
								<td>序号</td>
							    <td>用户名</td>
							    <td>姓名</td>
								<td>用户组</td>
								<td>状态</td>
								<td>创建人</td>
								<td>创建时间</td>
								<td>操作</td>
							</tr>
				        </thead>
					<tbody id="sysUserListGrid"></tbody>
				</table>
				<!-- 表格框 --END -->
				<!-- 分页组件-->
				<div id="pageTag"></div>
				<!-- 分页组件 --END -->
				</div>
			</div>
		</div>
 </body>
 <!-- 错误信息提示 -->
<c:if test="${param.errMsg ne null}">
<script type="text/javascript">
	dm.alert(decodeURIComponent('${param.errMsg}'));//错误提示信息
</script>
</c:if>
<!-- 系统用户显示模板 -->
<script id="sysUserListTemplate" type="text/x-jquery-tmpl">
 {{each(index) list}}
       <tr {{if index %2 == 0}}class="grey" {{/if}}>
        <td>{{= index+1+((pageIndex-1)*pageSize)}}</td>
	    <td>{{= loginName}}</td>
	    <td>{{= realName}}</td>
        <td>{{= userGrop}}</td> 
	    <td>{{= (status=="Y"?"启用":"禁用")}}</td>
	    <td>{{= createBy}}</td>
        <td>{{= createTime}}</td> 
        <td>
			{{if loginName!='admin'}}
			<shiro:hasPermission name="XTGL_HTZHGL_YHLB_BJ">
            <a onclick="popDiv('<%=basePath %>system/consoleAccountMgt/editSysUser.do?id={{= id}}&t=<%=Math.random() %>')" href="javascript:void(0)" class="orange">编辑</a>
		    </shiro:hasPermission>
			{{/if}}
			<shiro:hasPermission name="XTGL_HTZHGL_YHLB_GMM">
            <a onclick="openDivPwd({{= id}},'{{= loginName}}')" href="javascript:void(0)" class="orange">改密码</a>
		    </shiro:hasPermission>
			{{if loginName!='admin'}}
			<shiro:hasPermission name="XTGL_HTZHGL_YHLB_SC">
            <a href="javascript:deleteUser({{= id}})" class="orange">删除</a>
		    </shiro:hasPermission>
			<shiro:hasPermission name="XTGL_HTZHGL_YHLB_FPJS">
            <a onclick="popDiv('<%=basePath %>system/consoleAccountMgt/allocSysRoleView.do?id={{= id}}&t=<%=Math.random() %>')" href="javascript:void(0)" class="orange">分配角色</a>
		    </shiro:hasPermission>
			{{/if}}
        </td>	
       </tr>
  {{/each}}
 </script>
 <script type="text/javascript">
	//页面加载时调用
 	$(function(){
	  search();//加载数据
 	});
 	function search(){
 		DMGold.ajax({"formId":"form","serialize":true,"url":"sysUserListAjax.do","success":pageTagCallBack});
	}
 	//分页跳转回调
 	function pageTagCallBack(data){
 		//清空表格数据
 		$("#sysUserListGrid").empty();
 		//填充数据
		 $('#sysUserListTemplate').tmpl(data.pageResult).appendTo("#sysUserListGrid");
		//初始化分页标签
		DMGold.PageTag.init({"divId":"pageTag","formId":"form","curPage":data.pageResult.pageIndex,"totalCount":data.pageResult.recordCount,
			          "pageCount":data.pageResult.pageTotal,"url":"sysUserListAjax.do","toPageCallBack":pageTagCallBack});
 	}
    //弹出框
    function popDiv(url){
 	   $.tbox.popup(url);
    }
    //修改密码
 	function openDivPwd(id,loginName){
 		loginNames = encodeURIComponent(encodeURIComponent(loginName));
 		popDiv('<%=basePath %>system/consoleAccountMgt/sysUserModifyPwd.do?id='+id+'&ln='+loginNames+'&t=<%=Math.random() %>');
 	}
 	//删除系统用户
 	function deleteUser(userId){
    		 dm.confirm("确定删除此用户？",{
 				title:"确认",				//标题
 				okName:"确定",			//如同confirm确定按钮的value
 				cancleName:"取消",		//如同confirm取消按钮的value
 				picClass:"d_perfect",
 				callback:function(){	//按确定的执行的函数
 					DMGold.ajax({"data":{'id':userId},"serialize":true,"url":"deleteSysUser.do","success":function(data){
 						//显示提示信息
 						if("000000"==data.code){
 							dm.alert(data.description,{"picClass":"d_succeed"});
 						}else{
 							dm.alert(data.description,{"picClass":"d_error"});
 						}
 						//刷新列表
 						search();
 					}});
 				}
 			});
    }
 </script>
 
</html>
