<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp" %>
<html>
  <head>
  <script type="text/javascript" src="<%=basePath%>js/date/WdatePicker.js"></script>
  <title>系统用户列表</title>
  </head>
  <body>
	<div class="systemUser">				
			<div class="r_main clearfix ">
				<form id="form">
			     <!--搜索表框  -->
	          <div class="main_border clearfix">
	          <div class="admin_input clearfix">
	          <p>
	                                        银行名称：
	                 <input type="text" name="name" class="yhgl_input" value="${bankReq.name}" maxlength="20"/>
	           </p>
	            <p>
	                                        状态：
	             <dim:select name="status" enumType="SysUserStatus" headName="全部" value="${bankReq.status}" headValue="" exclude="D" cssClass="yhgl_sel"></dim:select>
	           </p>
	              <p class="lo_btn">
	              <input type="button" onclick='search();' class="search" value="搜索" /> 
	              </p>
	              <div>
	              <shiro:hasPermission name="XTGL_YWSZ_YHSZ_TJ">
	               <a onclick="popDiv('<%=basePath %>system/businessSet/editBankView.do?t=<%=Math.random() %>')" href="javascript:void(0)" class="btn_cs ml10">
	               <i class="newly"></i>添加</a>
	               </shiro:hasPermission>
	               </div>
	            </div>
	            </div> 
          <!--搜索表框  --END-->  
				</form>
				<div class="main_con">
				 <table   width="100%" border="0" cellspacing="0" cellpadding="3" class="main_table tc" >
						<thead>
						<tr class="title">
							<td>序号</td>
						    <td>银行名称</td>
						    <td>银行代码</td>
							<td>状态</td>
							<td>排序值</td>
							<td>操作</td>
						</tr>
				        </thead>
					<tbody id="bankListGrid"></tbody>
				</table>
				<div id="pageTag"></div>
				</div>
			</div>
			<div class="pager"></div>
		</div>
 </body>
<!-- 错误提示信息 -->
<c:if test="${param.errMsg ne null}">
	<script type="text/javascript">
	dm.alert(decodeURIComponent('${param.errMsg}'));
	</script>
</c:if>
 <!-- 系统用户显示模板 -->
 <script id="bankListTemplate" type="text/x-jquery-tmpl">
 {{each(index) list}}
       <tr {{if index %2 == 0}}class="grey" {{/if}}>
        <td>{{= index+1}}</td> 
	    <td>{{= name}}</td>
	    <td>{{= code}}</td>
        <td>{{= status=="Y"?"启用":"停用"}}</td> 
		<td>{{= sort}}</td>
        <td>
			<shiro:hasPermission name="XTGL_YWSZ_YHSZ_XG">
            <a onclick="popDiv('<%=basePath %>system/businessSet/editBankView.do?id={{= id}}&t=<%=Math.random() %>')" href="javascript:void(0)" class="orange">修改</a>
			</shiro:hasPermission>
			<shiro:hasPermission name="XTGL_YWSZ_YHSZ_TY">
            <a  href="javascript:delBank('{{= id}}','{{= status}}')" class="orange">{{= status=="Y"?"停用":"启用"}}</a>
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
      //查询
   	function search(){
  		DMGold.ajax({"formId":"form","serialize":true,"url":"bankListAjax.do","success":pageTagCallBack});
  	}
      
      //分页跳转回调
   	  function pageTagCallBack(data){
   		//清空表格数据
   		$("#bankListGrid").empty();
   		//填充数据
  		$('#bankListTemplate').tmpl(data.pageResult).appendTo("#bankListGrid");
  		//初始化分页标签
  		DMGold.PageTag.init({"divId":"pageTag","formId":"form","curPage":data.pageResult.pageIndex,"totalCount":data.pageResult.recordCount,
  			          "pageCount":data.pageResult.pageTotal,"url":"bankListAjax.do","toPageCallBack":pageTagCallBack});
   	  }
      //弹出框
      function popDiv(url){
 	   $.tbox.popup(url);
      }
      //修改密码
 	  function openDivPwd(id,loginName){
 		loginNames = encodeURIComponent(encodeURIComponent(loginName));
 		popDiv('<%=basePath %>system/consoleAccountMgt/sysUserModifyPwd.do?id='+id+'&ln='+loginNames+'&t=<%=Math.random() %>');
 	  }
 	  //删除银行卡
 	  function delBank(id,status){
 		   	 var title = status=="Y"?"确定停用吗？":"确定启用吗？";
 		   	 status = status=="Y"?"N":"Y";
    		 dm.confirm(title,{
    				title:"确认",				//标题
    				okName:"确定",			//如同confirm确定按钮的value
    				cancleName:"取消",		//如同confirm取消按钮的value
    		        picClass:"d_perfect",
				    callback:function(){	//按确定的执行的函数		
					DMGold.ajax({"data":{'id':id,'status':status},"serialize":true,"url":"changeStatus.do",
					"success":function(data){
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
