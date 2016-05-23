<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp" %>
<html>
  <head>
  <title>站内信模板</title>
  </head>
  <body>
	<div >				
			<div class="r_main clearfix ">
				<form id="form" >
			     <!--搜索表框  -->
	          <div class="main_border clearfix">
	          <div class="admin_input clearfix">
	          <p>
	                                        标题：
	                 <input type="text" name="name" class="yhgl_input" value="" maxlength="20"/>
	           </p>
	           <p class="lo_btn">
	              <input type="button" class="search" onclick="search()" value="搜索" /> 
	            </div>
	            </div> 
          <!--搜索表框  --END-->  
				</form>
				<div class="main_con">
				 <table   width="100%" border="0" cellspacing="0" cellpadding="3"  class="main_table tc" >
						<thead>
						<tr class="title">
							<td>序号</td>
						    <td>标题</td>
						    <td>模板内容</td>
							<td width="10%">操作</td>
						</tr>
				        </thead>
					<tbody id="grid"></tbody>
				</table>
				<div  id="pageTag"></div>
				</div>
			</div>
			<div class="pager"></div>
		</div>
 </body>
 <c:if test="${errMsg ne null}">
  <script type="text/javascript">
  dm.alert(decodeURIComponent('${errMsg}'),{picClass:"d_perfect"});
  </script>
 </c:if>
 <!-- 系统用户显示模板 -->
	<script id="template" type="text/x-jquery-tmpl">
     {{each(index) list}}
       <tr {{if index %2 == 0}}class="grey" {{/if}}>
		<td>{{= index+1+((pageIndex-1)*pageSize)}}</td>
	    <td>{{= name}}</td>
	    <td limit=60>{{= content}}</td>
        <td>
			<shiro:hasPermission name="XTGL_YYSZ_ZNXMB_QY">
            <a  href="javascript:activeToggle('{{= id}}','{{= enableFlag}}')" class="changeStatus orange">{{= enableFlag=='Y'?'停用':'启用'}}</a>
			</shiro:hasPermission>    
			<a href='tempEditView.do?id={{= id}}&isView=false&retUrl=../../system/operationSet/letterTempalete.do&operation=show&t=<%=Math.random() %>' class="orange">查看</a>
			<shiro:hasPermission name="XTGL_YYSZ_ZNXMB_XG">
            <a href='tempEditView.do?id={{= id}}&isView=false&retUrl=../../system/operationSet/letterTempalete.do&key={{= key}}&t=<%=Math.random() %>'class="orange">修改</a>
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
    	   DMGold.ajax({"formId":"form","serialize":true,"url":"letterTempaleteAjax.do","success":pageTagCallBack});
      	 
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
   			          "pageCount":data.pageResult.pageTotal,"url":"letterTempaleteAjax.do","toPageCallBack":pageTagCallBack});
    	}
    
    //弹出框
    function popDiv(url){
 	   $.tbox.popup(url);
    }

 	//启用
 	function activeToggle(userId,status){
 		     status = status=='Y'?'N':'Y';
    		 dm.confirm("确定"+(status=='Y'?'启用':'停用')+"吗？",{
    				title:"确认",				//标题
    				okName:"确定",			//如同confirm确定按钮的value
    				cancleName:"取消",
    				picClass:"d_perfect",
    				//如同confirm取消按钮的value
    				callback:function(){	//按确定的执行的函数		
    				DMGold.ajax({"data":{'id':userId,'enableFlag':status},"serialize":true,"url":"tempToggle.do","success":function(data){
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
