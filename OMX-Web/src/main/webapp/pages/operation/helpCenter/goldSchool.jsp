<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp" %>
<html>
  <head>
  <title>黄金学堂</title>
  
  </head>
  <body>
  <div class="systemUser">			
			<div class="r_main clearfix ">
  			<!-- 搜索框 -->
			<form action="<%=basePath%>helpCenter/searchGoldSchoolNews.do" method="post" id = "dataForm">
				<div class="main_con">
					<div class="admin_input clearfix">
						<p>
							标题： <input type="text" name="title" class="yhgl_input"
								value="${ms.title}" maxlength="20" />
						</p>
						<p>
							时间： <input type="text" name="startTime"
								value="${ms.startTime}" class="yhgl_input date"
								class="Wdate" id="startDate"
								onclick="WdatePicker({readOnly:true,maxDate:'#F{$dp.$D(\'endDate\')}'})" />
							<span class="mr5">至</span> <input type="text" name="endTime"
								value="${ms.endTime}" class="yhgl_input date"
								class="Wdate" id="endDate"
								onclick="WdatePicker({readOnly:true,minDate:'#F{$dp.$D(\'startDate\')}'})" />
						</p>
						<p>
							创建人： <input type="text" name="createBy" class="yhgl_input"
								value="${ms.createBy}"  maxlength="20" />
						</p>
						<p>
							是否发布： <select id = "publishFlag"  name="publishFlag" class="yhgl_sel">
								<option value="">全部</option>
								<option value="Y">是</option>
								<option value="N">否</option>
							</select>
						</p>
						<p class="lo_btn">
							<input type="submit" class="search" value="搜索" /> 
							<shiro:hasPermission name="YYGL_AQBZ_HJXT_SZ">
							<!--  <input name="input" type="button" class="export ml10" value="设置" />-->
							</shiro:hasPermission>
							<shiro:hasPermission name="YYGL_AQBZ_HJXT_XZ">
							<a href="<%=basePath %>helpCenter/addGoldSchoolNews.do?id=0" class="btn_cs ml10"><i class="newly"></i>新增</a>
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
						    <td>标题</td>
						    <td>浏览次数</td>
						    <td>来源</td>
							<td>创建人</td>
							<td>创建时间</td>
							<td>状态</td>
							<td>操作</td>
						</tr>
				        </thead>
					<tbody></tbody>
				</table>
				<!-- 分页 -->    
				<div class='paging' style="margin-top: 25px;">
						<dim:page url="searchGoldSchoolNews.do" totalCount="${pageList.data.pageResult.recordCount }" formId="dataForm" showPages="${pageList.data.pageResult.pageSize }"
							curPage="${pageList.data.pageResult.pageIndex }" totalPages="${pageList.data.pageResult.pageTotal }" />
				</div>
      			<!-- 分页END -->  
				</div>
				</form>
				
			</div>
		</div>
 </body>
  <c:if test="${errMsg ne '' && errMsg ne null}">
  <script type="text/javascript">
  dm.alert(decodeURIComponent('${errMsg}'));
  </script>
  </c:if>
   <!-- 系统用户显示模板 -->
	<script id="sysUserListTemplate" type="text/x-jquery-tmpl">
	{{each(i,user) users}}
      <tr>
        <td>{{= i+1}}</td>  
	    <td>{{= user.title}}</td>
		<td>{{= user.viewCount}}</td>
		<td>{{= user.source}}</td>
		<td>{{= user.loginName}}</td>
		<td>{{= user.createTime}}</td>
		<td>{{= user.publishFlag}}</td>
		<td>
		   <a href="<%=basePath %>helpCenter/checkGoldSchoolNews.do?id={{= user.id}}" class="changeStatus orange">查看</a>
			<shiro:hasPermission name="YYGL_AQBZ_HJXT_XG">
		   <a href="<%=basePath %>helpCenter/modifyGoldSchoolNews.do?id={{= user.id}}" class="changeStatus orange">修改</a>
			</shiro:hasPermission>
			<shiro:hasPermission name="YYGL_AQBZ_HJXT_ZD">
		   <a href="javascript:topNews('{{= user.id}}')" class="changeStatus orange"> 置顶 </a>
			</shiro:hasPermission>
			<shiro:hasPermission name="YYGL_AQBZ_HJXT_SC">
		   <a href="javascript:delNews('{{= user.id}}')" class="changeStatus orange">删除</a>
			</shiro:hasPermission>
        </td>
     </tr>
	{{/each}}
	</script>
    <script type="text/javascript">
        //页面加载时调用
        $(function(){
    	  sysUserListLoad();//jquery 模板demo
    	  $("#publishFlag option[value='${ms.publishFlag}']").attr("selected", true);
        });
        var sysUserListLoad = function(){
        	//造的测试数据，实际应用时，将ajax返回的json数据替换这里的data即可
       	 var data = ${pageList.data.pageResult.list};
       	 
       	 $('#sysUserListTemplate').tmpl({users:data}).appendTo("#sysUserListGrid");
     };
    
    function popDiv(url){
 	   $.tbox.popup(url);
    }
 	//删除文章
 	function delNews(id){
    		 dm.confirm("确定删除吗？",{
    				title:"确认",				//标题
    				okName:"确定",			//如同confirm确定按钮的value
    				cancleName:"取消",		//如同confirm取消按钮的value
    				callback:function(){	//按确定的执行的函数
    					location.href = "delGoldSchoolNews.do?id="+id;
    				}
    			});
    }
 	//置顶文章
 	function topNews(id){
    		 dm.confirm("确定置顶吗？",{
    				title:"确认",				//标题
    				okName:"确定",			//如同confirm确定按钮的value
    				cancleName:"取消",		//如同confirm取消按钮的value
    				callback:function(){	//按确定的执行的函数
    					location.href = "topGoldSchoolNews.do?id="+id;
    				}
    			});
    }
 </script>
</html>
