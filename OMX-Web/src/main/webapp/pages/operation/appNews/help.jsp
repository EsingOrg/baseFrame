<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/include/common/commHeader.jsp" %>
<title>新手攻略</title>
</head>
<body>
	<div class="systemUser">				
			<div class="r_main clearfix ">
  	<!-- 搜索框 -->
			<form action="<%=basePath%>appNews/getHelp.do" method="post" id="form">
				<div class="main_con">
					<div class="admin_input clearfix">
						<p>
							标题： <input type="text" name="title" class="yhgl_input"
								value="" maxlength="50" />
						</p>
						<p class="lo_btn">
							<input type="button" onclick="search()" class="search" value="搜索" /> 
							<shiro:hasPermission name="YYGL_APPZX_XSGL_XZ">
							<a onclick="popDiv('<%=basePath %>operation/editorAppNews.do?id=0&&object=help&&type=add')" href="javascript:void(0)" class="btn_cs ml10">
							<i class="newly"></i>新增
							</a>
							</shiro:hasPermission>
						</p>
					</div>
				</div>
	<!--搜索表框  --END-->
  </form>
	
				<div class="main_con">
				 <table width="100%" border="0" cellspacing="0" cellpadding="3" class="main_table tc" >
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
					<tbody id="grid"></tbody>
				</table>
				</div>
				<!--分页-->
				<div id="pageTag">
				</div>
				<!--分页  --END-->
				
			</div>
		</div>

 </body>
<c:if test="${errMsg ne null && errMsg ne ''}">
<script type="text/javascript">
  dm.alert(decodeURIComponent('${errMsg}'));
</script>
</c:if>
 <!-- 映射模板 -->
<script id="template" type="text/x-jquery-tmpl">
	{{each(index) list}}
       <tr {{if index %2 == 0}}class="grey" {{/if}}>
		<td>{{= index+1+((pageIndex-1)*pageSize)}}</td>
	    <td>{{= title}}</td>
		<td><img src ="/platform/ReadPic/pic/url?url={{= picUrl}}"></td>
		<td>{{= startTime}}</td>
		<td>{{= endTime}}</td>
		<td>{{= realName}}</td>
		<td>{{= createTime}}</td>
		<td>
		   <a onclick="popDiv('<%=basePath %>operation/editorAppNews.do?id={{= id}}&&object=help&&type=check&t=<%=Math.random() %>')" href="javascript:void(0)" class="orange">查看</a>
			<shiro:hasPermission name="YYGL_APPZX_XSGL_XG">
		   <a onclick="popDiv('<%=basePath %>operation/editorAppNews.do?id={{= id}}&&object=help&&type=modify&t=<%=Math.random() %>')" href="javascript:void(0)" class="orange">修改</a>
			</shiro:hasPermission>
			<shiro:hasPermission name="YYGL_APPZX_XSGL_SC">
		   <a href="javascript:delNews({{= id}})" class="changeStatus orange">删除</a>
			</shiro:hasPermission>
        </td>
     </tr>
	{{/each}}
</script>
<script type="text/javascript">
	//页面加载时调用
	$(function()
	{
	   search();
	});
	/**
	查询
	*/
	function search(){
		DMGold.ajax({"formId":"form","serialize":true,"url":"getHelpAjax.do","success":pageTagCallBack});
	}
	/**
	查询回调
	*/
 	function pageTagCallBack(data){
 		//清空表格数据
 		$("#grid").empty();
 		//填充数据
		 $('#template').tmpl(data.data.pageResult).appendTo("#grid");
		//初始化分页标签
		DMGold.PageTag.init({"divId":"pageTag","formId":"form","curPage":data.data.pageResult.pageIndex,"totalCount":data.data.pageResult.recordCount,
			          "pageCount":data.data.pageResult.pageTotal,"url":"getHelpAjax.do","toPageCallBack":pageTagCallBack});
 	}
    //弹出框
    function popDiv(url){
 	   $.tbox.popup(url);
    };
 	//删除文章
 	function delNews(id){
    		 dm.confirm("确定删除吗？",{
    				title:"确认",				//标题
    				okName:"确定",			//如同confirm确定按钮的value
    				cancleName:"取消",		//如同confirm取消按钮的value
    				callback:function(){	//按确定的执行的函数
    					location.href = "../operation/delAppNews.do?id="+id+"&&object=help";
    				}
    			});
    }
</script>
</html>