<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp" %>
<html>
  <head>
  <title>平台常量设置</title>
  
  <!-- 系统用户显示模板 -->
	<script id="bankListTemplate" type="text/x-jquery-tmpl">
	{{each(i,pro) prop}}
      <tr>
        <td>{{= i+1}}</td> 
	    <td>{{= pro.type}}</td>
	    <td style="WORD-WRAP: break-word">{{= pro.desc}}</td>
        <td>{{= pro.key}}</td> 
        <td style="WORD-WRAP: break-word">{{= pro.value}}</td>
        <td>
		<shiro:hasPermission name="XTGL_XTCSSZ_XTSXSZ_BJ">
            <a onclick="popDiv('<%=basePath %>system/sysArgsSet/toEditSysProp.do?key={{= pro.key}}&t=<%=Math.random() %>')" href="javascript:void(0)" class="orange">编辑</a>
        	</shiro:hasPermission>
		</td>	
       </tr>
	{{/each}}
	</script>
    <script type="text/javascript">
        //页面加载时调用
        $(function(){
    	  document.getElementById("")
    	  gridDataLoad();//jquery 模板demo
    	  selectValue();
    	 
        });
        var gridDataLoad = function(){
        	//造的测试数据，实际应用时，将ajax返回的json数据替换这里的data即可
       	 var data = ${pageList.data.pageResult.list};
       	//清空模板类容
       	// $('#myTemplate').empty();
       	 $('#bankListTemplate').tmpl({prop:data}).appendTo("#bankListGrid");
       	//添加删除监听
     	 $(".changeBankStatus").bind("click",function(){
     	    $(this).parent().parent().remove();
     	 });
       }
    </script>
     
  </head>
  <body>
			<div class="r_main clearfix ">
				<form id="dataForm" action="sysPropList.do" method="post">
			     <!--搜索表框  -->
	          <div class="main_border clearfix">
	          <div class="admin_input clearfix">
	           <p>
	                                        类型：<select name="type" class="yhgl_sel" id="type">
	                    </select>
	           </p>
	          <p>
	                                        描述：
	                 <input type="text" name="desc" class="yhgl_input" value="${prop.desc }" maxlength="20"/>
	           </p>
	            <p>
	                key：
	                 <input type="text" name="key" class="yhgl_input" value="${prop.key }" maxlength="20"/>
	           </p>
	           
	              <p class="lo_btn">
	              <input type="submit" class="search" value="查找" /> 
	            </div>
	            </div> 
          <!--搜索表框  --END-->  
				
			<div class="main_con">
				<div class="lb_content_table">
				 <table   width="100%" border="0" cellspacing="0" cellpadding="3" style="TABLE-LAYOUT: fixed"  class="main_table tc" id="bankListGrid">
						<thead>
						<tr class="title">
							<td>序号</td>
						    <td>类型</td>
						    <td>描述</td>
							<td>属性key</td>
							<td>属性值</td>
							<td>操作</td>
						</tr>
				        </thead>
					<tbody></tbody>
				</table>
				</div>
				<div style="margin-top: 25px;">
					<dim:page url="sysPropList.do" totalCount="${pageList.data.pageResult.recordCount }" formId="dataForm" showPages="${pageList.data.pageResult.pageSize }"
						curPage="${pageList.data.pageResult.pageIndex }" totalPages="${pageList.data.pageResult.pageTotal }" />
				</div>
			</div>
			</form>
		</div>
 </body>
 <script type="text/javascript">
 
    //弹出框
    function popDiv(url){
 	   $.tbox.popup(url);
    }
    //修改密码
 	function openDivPwd(id,loginName){
 		loginNames = encodeURIComponent(encodeURIComponent(loginName));
 		popDiv('<%=basePath %>system/consoleAccountMgt/sysUserModifyPwd.do?id='+id+'&ln='+loginNames+'&t=<%=Math.random() %>');
 	}
 	//删除系统用户
 	function changeStatus(userId){
    		 dm.confirm("确定停用吗？",{
    				title:"确认",				//标题
    				okName:"确定",			//如同confirm确定按钮的value
    				cancleName:"取消",		//如同confirm取消按钮的value
    				callback:function(){	//按确定的执行的函数
    					location.href = "changeBankStatus.do?id="+userId;
    				}
    			});
    }
 	
 	var selectValue=function(){
 		var values=${type.data.result};
 		$("#type").append("<option value=''>全部</option>");
 		for(var i=0;i<values.length;i++){
 			if("${prop.type}"==values[i]){
 				$("#type").append("<option value='"+values[i]+"' selected>"+values[i]+"</option>");
 			}else{
 				$("#type").append("<option value='"+values[i]+"'>"+values[i]+"</option>");
 			}
 		}
 		
 		
 	}
 	
 </script>
</html>
