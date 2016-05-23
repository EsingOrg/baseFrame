<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp" %>
<html>
 <head>
  <script type="text/javascript" src="<%=basePath%>js/date/WdatePicker.js"></script>
  <title>系统用户列表</title>
 </head>
 <body>
	<div >				
			<div class="r_main clearfix ">
			     <!--搜索表框  -->
			      <form id="form">
	          <div class="main_border clearfix">
	          <div class="admin_input clearfix">
	          <p>
	                                        功能点名称：
	                 <input type="text" name="moduleName" class="yhgl_input"  maxlength="20"/>
	           </p>
	           <p>
	                                        字段名称：
	                 <input type="text" name="desc" class="yhgl_input"  maxlength="20"/>
	           </p>
	           <p>
	                                        操作人：
	                 <input type="text" name="username" class="yhgl_input" maxlength="20"/>
	           </p>
				<p>修改时间：<input type="text" name="beginTime"
								 class="yhgl_input date"
								class="Wdate" id="startDate"
								onclick="WdatePicker({readOnly:true,maxDate:'#F{$dp.$D(\'endDate\')}'})" />
							<span class="mr5">至</span> <input type="text" name="endTime"
								 class="yhgl_input date"
								class="Wdate" id="endDate"
								onclick="WdatePicker({readOnly:true,minDate:'#F{$dp.$D(\'startDate\')}'})" />
					</p>
	              <p class="lo_btn">
	              <input type="button" class="search" onclick="search();" value="搜索" /> 
	            </div>
	            </div> 
	            </form>
          <!--搜索表框  --END-->  
				<div class="main_con">
				 <table   width="100%" border="0" cellspacing="0" cellpadding="3" class="main_table tc" >
						<thead>
						<tr class="title">
							<td>序号</td>
						    <td>功能名</td>
						    <td>字段描述</td>
							<td>修改前</td>
							<td>修改后</td>
							<td>操作人</td>
							<td>修改时间</td>
						</tr>
				        </thead>
					<tbody id="logListGrid"></tbody>
				</table>
				<div id="pageTag"></div>
				</div>
			</div>
			<div class="pager"></div>
		</div>
 </body>
 <!-- 日志列表模板 -->
	<script id="logListTemplate" type="text/x-jquery-tmpl">
	{{each(index) list}}
       <tr {{if index %2 == 0}}class="grey" {{/if}}>
        <td>{{= index+1+((pageIndex-1)*pageSize)}}</td> 
	    <td>{{= moduleName}}</td>
	    <td>{{= desc}}</td>
        <td limit=30>{{= beforeValue}}</td>
        <td limit=30>{{= updateValue}}</td>
		<td>{{= createBy}}</td>
		<td>{{= createTime}}</td> 
       </tr>
    {{/each}}
	</script>
    <script type="text/javascript">
        //页面加载时调用
        $(function(){
        	search();
        });
        function search(){
        	DMGold.ajax({"formId":"form","serialize":true,"url":"sysSettingLogAjax.do","success":pageTagCallBack});
        		}

      //分页跳转回调
   	  function pageTagCallBack(data){
   		//清空表格数据
   		$("#logListGrid").empty();
   		//填充数据
  		 $('#logListTemplate').tmpl(data.pageResult).appendTo("#logListGrid");
  		//初始化分页标签
  		DMGold.PageTag.init({"divId":"pageTag","formId":"form","curPage":data.pageResult.pageIndex,"totalCount":data.pageResult.recordCount,
	          "pageCount":data.pageResult.pageTotal,"url":"sysSettingLogAjax.do","toPageCallBack":pageTagCallBack});
  		DMGold.limit();
   	  }
 </script>
</html>
