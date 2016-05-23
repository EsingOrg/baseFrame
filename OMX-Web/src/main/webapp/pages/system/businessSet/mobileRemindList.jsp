<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp" %>
<html>
  <head>
  <script type="text/javascript" src="<%=basePath%>js/date/WdatePicker.js"></script>
  <title>手机提醒设置</title>
  </head>
  <body>
	<div class="systemUser">				
	  <div class="r_main clearfix ">
		<form id="form">
		  <!--搜索表框  -->
	       <div class="main_border clearfix">
	       <div class="admin_input clearfix">
	       <p>姓名：<input type="text" name="name" class="yhgl_input" value="${tempReq.name}" maxlength="20"/></p>
	       <p>提醒类型：<dim:select name="type" enumType="OrderType" headName="全部" headValue="" exclude="SAVE,TAKE,CHANGE,CHANGE_SAVE,CHANGE_TAKE" cssClass="yhgl_sel"></dim:select></p>
	       <p class="lo_btn">
	          <input type="button" onclick="search();"  class="search" value="搜索" /> 
	          <shiro:hasPermission name="XTGL_YWSZ_SJTXSZ_DC">
	          <input name="input" type="button" class="export ml10" value="导出" onclick="exportData('form','<%=basePath%>system/businessSet/exportExcle.do');"/>
	          </shiro:hasPermission>
	          <shiro:hasPermission name="XTGL_YWSZ_SJTXSZ_TJ">
	          <a onclick="popDiv('<%=basePath %>system/businessSet/editMobileRemindView.do?t=<%=Math.random() %>')" href="javascript:void(0)" class="btn_cs ml10"><i class="newly"></i>添加</a>
	          </shiro:hasPermission>
	        </p>
	       </div>
	       </div> 
          <!--搜索表框  --END-->  
		  </form>
			<div class="main_con">
			  <table   width="100%" border="0" cellspacing="0" cellpadding="3" class="main_table tc">
				<thead>
				  <tr class="title">
					<td>序号</td>
				    <td>姓名</td>
				    <td>手机号</td>
					<td>提醒类型</td>
					<td>添加人</td>
					<td>添加时间</td>
					<td>备注</td>
					<td>操作</td>
				  </tr>
				 </thead>
				 <tbody id="listGrid"></tbody>
				</table>
				<div id="pageTag"></div>
				</div>
			</div>
			<div class="pager"></div>
		</div>
 </body>
  <c:if test="${param.errMsg ne null}">
  <script type="text/javascript">
  dm.alert(decodeURIComponent('${param.errMsg}'));
  </script>
  </c:if>
  <!-- 系统用户显示模板 -->
 <script id="listTemplate" type="text/x-jquery-tmpl">
 {{each(index) list}}
       <tr {{if index %2 == 0}}class="grey" {{/if}}>
        <td>{{= index+1}}</td> 
	    <td>{{= name}}</td>
	    <td>{{= phone}}</td>
        <td>{{= type=="BUY"?"买金":"卖金"}}</td> 
        <td>{{= createBy}}</td>
        <td>{{= createTime}}</td>
        <td>{{= remark}}</td>   
		<shiro:hasPermission name="XTGL_YWSZ_SJTXSZ_SC">
        <td>
            <a  href="javascript:delRemind({{= id}})" class="changeStatus orange">删除</a>
        </td>	
		</shiro:hasPermission>
       </tr>
  {{/each}}	
</script>
<script type="text/javascript">
dmCheck.init("#form");
      //页面加载时调用
      $(function(){
    	search();
      });
   	function search(){
   		DMGold.ajax({"formId":"form","serialize":true,"url":"mobileRemindListAjax.do","success":pageTagCallBack});
   			}
   	
   //分页跳转回调
 	  function pageTagCallBack(data){
 		//清空表格数据
 		$("#listGrid").empty();
 		//填充数据
		$('#listTemplate').tmpl(data.pageResult).appendTo("#listGrid");
		//初始化分页标签
		DMGold.PageTag.init({"divId":"pageTag","formId":"form","curPage":data.pageResult.pageIndex,"totalCount":data.pageResult.recordCount,
			          "pageCount":data.pageResult.pageTotal,"url":"mobileRemindListAjax.do","toPageCallBack":pageTagCallBack});
 	  }
      //弹出框
      function popDiv(url){
 	    $.tbox.popup(url);
      }
 	  //删除手机提醒
 	  function delRemind(userId){
 		  var mType = status=="BUY"?"买金":"卖金";
   		 dm.confirm("确认删除该用户的'"+mType+"'手机提醒吗？",{
   				title:"删除",				//标题
   				okName:"确定",			//如同confirm确定按钮的value
   				cancleName:"取消",		//如同confirm取消按钮的value
   				picClass:"d_perfect",
				callback:function (){ 
					DMGold.ajax({"data":{'id':userId},"serialize":true,"url":'delMobileRemind.do',
							"success":function(data){
	 						//显示提示信息
	 						if("000000"==data.code){
	 							dm.alert(data.description,{"picClass":"d_succeed"});
	 						}else{
	 							dm.alert(data.description,{"picClass":"d_error"});
	 						}
	 					}});
					search();
				} 	
			});
 	  }
 </script>
</html>
