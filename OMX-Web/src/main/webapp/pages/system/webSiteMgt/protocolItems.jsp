<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp" %>
<html>
  <head>
  <title>协议条款</title>
		<div>
			<div class="r_main clearfix ">
				<div class="main_con">
				 <table   width="100%" border="0" cellspacing="0" cellpadding="3" class="main_table tc" >
						<thead>
						<tr class="title">
							<td>序号</td>
						    <td>协议标题</td>
						    <td>创建人</td>
							<td>创建时间</td>
							<td>操作</td>
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
  <!-- 系统用户显示模板 -->
	<script id="template" type="text/x-jquery-tmpl">
      {{each(index) list}}
       <tr {{if index %2 == 0}}class="grey" {{/if}}>
		<td>{{= index+1+((pageIndex-1)*pageSize)}}</td>
	    <td>{{= name}}</td>
	    <td>{{= updateBy}}</td>
        <td>{{= updateTime}}</td> 
        <td>
			<a href="<%=basePath %>system/operationSet/tempEditView.do?id={{= id}}&isView=false&operation=show&retUrl=../../system/webSiteMgt/protocolItems.do&t=<%=Math.random() %>
 %>"  class="orange" >查看</a>
 			<shiro:hasPermission name="XTGL_ZDSZ_XYTK_XG">
			<a href="<%=basePath %>system/operationSet/tempEditView.do?id={{= id}}&isView=false&retUrl=../../system/webSiteMgt/protocolItems.do&key={{= key}}&t=<%=Math.random() %>"  class="orange" >修改</a>
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
     	function search(){
     		DMGold.ajax({"formId":"","serialize":true,"url":"protocolItemsAjax.do","success":pageTagCallBack});
     			}
       //分页跳转回调
       function pageTagCallBack(data){
    		//清空表格数据
    	$("#grid").empty();
    		//填充数据
   		 $('#template').tmpl(data.pageResult).appendTo("#grid");
   		//初始化分页标签
   		DMGold.PageTag.init({"divId":"pageTag","data":{},"curPage":data.pageResult.pageIndex,"totalCount":data.pageResult.recordCount,
   			          "pageCount":data.pageResult.pageTotal,"url":"protocolItemsAjax.do","toPageCallBack":pageTagCallBack});
    	}
    </script>
  </head>
  <body>
  <c:if test="${errMsg ne null}">
  <script type="text/javascript">
  dm.alert(decodeURIComponent('${errMsg}'));
  </script>
  </c:if>
</html>
