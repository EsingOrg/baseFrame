<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
  <head>
  <%@ include file="/WEB-INF/include/common/commHeader.jsp" %>
  <title>广告图片</title>
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
			<form action="<%=basePath%>advertisement/searchAdvertisementPicture.do" method="post" id = "searchForm">
				<div class="main_con">
					<div class="admin_input clearfix">
						<p>
							广告标题： <input type="text" name="title" id="title" class="yhgl_input"
							value="${ms.title}" maxlength="50"  />
						</p>
						<p>
							广告类型： <select name="terminal" id="terminal" class="yhgl_sel"  >
								<option value="">全部</option>
								<option value="PC">PC</option>
								<option value="APP" >APP</option>
							</select>
						</p>
						<p class="lo_btn">
							<input type="submit" class="search" value="搜索" /> 
						</p>
					</div>
				</div>
	<!--搜索表框  --END-->
				<div class="main_con">
				 <table width="100%" border="0" cellspacing="0" cellpadding="3" class="main_table tc" id="sysUserListGrid">
						<thead>
						<tr class="title">
							<td>序号</td>
						    <td>广告标题</td>
						    <td>广告类型</td>
						    <td>广告图片</td>
						    <td>上架时间</td>
							<td>下架时间</td>
							<td>创建人</td>
							<td>创建时间</td>
							<td>操作</td>
						</tr>
				        </thead>
					<tbody></tbody>
				</table>
				<!--分页-->
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
		<td>{{= user.terminal}}</td>
		<td><img src ="/platform/ReadPic/pic/url?url={{= user.picUrl}}"></td>
		<td>{{= user.startTime}}</td>
		<td>{{= user.endTime}}</td>
		<td>{{= user.realName}}</td>
		<td>{{= user.createTime}}</td>
		<td>
		   <a onclick="popDiv('<%=basePath %>advertisement/checkAdvertisementPicture.do?id={{= user.id}}&t=<%=Math.random() %>')" href="javascript:void(0)" class="orange">查看</a>
			<shiro:hasPermission name="YYGL_GG_GGTP_XG">
		   <a onclick="popDiv('<%=basePath %>advertisement/modifyAdvertisementPicture.do?id={{= user.id}}&t=<%=Math.random() %>')" href="javascript:void(0)" class="orange">修改</a>
			</shiro:hasPermission>
			<shiro:hasPermission name="YYGL_GG_GGTP_ZD">
		   <a href="javascript:topAdvertisementPicture({{= user.id}})" class="changeStatus orange"> 置顶 </a>
			</shiro:hasPermission>
        </td>
     </tr>
{{/each}}
	</script>
    <script type="text/javascript">
        //页面加载时调用
        $(function(){
    	  sysUserListLoad();//jquery 模板demo
    	  $("#terminal option[value='${ms.terminal}']").attr("selected", true); 
        });
        var sysUserListLoad = function(){
       	 var data = ${pageList.data.pageResult.list};
       	 $('#sysUserListTemplate').tmpl({users:data}).appendTo("#sysUserListGrid");
     };
    
    </script>
  <script type="text/javascript">
 
    //弹出框
    function popDiv(url){
 	   $.tbox.popup(url);
    };
 	function openDivPwd(id,loginName){
 		loginNames = encodeURIComponent(encodeURIComponent(loginName));
 		popDiv('<%=basePath %>system/sysuser_modify_pwd.jsp?id='+id+'&ln='+loginNames+'&t=<%=Math.random() %>');
 	};
 	//删除广告
 	function delAdvertisementPicture(id){
    		 dm.confirm("确定删除吗？",{
    				title:"确认",				//标题
    				okName:"确定",			//如同confirm确定按钮的valueH150922000003
    				cancleName:"取消",		//如同confirm取消按钮的value
    				callback:function(){	//按确定的执行的函数
    					location.href = "delAdvertisementPicture.do?id="+id;
    				}
    			});
    }
 	//置顶广告
 	function topAdvertisementPicture(id){
    		 dm.confirm("确定置顶吗？",{
    				title:"确认",				//标题
    				okName:"确定",			//如同confirm确定按钮的value
    				cancleName:"取消",		//如同confirm取消按钮的value
    				callback:function(){	//按确定的执行的函数
    					location.href = "topAdvertisementPicture.do?id="+id;
    				}
    			});
    };
 </script>
</html>
