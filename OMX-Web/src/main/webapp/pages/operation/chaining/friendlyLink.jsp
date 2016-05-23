<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
  <head>
  <%@ include file="/WEB-INF/include/common/commHeader.jsp" %>
  <script type="text/javascript" src="<%=basePath %>/js/common/formValidate.js"></script>
  <title>友情链接</title>
  </head>
  <body>
  <c:if test="${errMsg ne '' && errMsg ne null}">
  <script type="text/javascript">
  dm.alert(decodeURIComponent('${errMsg}'));
  </script>
  </c:if>
	<div class="systemUser">				
			<div class="r_main clearfix ">
			<!-- 搜索框 -->
			<form action="<%=basePath%>chaining/searchFriendlyLink.do" method="post" id = "searchForm">
				<div class="main_con">
					<div class="admin_input clearfix">
						<p>
							名称： <input type="text" name="title" class="yhgl_input" id="title" maxlength="20" value="${findConfigLinkReq.title}" />
						</p>
						<p>
							创建人： <input type="text" name="createBy" class="yhgl_input" id="createBy" maxlength="20" value="${findConfigLinkReq.createBy}" />
						</p>
						<p>
							时间： <input type="text" name="startTime"
								class="yhgl_input date"
								class="Wdate" id="startTime"
								onclick="WdatePicker({readOnly:true,maxDate:'#F{$dp.$D(\'endTime\')}'})"   value='${findConfigLinkReq.startTime}'/>
							<span class="mr5">至</span> <input type="text" name="endTime"
								class="yhgl_input date"
								class="Wdate" id="endTime"
								onclick="WdatePicker({readOnly:true,minDate:'#F{$dp.$D(\'startTime\')}'})"  value='${findConfigLinkReq.endTime}' />
						</p>
						<p class="lo_btn">
							<input type="submit" class="search" value="搜索" /> 
							<shiro:hasPermission name="YYGL_LJ_YQLJ_XZ">
							<a onclick="popDiv('<%=basePath %>chaining/addFriendlyLink.do')" class="btn_cs ml10"><i class="newly"></i>新增</a>
							</shiro:hasPermission>
						</p>
					</div>
				</div>
	<!--搜索表框  --END-->
				<div class="main_con">
				 <table width="100%" border="0" cellspacing="0" cellpadding="3" class="main_table tc" id="sysUserListGrid">
						<thead>
						<tr class="title">
							<td>序号</td>
						    <td>名称</td>
						    <td>链接</td>
						    <td>创建人</td>
							<td>创建时间</td>
							<td>操作</td>
						</tr>
				        </thead>
					<tbody></tbody>
				</table>
				<!--分页-->
				<div class='paging' style="margin-top: 25px;">
						<dim:page url="searchFriendlyLink.do" totalCount="${pageList.data.pageResult.recordCount }" formId="searchForm" showPages="${pageList.data.pageResult.pageSize }"
							curPage="${pageList.data.pageResult.pageIndex }" totalPages="${pageList.data.pageResult.pageTotal }" />
				</div>
				<!--分页  --END-->
				</div>
				</form>
			</div>
		</div>

 </body>
   <!-- 系统用户显示模板 -->
	<script id="sysUserListTemplate" type="text/x-jquery-tmpl">
{{each(i,user) users}}
      <tr>
        <td>{{= i+1}}</td>  
	    <td>{{= user.title}}</td>
		<td>{{= user.url}}</td>
		<td>{{= user.realName}}</td>
		<td>{{= user.createTime}}</td>
		<td>
           <a onclick="popDiv('<%=basePath %>chaining/checkFriendlyLink.do?id={{= user.id}}&t=<%=Math.random() %>')" href="javascript:void(0)" class="changeStatus orange">查看</a>
			<shiro:hasPermission name="YYGL_LJ_YQLJ_XG">
		   <a onclick="popDiv('<%=basePath %>chaining/modifyFriendlyLink.do?id={{= user.id}}&t=<%=Math.random() %>')" href="javascript:void(0)" class="changeStatus orange">修改</a>
			</shiro:hasPermission>
			<shiro:hasPermission name="YYGL_LJ_YQLJ_ZD">
		   <a href="javascript:topFriendlyLink({{= user.id}})" class="changeStatus orange"> 置顶 </a>
			</shiro:hasPermission>
			<shiro:hasPermission name="YYGL_LJ_YQLJ_SC"> 
		   <a href="javascript:delFriendlyLink({{= user.id}})" class="changeStatus orange"> 删除</a>
			</shiro:hasPermission>
        </td>
     </tr>
{{/each}}
	</script>
    <script type="text/javascript">
        //页面加载时调用
        $(function(){
    	  sysUserListLoad();//jquery 模板demo
        });
        var sysUserListLoad = function(){
       	 var data = ${pageList.data.pageResult.list};
       	 $('#sysUserListTemplate').tmpl({users:data}).appendTo("#sysUserListGrid");
     };
    
 
    //弹出框
    function popDiv(url){
 	   $.tbox.popup(url);
    }
 	//删除广告
 	function delFriendlyLink(id){
    		 dm.confirm("确定删除吗？",{
    				title:"确认",				//标题
    				okName:"确定",			//如同confirm确定按钮的value
    				cancleName:"取消",		//如同confirm取消按钮的value
    				callback:function(){	//按确定的执行的函数
    					location.href = "delFriendlyLink.do?id="+id;
    				}
    			});
    };
 	//置顶广告
 	function topFriendlyLink(id){
    		 dm.confirm("确定置顶吗？",{
    				title:"确认",				//标题
    				okName:"确定",			//如同confirm确定按钮的value
    				cancleName:"取消",		//如同confirm取消按钮的value
    				callback:function(){	//按确定的执行的函数
    					location.href = "topFriendlyLink.do?id="+id;
    				}
    			});
    };
 </script>
</html>
