<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp" %>
<html>
  <head>
  <script type="text/javascript" src="<%=basePath%>js/date/WdatePicker.js"></script>
  <title>APP版本管理</title>
  </head>
  <body>
   <form id="form">
	<div class="systemUser">				
			<div class="r_main clearfix ">
			  <!--搜索表框  -->
	          <div class="main_border clearfix">
	          <div class="admin_input clearfix">
	          <p>
	                                        版本号：
	                 <input type="text" name="no" class="yhgl_input" value="${pars.no }" maxlength="20"/>
	           </p>
	              <p class="lo_btn">
		              <input type="button" onclick='search();' class="search" value="搜索" />
		              <shiro:hasPermission name="XTGL_APPBBGL_APPBBGL_XZ">
		              <a onclick="popDiv('appVersionMgtEdit.do?t=<%=Math.random() %>&operationType=0')" href="javascript:void(0)" class="btn_cs ml10">
		               <i class="newly"></i>新增
		              </a>
		              </shiro:hasPermission>
	              </p>
	            </div>
	          </div> 
             <!--搜索表框  --END-->  
				<div class="main_con">
				 <table   width="100%" border="0" cellspacing="0" cellpadding="3" class="main_table tc" >
						<thead>
						<tr class="title">
							<td>序号</td>
						    <td>客户端类型</td>
						    <td>版本号</td>
						    <td>版本名称</td>
							<td>是否强制升级</td>
							<td>是否启用</td>
							<td>发布人</td>
						    <td>发布时间</td>
						    <td>操作</td>
						</tr>
				        </thead>
					<tbody id="appGrid"></tbody>
				</table>
				<div id="pageTag"></div>
				</div>
			</div>
			<div class="pager"></div>
		</div>
  </form>
 </body>
  <c:if test="${errMsg ne null}">
  <script type="text/javascript">
  dm.alert(decodeURIComponent('${errMsg}'));
  </script>
  </c:if>
  <!-- 系统用户显示模板 -->
	<script id="appTemplate" type="text/x-jquery-tmpl">
     {{each(index) list}}
       <tr {{if index %2 == 0}}class="grey" {{/if}}>
        <td>{{= index+1}}</td> 
	    <td>{{= type}}</td>
	    <td>{{= no}}</td>
        <td>{{= versionName}}</td>
        <td>{{= updateFlag=='Y'?'是':'否'}}</td> 
        <td>{{= userFlag=='Y'?'是':'否'}}</td> 
	    <td>{{= publisher}}</td>
	    <td>{{= publishTime}}</td>
        <td>
            <a onclick="popDiv('appVersionMgtEdit.do?operationType=1&id={{= id}}&t=<%=Math.random() %>')" href="javascript:void(0)" class="orange">查看</a>
			<shiro:hasPermission name="XTGL_APPBBGL_APPBBGL_XG">
            <a onclick="popDiv('appVersionMgtEdit.do?operationType=0&id={{= id}}&t=<%=Math.random() %>')" href="javascript:void(0)" class="orange">修改</a>
			</shiro:hasPermission>
			<shiro:hasPermission name="XTGL_APPBBGL_APPBBGL_SC">
            <a  href="javascript:del({{= id}})" class="changeStatus orange">删除</a>
			</shiro:hasPermission>
        </td>	
       </tr>
     {{/each}}
	</script>
    <script type="text/javascript">
        //页面加载时调用
        $(function(){
    	  search();
        });
        //加载表格数据
        function search(){
       	//初始化分页标签
        	DMGold.ajax({"formId":"form","serialize":true,"url":"appVersionMgtListAjax.do","success":pageTagCallBack});
    					  
        };
		  
      //分页跳转回调
       	function pageTagCallBack(data){
       		//清空表格数据
       		$("#appGrid").empty();
       		//填充数据
      		 $('#appTemplate').tmpl(data.pageResult).appendTo("#appGrid");
      		//初始化分页标签
      		DMGold.PageTag.init({"divId":"pageTag","formId":"form","curPage":data.pageResult.pageIndex,"totalCount":data.pageResult.recordCount,
      			          "pageCount":data.pageResult.pageTotal,"url":"appVersionMgtListAjax.do","toPageCallBack":pageTagCallBack});
       	}
      	
	    //弹出框
	    function popDiv(url){
	 	   $.tbox.popup(url);
	    };
	    //删除
		function del(userId){
	  		 dm.confirm("确定删除吗？",{
	  				title:"确认",				//标题
	  				okName:"确定",			//如同confirm确定按钮的value
	  				cancleName:"取消",		//如同confirm取消按钮的value
				     picClass:"d_perfect",
			         callback:function(){
			        	 //按确定的执行的函数		
			        	 DMGold.ajax({"data":{'id':userId},"serialize":true,"url":"delete.do","success":function(data){
							//显示提示信息
							if("000000"==data.code){
								dm.alert(data.description,{"picClass":"d_succeed"});
							}else{
								dm.alert(data.description,{"picClass":"d_error"});
							}
							//刷新用户列表
							search();
						}});
					}
				});
}

 </script>
</html>
