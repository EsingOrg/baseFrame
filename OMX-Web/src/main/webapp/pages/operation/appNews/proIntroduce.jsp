<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/include/common/popDivHeader.jsp" %>
<%@ include file="/WEB-INF/include/common/commHeader.jsp" %>
<title>产品介绍</title>
</head>
<body>
<div class="systemUser">				
			<div class="r_main clearfix ">
  	<!-- 搜索框 -->
			<form action="<%=basePath%>appNews/getProIntroduce.do" method="post" id="searchForm">
				<div class="main_con">
					<div class="admin_input clearfix">
						<p>
							标题： <input type="text" name="title" class="yhgl_input"
								value="" maxlength="50" />
						</p>
						<p class="lo_btn">
							<input type="submit" class="search" value="搜索" /> 
							<shiro:hasPermission name="YYGL_APPZX_APPCPJS_XZ"> 
							<a onclick="popDiv('<%=basePath %>operation/editorAppNews.do?id=0&&object=proIntroduce&&type=add')" href="javascript:void(0)"
								class="btn_cs ml10"><i class="newly"></i>新增
							</a>
							</shiro:hasPermission>
						</p>
					</div>
				</div>
	<!--搜索表框  --END-->
				<div class="main_con">
				 <table width="100%" border="0" cellspacing="0" cellpadding="3" class="main_table tc" id="allTable">
						<thead>
						<tr class="title">
							<td>序号</td>
						    <td>标题</td>
						    <td>图片</td>
						    <td>上架时间</td>
						    <td>下架时间</td>
							<td>创建人</td>
							<td>创建时间</td>
							<td>操作</td>
						</tr>
				        </thead>
					<tbody></tbody>
				</table>
				</div>
				<!--分页-->
				<div class='paging' style="margin-top: 25px;">
						<dim:page url="getProIntroduce.do" totalCount="${pageList.data.pageResult.recordCount }" formId="searchForm" showPages="${pageList.data.pageResult.pageSize }"
							curPage="${pageList.data.pageResult.pageIndex }" totalPages="${pageList.data.pageResult.pageTotal }" />
				</div>
				<!--分页  --END-->
				</form>
			</div>
		</div>

 </body>
   <c:if test="${errMsg ne '' && errMsg ne null}">
  <script type="text/javascript">
  dm.alert(decodeURIComponent('${errMsg}'));
  </script>
  </c:if>
 <!-- 映射模板 -->
<script id="allTemp" type="text/x-jquery-tmpl">
	{{each(i,user) list}}
      	<tr>
        <td>{{= i+1}}</td>  
	    <td>{{= user.title}}</td>
		<td><img src ="/platform/ReadPic/pic/url?url={{= user.picUrl}}"></td>
		<td>{{= user.startTime}}</td>
		<td>{{= user.endTime}}</td>
		<td>{{= user.realName}}</td>
		<td>{{= user.createTime}}</td>
		<td>
		   <a onclick="popDiv('<%=basePath %>operation/editorAppNews.do?id={{= user.id}}&&object=proIntroduce&&type=check&t=<%=Math.random() %>')" href="javascript:void(0)" class="orange">查看</a>
			<shiro:hasPermission name="YYGL_APPZX_APPCPJS_XG">
		   <a onclick="popDiv('<%=basePath %>operation/editorAppNews.do?id={{= user.id}}&&object=proIntroduce&&type=modify&t=<%=Math.random() %>')" href="javascript:void(0)" class="orange">修改</a>
			</shiro:hasPermission>
			<shiro:hasPermission name="YYGL_APPZX_APPCPJS_SC">
		   <a href="javascript:delNews({{= user.id}})" class="changeStatus orange">删除</a>
			</shiro:hasPermission>
        </td>
     </tr>
	{{/each}}
</script>
<script type="text/javascript">
	//页面加载时调用
	$(function()
	{
	    gridLoad();
	});
	var gridLoad = function(){
	    var data = ${pageList.data.pageResult.list};
	    $('#allTemp').tmpl({list:data}).appendTo("#allTable");
	};
</script>
 <script type="text/javascript">
    //弹出框
    function popDiv(url){
 	   $.tbox.popup(url);
    }
 	function openDivPwd(id,loginName){
 		loginNames = encodeURIComponent(encodeURIComponent(loginName));
 		popDiv('<%=basePath %>system/sysuser_modify_pwd.jsp?id='+id+'&ln='+loginNames+'&t=<%=Math.random() %>');
 	}
 	//删除文章
 	function delNews(id){
    		 dm.confirm("确定删除吗？",{
    				title:"确认",				//标题
    				okName:"确定",			//如同confirm确定按钮的value
    				cancleName:"取消",		//如同confirm取消按钮的value
    				callback:function(){	//按确定的执行的函数
    					location.href = "../operation/delAppNews.do?id="+id+"&&object=proIntroduce";
    				}
    			});
    }
</script>
</html>