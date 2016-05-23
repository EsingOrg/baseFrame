<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp" %>
<html>
  <head>
  <title>平台常量设置</title>
  </head>
  <body>
	<div class="r_main clearfix ">
		<form id="form" action="sysConstantList.do" method="post">
	     <!--搜索表框  -->
         <div class="main_border clearfix">
         <div class="admin_input clearfix">
          <p>类型：
          <select name="type">
            <option value="">--请选择--
            <c:forEach items="${select.pageResult}" var="option">
            <option value="${option.type}">${option.type}
            </c:forEach>
          </select>
          </p>
         <p> 名称：
                <input type="text" name="desc" class="yhgl_input" value="" />
          </p>
          <p>key：
                <input type="text" name="key" class="yhgl_input" value="" />
          </p>
          <p class="lo_btn">
             <input type="button" class="search" value="查找" onclick="search();" /> 
           </div>
           </div> 
        <!--搜索表框  --END-->  
		</form>
		<div class="main_con">
		 <table   width="100%" border="0" cellspacing="0" cellpadding="3" class="main_table tc" >
				<thead>
				<tr class="title">
					<td>序号</td>
				    <td>类型</td>
				    <td>名称</td>
					<td>key</td>
					<td>常量值</td>
					<td>更新时间</td>
					<td>操作</td>
				</tr>
		        </thead>
			<tbody id="grid"></tbody>
		</table>
		<div id="pageTag"></div> 
		</div>
	</div>
	<div class="pager"></div>
 </body>
<c:if test="${param.errMsg ne null}">
<script type="text/javascript">
	dm.alert(decodeURIComponent('${param.errMsg}'));
</script>
</c:if>
<!-- 系统用户显示模板 -->
<script id="template" type="text/x-jquery-tmpl">
 {{each(index) list}}
       <tr {{if index %2 == 0}}class="grey" {{/if}}>
		<td>{{= index+1+((pageIndex-1)*pageSize)}}</td>
	    <td>{{= type}}</td>
	    <td style="WORD-WRAP: break-word">{{= desc}}</td>
        <td>{{= key}}</td>
        <td style="WORD-WRAP: break-word" limit=30>{{= value}}</td> 
	    <td>{{= updateTime}}</td>
		<td>
		<shiro:hasPermission name="XTGL_XTCSSZ_PTCLSZ_BJ">
		<a onclick="popDiv('sysConstantEdit.do?id={{= id}}&t=<%=Math.random() %>')" href="javascript:void(0)" class="orange">编辑</a></td>
		</shiro:hasPermission>
       </tr>
     {{/each}}
</script>
<script type="text/javascript">
    //页面加载时调用
    $(function(){
    	search();
    });
    //弹出框
    function popDiv(url){
 	   $.tbox.popup(url);
    }
    //分页跳转回调
 	function pageTagCallBack(data){
 		//清空表格数据
 		$("#grid").empty();
 		//填充数据
		 $('#template').tmpl(data.pageResult).appendTo("#grid");
		 DMGold.limit();
		//初始化分页标签
		DMGold.PageTag.init({"divId":"pageTag","formId":"form","curPage":data.pageResult.pageIndex,"totalCount":data.pageResult.recordCount,
			          "pageCount":data.pageResult.pageTotal,"url":"sysConstantListAjax.do","toPageCallBack":pageTagCallBack});
 	}
    //查询方法
    function search(){
    	DMGold.ajax({"formId":"form","serialize":true,"url":"sysConstantListAjax.do","success":pageTagCallBack});
    }
 </script>
</html>
