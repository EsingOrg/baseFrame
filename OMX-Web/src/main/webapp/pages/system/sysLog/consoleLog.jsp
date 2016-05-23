<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp" %>
<html>
  <head>
  <script type="text/javascript" src="<%=basePath%>js/date/WdatePicker.js"></script>
  <title>后台日志</title>
  </head>
  <body>
  <form id="form" >
	<div >				
			<div class="r_main clearfix ">
			     <!--搜索表框  -->
	          <div class="main_border clearfix">
	          <div class="admin_input clearfix">
	          <p>
	                                        用户名：
	                 <input type="text" name="name" class="yhgl_input" maxlength="20"/>
	           </p>
	            <p>
	                                        用户组：
	             <form:select path="sysLogReq.userGrop" cssClass="yhgl_sel" >
		                     <option value="" >全部</option>  
	                         <form:options items="${roleList}"/> 
		          </form:select>
	           </p>
	           <p>
	                                        操作类型：
	             <dim:select name="operatype" enumType="OperationLogType" headName="全部" headValue=""  cssClass="yhgl_sel"></dim:select>
	           </p>
				<p>创建时间：<input type="text" name="beginTime"
								 class="yhgl_input date"
								class="Wdate" id="startDate"
								onclick="WdatePicker({readOnly:true,maxDate:'#F{$dp.$D(\'endDate\')}'})" />
							<span class="mr5">至</span> <input type="text" name="endTime"
								class="yhgl_input date"
								class="Wdate" id="endTime"
								onclick="WdatePicker({readOnly:true,minDate:'#F{$dp.$D(\'startDate\')}'})" />
					</p>
	              <p class="lo_btn">
	              <input type="button" class="search" onclick="search();" value="搜索" /> 
	              <shiro:hasPermission name="XTGL_XTRZ_HTRZ_DC">
	               <input name="input" type="button" class="export ml10" value="导出" onclick="exportData('form','exportConsoleLog.do');"/>
	               </shiro:hasPermission>
	            </div>
	            </div> 
          <!--搜索表框  --END-->  
				<div class="main_con">
				 <table   width="100%" border="0" cellspacing="0" cellpadding="3" class="main_table tc">
						<thead>
						<tr class="title">
							<td>序号</td>
						    <td>用户名</td>
						    <td>用户组</td>
							<td>操作时间</td>
							<td>登录IP</td>
						    <td>操作类型</td>
							<td>操作内容</td>
						</tr>
				        </thead>
					<tbody id="Grid"></tbody>
				</table>
				<br>
				<div id="pageTag"></div>  
				</div>
			</div>
			<div class="pager"></div>
		</div>
</form>
 </body>
  <!-- 后台日志list模板 -->
	<script id="Template" type="text/x-jquery-tmpl">
	{{each(index) list}}
       <tr {{if index %2 == 0}}class="grey" {{/if}}>
        <td>{{= index+1+((pageIndex-1)*pageSize)}}</td>
	    <td>{{= loginName}}</td>
        <td>{{= userGrop}}</td>
        <td>{{= createTime}}</td>
        <td>{{= loginIp}}</td> 
		<td>{{= typeName}}</td> 
		<td>{{= desc}}</td> 
       </tr>
     {{/each}}
	</script>
    <script type="text/javascript">
       //页面加载时调用
        $(function(){
    	 search()
        });
        function search(){
        	DMGold.ajax({"formId":"form","serialize":true,"url":"consoleLogAjax.do","success":pageTagCallBack});
        		}

        //分页跳转回调
     	function pageTagCallBack(data){
     		//清空表格数据
     		$("#Grid").empty();
     		//填充数据
    		 $('#Template').tmpl(data.pageResult).appendTo("#Grid");
    		//初始化分页标签
    		DMGold.PageTag.init({"divId":"pageTag","formId":"form","curPage":data.pageResult.pageIndex,"totalCount":data.pageResult.recordCount,
    			          "pageCount":data.pageResult.pageTotal,"url":"consoleLogAjax.do","toPageCallBack":pageTagCallBack});
     	}
 </script>
</html>
