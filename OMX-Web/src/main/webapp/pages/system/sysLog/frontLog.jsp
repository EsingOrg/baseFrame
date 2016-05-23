<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp" %>
<html>
  <head>
  <script type="text/javascript" src="<%=basePath%>js/date/WdatePicker.js"></script>
  <title>前台日志</title>
  </head>
  <body>
	<div class="systemUser">				
			<div class="r_main clearfix ">
			 <!--搜索表框  -->
			  <form id="form">
	          <div class="main_border clearfix">
	          <div class="admin_input clearfix">
	          <p>
	                                        用户名：
	                 <input type="text" name="name" class="yhgl_input" value="${logPars.name}" maxlength="20"/>
	           </p>
	            <p>
	                                        用户类型状态：
	              <dim:select name="usertype" enumType="UserType" headName="全部" headValue="" value="${logPars.usertype}"  cssClass="yhgl_sel"></dim:select>
	           </p>
				<p>登录时间：<input type="text" name="beginTime"
								value="${logPars.beginTime}" class="yhgl_input date"
								class="Wdate" id="startDate"
								onclick="WdatePicker({readOnly:true,maxDate:'#F{$dp.$D(\'endDate\')}'})" />
							<span class="mr5">至</span> <input type="text" name="endTime"
								value="${logPars.endTime}" class="yhgl_input date"
								class="Wdate" id="endDate"
								onclick="WdatePicker({readOnly:true,minDate:'#F{$dp.$D(\'startDate\')}'})" />
					</p>
	              <p class="lo_btn">
	              <input type="button" class="search" onclick="search()" value="搜索" /> 
	              <shiro:hasPermission name="XTGL_XTRZ_QTRZ_DC">
	               <input name="input" type="button" class="export ml10" value="导出" onclick="exportData('form','exportFrontLog.do');"/>
	               </shiro:hasPermission>
	            </div>
	            </div> 
	             </form>
          <!--搜索表框  --END-->  
				<div class="main_con">
				 <table   width="100%" border="0" cellspacing="0" cellpadding="3" class="main_table tc" >
						<thead>
						<tr class="title">
							<td>序号</td>
						    <td>用户名</td>
						    <td>用户类型</td>
							<td>时间</td>
							<td>登录IP</td>
						</tr>
				        </thead>
					<tbody id="grid"></tbody>
				</table>
				<div id="pageTag"></div>
				</div>
			</div>
			<div class="pager"></div>
		</div>
 </body>
<!-- 前台日志list模板 -->
<script id="template" type="text/x-jquery-tmpl">
	{{each(index) list}}
       <tr {{if index %2 == 0}}class="grey" {{/if}}>
		<td>{{= index+1+((pageIndex-1)*pageSize)}}</td>
	    <td>{{= loginName}}</td>
	    <td>{{= userTypeName}}</td>
        <td>{{= createTime}}</td>
        <td>{{= loginIp}}</td> 
       </tr>
     {{/each}}
	</script>
<script type="text/javascript">
    //页面加载时调用
  $(function(){
	 search();
    });
  function search(){
	  DMGold.ajax({"formId":"form","serialize":true,"url":"frontLogAjax.do","success":pageTagCallBack});
  }
	//分页跳转回调
 	function pageTagCallBack(data){
 		//清空表格数据
 		$("#grid").empty();
 		//填充数据
		 $('#template').tmpl(data.pageResult).appendTo("#grid");
		//初始化分页标签
		DMGold.PageTag.init({"divId":"pageTag","formId":"form","curPage":data.pageResult.pageIndex,"totalCount":data.pageResult.recordCount,
			          "pageCount":data.pageResult.pageTotal,"url":"frontLogAjax.do","toPageCallBack":pageTagCallBack});
 	}		  
		
 </script>
</html>
