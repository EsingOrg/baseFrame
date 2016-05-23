<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp" %>
<html>
  <head>
  <script type="text/javascript" src="<%=basePath%>js/date/WdatePicker.js"></script>
  <title>媒体报道</title>
  </head>
  <body>
  <div class="systemUser">				
			<div class="r_main clearfix ">
  	<!-- 搜索框 -->
			<form action="<%=basePath%>aboutUs/searchMediaReport.do" method="post" id = "form">
				<div class="main_con">
					<div class="admin_input clearfix">
						<p>
							标题： <input type="text" name="title" class="yhgl_input" 
								value="" maxlength="50" />
						</p>
						<p>
							时间： <input type="text" name="startTime"
								value="" class="yhgl_input date"
								class="Wdate" id="startDate"
								onclick="WdatePicker({readOnly:true,maxDate:'#F{$dp.$D(\'endDate\')}'})" />
							<span class="mr5">至</span> <input type="text" name="endTime"
								value="" class="yhgl_input date"
								class="Wdate" id="endDate"
								onclick="WdatePicker({readOnly:true,minDate:'#F{$dp.$D(\'startDate\')}'})" />
						</p>
						<p>
							创建人： <input type="text" name="createBy" class="yhgl_input"
								value="" maxlength="20" />
						</p>
						<p>
							是否发布： <select name="publishFlag" class="yhgl_sel">
								<option value="">全部</option>
								<option value="Y">是</option>
								<option value="N">否</option>
							</select>
						</p>
						<p class="lo_btn">
							<input type="button" onclick="search()" class="search" value="搜索" /> 
							<shiro:hasPermission name="YYGL_GYWM_MTBD_XZ">
							<a href="<%=basePath %>aboutUs/addMediaReport.do?id=0" class="btn_cs ml10"><i class="newly"></i>新增</a>
							</shiro:hasPermission>
						</p>
					</div>
				</div>
				</form>
	<!--搜索表框  --END-->
  
	
				<div class="main_con">
				 <table width="100%" border="0" cellspacing="0" cellpadding="3" class="main_table tc" >
						<thead>
						<tr class="title">
							<td>序号</td>
						    <td>标题</td>
						    <td>浏览次数</td>
						    <td>来源</td>
							<td>创建人</td>
							<td>创建时间</td>
							<td>状态</td>
							<td>操作</td>
						</tr>
				        </thead>
					<tbody id="grid"></tbody>
				</table>
				<!-- 分页 -->    
				<div id="pageTag">
				</div>
      			<!-- 分页END -->
				</div>
			</div>
		</div>
 </body>
  <c:if test="${errMsg ne '' && errMsg ne null}">
  <script type="text/javascript">
  dm.alert(decodeURIComponent('${errMsg}'));
  </script>
  </c:if>
  <!-- 系统用户显示模板 -->
	<script id="temp" type="text/x-jquery-tmpl">
	{{each(index) list}}
       <tr {{if index %2 == 0}}class="grey" {{/if}}>
		<td>{{= index+1+((pageIndex-1)*pageSize)}}</td>
	    	<td>{{= title}}</td>
			<td>{{= viewCount}}</td>
			<td>{{= source}}</td>
			<td>{{= loginName}}</td>
			<td>{{= createTime}}</td>
			<td>{{= publishFlag}}</td>
			<td>
		   	 <a href="<%=basePath %>aboutUs/checkMediaReport.do?id={{= id}}" class="changeStatus orange">查看</a>
			<shiro:hasPermission name="YYGL_GYWM_MTBD_XG">
		   	<a href="<%=basePath %>aboutUs/modifyMediaReport.do?id={{= id}}" class="changeStatus orange">修改</a>
			</shiro:hasPermission>
			<shiro:hasPermission name="YYGL_GYWM_MTBD_ZD">
		   	 <a href="javascript:topNews({{= id}})" class="changeStatus orange">置顶 </a>
			</shiro:hasPermission>
			<shiro:hasPermission name="YYGL_GYWM_MTBD_SC">
		  	 <a href="javascript:delNews({{= id}})" class="changeStatus orange">删除</a>
			</shiro:hasPermission>
        	</td>
     	</tr>
	{{/each}}
 </script>
 <script type="text/javascript">
   dmCheck.init("#publicForm");
    //页面加载时调用
    $(function(){
    	search();
    });
    /*
     	 查询
	*/
	function search(){
		DMGold.ajax({"formId":"form","serialize":true,"url":"getMediaReportAjax.do","success":pageTagCallBack});
	}
	/*
	    查询之后的回调函数
	*/
	function pageTagCallBack(data){
		//清空表格数据
		$("#grid").empty();
		//填充数据
		 $('#temp').tmpl(data.data.pageResult).appendTo("#grid");
		//初始化分页标签
		DMGold.PageTag.init({"divId":"pageTag","formId":"form","curPage":data.data.pageResult.pageIndex,"totalCount":data.data.pageResult.recordCount,
			          "pageCount":data.data.pageResult.pageTotal,"url":"getMediaReportAjax.do","toPageCallBack":pageTagCallBack});
	}
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
    					location.href = "delMediaReport.do?id="+id;
    				}
    			});
    };
 	//置顶文章
 	function topNews(id){
    		 dm.confirm("确定置顶吗？",{
    				title:"确认",				//标题
    				okName:"确定",			//如同confirm确定按钮的value
    				cancleName:"取消",		//如同confirm取消按钮的value
    				callback:function(){	//按确定的执行的函数
    					location.href = "topMediaReport.do?id="+id;
    				}
    			});
    };
 </script>
</html>
