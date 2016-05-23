<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
  <%@ include file="/WEB-INF/include/common/commHeader.jsp" %>
  <title>合作店铺</title>
  </head>
  <body>
	<div class="systemUser">				
			<div class="r_main clearfix ">
			<!-- 搜索框 -->
			<form id="searchForm" action="<%=basePath%>aboutUs/searchMyPartner.do" method="post" >
				<div class="main_con">
					<div class="admin_input clearfix">
						<p>
							名称： <input type="text" name="title" class="yhgl_input" id="title" maxlength="50" />
						</p>
						<p>
							创建人： <input type="text" name="createBy" class="yhgl_input" id="createBy" maxlength="20" />
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
						<p class="lo_btn">
							<input type="button" onclick="search();" class="search" value="搜索" /> 
							<shiro:hasPermission name="YYGL_GYWM_HZDP_XZ">
							<a onclick="popDiv('<%=basePath %>aboutUs/addMyPartner.do')" href="javascript:void(0)"class="btn_cs ml10"><i class="newly"></i>新增</a>
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
						    <td>名称</td>
						    <td>封面图</td>
						    <td>链接</td>
						    <td>创建人</td>
							<td>创建时间</td>
							<td>操作</td>
						</tr>
				        </thead>
					<tbody id="grid"></tbody>
				</table>
				<!--分页-->
				<div id="pageTag"></div>
				<!--分页  --END-->
				</div>
			</div>
		</div>

 </body>
 <!-- 系统用户显示模板 -->
	<script id="temp" type="text/x-jquery-tmpl">
{{each(index) list}}
       <tr {{if index %2 == 0}}class="grey" {{/if}}>
		<td>{{= index+1+((pageIndex-1)*pageSize)}}</td>
	    <td>{{= title}}</td>
		<td><img src ="/platform/ReadPic/pic/url?url={{= picUrl}}"></td>
		<td>{{= url}}</td>
		<td>{{= realName}}</td>
		<td>{{= createTime}}</td>
		<td>
           <a onclick="popDiv('<%=basePath %>aboutUs/checkMyPartner.do?id={{= id}}&t=<%=Math.random() %>')" href="javascript:void(0)" class="orange" class="changeStatus orange">查看</a>
			<shiro:hasPermission name="YYGL_GYWM_HZDP_XG">
		   <a onclick="popDiv('<%=basePath %>aboutUs/modifyMyPartner.do?id={{= id}}&t=<%=Math.random() %>')" href="javascript:void(0)" class="orange" class="changeStatus orange">修改</a>
			</shiro:hasPermission>
			<shiro:hasPermission name="YYGL_GYWM_HZDP_ZD">
		   <a href="javascript:topMyPartner({{= id}})" class="changeStatus orange"> 置顶 </a>
			</shiro:hasPermission>
			<shiro:hasPermission name="YYGL_GYWM_HZDP_SC">
		   <a href="javascript:delMyPartner({{= id}})" class="changeStatus orange"> 删除 </a>
			</shiro:hasPermission>
        </td>
     </tr>
{{/each}}
</script>
<c:if test="${errMsg ne null && errMsg ne ''}">
<script type="text/javascript">
  dm.alert(decodeURIComponent('${errMsg}'));
</script>
</c:if>
<script type="text/javascript">
    dmCheck.init("#searchForm");
        //页面加载时调用
        $(function(){
    	  search();
        });
     /*
             查询
     */
     function search(){
 		DMGold.ajax({"formId":"searchForm","serialize":true,"url":"getMyPartnerAjax.do","success":pageTagCallBack});
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
 		DMGold.PageTag.init({"divId":"pageTag","formId":"searchForm","curPage":data.data.pageResult.pageIndex,"totalCount":data.data.pageResult.recordCount,
	          "pageCount":data.data.pageResult.pageTotal,"url":"getMyPartnerAjax.do","toPageCallBack":pageTagCallBack});
  	}
    //弹出框
    function popDiv(url){
 	   $.tbox.popup(url);
    };
 	//删除合作伙伴
 	function delMyPartner(id){
    		 dm.confirm("确定删除吗？",{
    				title:"确认",				//标题
    				okName:"确定",			//如同confirm确定按钮的value
    				cancleName:"取消",		//如同confirm取消按钮的value
    				callback:function(){	//按确定的执行的函数
    					location.href = "delMyPartner.do?id="+id;
    				}
    			});
    };
 	//置顶合作伙伴
 	function topMyPartner(id){
    		 dm.confirm("确定置顶吗？",{
    				title:"确认",				//标题
    				okName:"确定",			//如同confirm确定按钮的value
    				cancleName:"取消",		//如同confirm取消按钮的value
    				callback:function(){	//按确定的执行的函数
    					location.href = "topMyPartner.do?id="+id;
    				}
    			});
    };
 </script>
</html>
