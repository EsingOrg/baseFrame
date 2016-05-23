<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp" %>
<html>
  <head>
  <script type="text/javascript" src="<%=basePath%>js/date/WdatePicker.js"></script>
  </head>
  <body>
  <c:if test="${errMsg ne null}">
  <script type="text/javascript">
  dm.alert(decodeURIComponent('${errMsg}'));
  </script>
  </c:if>
	<div class="systemUser">				
			<div class="r_main clearfix ">
				<div class="main_con">
				 <table   width="100%" border="0" cellspacing="0" cellpadding="3" class="main_table tc" id="bankListGrid">
						<thead>
						<tr class="title">
							<td>序号</td>
						    <td>合同模板</td>
						    <td>创建人</td>
							<td>创建时间</td>
							<td>操作</td>
						</tr>
				        </thead>
					<tbody></tbody>
				</table>
				</div>
			</div>
			<div class="pager"></div>
		</div>
 </body>
<!-- 系统用户显示模板 -->
<script id="contractListTemplate" type="text/x-jquery-tmpl">
     {{each(index) list}}
       <tr {{if index %2 == 0}}class="grey" {{/if}}>
        <td>{{= index+1}}</td>
	    <td>{{= name}}</td>
	    <td>{{= updateBy}}</td>
        <td>{{= updateTime}}</td> 
        <td>
			<shiro:hasPermission name="XTGL_CWSZ_HTMBSZ_XG">
          	<a  href="../operationSet/tempEditView.do?id={{= id}}&isView=false&retUrl=../../system/businessSet/contractTempList.do&key={{= key}}&t=<%=Math.random() %>" class="orange">修改</a>
			</shiro:hasPermission>
        </td>	
       </tr>
  {{/each}}
</script>
 <script type="text/javascript">
      //页面加载时调用
      $(function(){
  	  gridDataLoad();//初始化数据
      });
      var gridDataLoad = function(){
     	 var data =  ${list.pageResult};
     	//清空模板类容
     	 $('#contractListTemplate').tmpl(data).appendTo("#bankListGrid");
     };

  //弹出框
  function popDiv(url){
   $.tbox.popup(url);
  }
 </script>
</html>
