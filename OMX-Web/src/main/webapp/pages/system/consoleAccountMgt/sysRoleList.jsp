<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp" %>
<html>
  <head>
  <meta name="renderer" content="webkit|ie-comp|ie-stand"> 
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>系统角色列表</title>
  </head>
  <body>
	 <div class="r_main clearfix">
	    
          <div class="main_border clearfix">
           <div class="admin_input clearfix">
           <shiro:hasPermission name="XTGL_HTZHGL_YHZGL_XZYHZ">
              <p class="lo_btn"> 
               <a onclick="popDiv('<%=basePath %>system/consoleAccountMgt/editSysRole.do?t=<%=Math.random() %>')" href="javascript:void(0)" class="btn_cs ml10"><i class="newly"></i>新增用户组</a>
              </p>
              </shiro:hasPermission>
            </div> 
            </div>
            
            <div class="main_con">
            <form id="form"></form>
            <table width="100%" border="0" cellspacing="0" cellpadding="3" class="main_table tc">
            <thead>
              <tr class="title">
                    <td>序号</td>
			        <td>ID</td>
			        <td>角色名称</td>
			        <td>描述</td>
			        <td>操作</td>              
              </tr>
              </thead><tbody id="grid"></tbody>
            </table>
            </div>
</div>
<c:if test="${param.errMsg ne null}">
  <script type="text/javascript">
    dm.alert(decodeURIComponent('${param.errMsg}'));
  </script>
</c:if>
<!-- 角色列表  GridList数据 -->
<script id="gridTemp" type="text/x-jquery-tmpl">
{{each(index) pageResult}}
{{if id != 1}}
       <tr {{if index %2 == 0}}class="grey" {{/if}}>
        <td>{{= index+1}}</td>
	    <td>{{= id}}</td>
	    <td>{{= name}}</td>
        <td>{{= desc}}</td> 
	    <td>
			<shiro:hasPermission name="XTGL_HTZHGL_YHZGL_BJ">
			<a onclick="popDiv('<%=basePath %>system/consoleAccountMgt/editSysRole.do?id={{= id}}&t=<%=Math.random() %>')" href="javascript:void(0)" class="orange">编辑</a>
			</shiro:hasPermission>
			<shiro:hasPermission name="XTGL_HTZHGL_YHZGL_FPQX">
			<a href="<%=basePath %>system/consoleAccountMgt/assignSysFunction.do?roleId={{= id}}&t=<%=Math.random() %>" class="orange">分配权限</a>
			</shiro:hasPermission>
			<shiro:hasPermission name="XTGL_HTZHGL_YHZGL_FPYH">
			<a onclick="popDiv('<%=basePath %>system/consoleAccountMgt/assignSysUser.do?id={{= id}}&t=<%=Math.random() %>')" href="javascript:void(0)" class="orange">分配用户</a>
			</shiro:hasPermission>
			<shiro:hasPermission name="XTGL_HTZHGL_YHZGL_SC">
			<a href="javascript:void(0);" onclick="delRole('{{= id}}')" class="orange">删除</a>
			</shiro:hasPermission>
		</td>
       </tr>
{{/if}}
{{/each}}
</script>
<script type="text/javascript">
	
	$(function(){
		search();
	})
	//删除角色
    function delRole(userId){
		 dm.confirm("你确定要删除该系统角色吗？",{
				title:"确认",				//标题
				okName:"确定",			//如同confirm确定按钮的value
				cancleName:"取消",		//如同confirm取消按钮的value
				picClass:"d_perfect",
				callback:function(){	//按确定的执行的函数
					DMGold.ajax({"data":{'id':userId},"serialize":true,"url":"deleteSysRole.do","success":function(data){
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
    function popDiv(url){
  	   $.tbox.popup(url);
     }
    function search(){
    	DMGold.ajax({"formId":"form","serialize":true,"url":"sysRoleListAjax.do","success":function(data){
    		//清空表格数据
     		$("#grid").empty();
     		//填充数据
    		$('#gridTemp').tmpl(data).appendTo("#grid");
    		//初始化分页标签
    		//DMGold.PageTag.init({"divId":"pageTag","formId":"form","curPage":data.pageResult.pageIndex,"totalCount":data.pageResult.recordCount,
    			//          "pageCount":data.pageResult.pageTotal,"url":"frontLogAjax.do","toPageCallBack":pageTagCallBack});
    	}});
    }
</script>
</body>
</html>
