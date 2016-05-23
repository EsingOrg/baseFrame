<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp" %>
<html>
 <head>
  <title>预买订单</title>
 </head>
 <body>
	<div >				
	   <div class="r_main clearfix ">
		 <div class="main_title">预买订单</div>
		 <!--搜索表框  -->
		 <form id="form">
          <div class="main_con">
	         <div class="admin_input clearfix">
	          <p>预买单号：<input type="text" name="bookNo" class="yhgl_input"  maxlength="20"/></p>
	          <p>用户名：<input type="text" name="userName" class="yhgl_input"  maxlength="20"/></p>
	          <p>手机号：<input type="text" name="userPhone" class="yhgl_input"  maxlength="20"/></p>
	          <p>预买时间：
				   <input type="text" name=startTime  class="yhgl_input date" class="Wdate" id="startDate" onclick="WdatePicker({readOnly:true,maxDate:'#F{$dp.$D(\'endDate\')}'})"/>
				   <span class="mr5">至</span> 
				   <input type="text" name="endTime"  class="yhgl_input date" class="Wdate" id="endDate" onclick="WdatePicker({readOnly:true,minDate:'#F{$dp.$D(\'startDate\')}'})"/>
			  </p>
			  <p>角色：<dim:select name="userType" enumType="UserType" headName="全部" exclude="SYS" headValue=""></dim:select></p>
			  <p>预买金价：
				   <input type="text" name="startPrice" validate="amount" class="yhgl_input"  maxlength="20"/>
				   <span class="mr5">元  至</span> 
				  <input type="text" name="endPrice" validate="amount" class="yhgl_input"  maxlength="20"/>元
			  </p>
			  <p>状态：<dim:select name="status" enumType="OrderBookStatus" headName="全部" headValue=""></dim:select></p>
	          <p class="lo_btn">
	             <input type="button" class="search" value="搜索" onclick="search();" /> 
                 <shiro:hasPermission name="YWGL_MJYW_YMDD_SC">
                 <input name="input" type="button" class="btn_cs" style="margin-left:10px;" value="按时间段删除" onclick="deletePre();"/>
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
				    <td>预买单号</td>
				    <td>用户名</td>
					<td>名称</td>
					<td>手机号</td>
					<td>角色</td>
				    <td>预买克重(克)</td>
				    <td>预买金价(元/克)</td>
					<td>预买金额(元)</td>
					<td>预买开始时间</td>
					<td>预买结束时间</td>
					<td>状态</td>
				</tr>
		     </thead>
			 <tbody id="grid"></tbody>
		   </table>
		  <div class="mt10" style="display:none;">
          	<p class="fl">预买克重总计：<span class="yellow f24" id="totalWeight"></span>克</p>
          	<p class="ml100 fl">预买金额总计：<span class="yellow f24" id="totalAmount"></span>元</p>
          </div> 
		  <div id="pageTag"></div>  
		 </div>
		</div>
	   <div class="pager"></div>
	</div>
<!-- 批量上传隐藏域 -->
<div id="delDialog" style="display:none;">
<div class="popup_bg"></div>
<div class="dialog">
  <div class="clearfix"> 
      <div class="title"><a href="javascript:void(0)" class="out" onclick="$('#delDialog').css('display','none');"></a>按时间段删除</div>
      <div class="cotent clearfix">
         <div class="conn">
         <form id="delForm" action="addOutboundBoxDeatil.do" method="post">
             <p>预买时间：
				   <input type="text" name="startTime" style="width:25%;" class="yhgl_input date" class="Wdate" id="startDate1" onclick="WdatePicker({readOnly:true,maxDate:'#F{$dp.$D(\'endDate1\')}'})"/>
				   <span style="width:10%">至</span> 
				   <input type="text" name="endTime" style="width:25%;" class="yhgl_input date" class="Wdate" id="endDate1" onclick="WdatePicker({readOnly:true,minDate:'#F{$dp.$D(\'startDate1\')}'})"/>
			  </p>
        	</form>
         </div> 
         <div class="btn"><a href="javascript:void(0)" onclick="thSubmit();"  class="btn_cs">确定</a><a href="javascript:void(0)" class="btn_hs ml20" onclick="$('#delDialog').css('display','none');">取消</a></div>
      </div>     
    </div>
</div>
</div>	
 </body>
 <!-- 提示信息 -->
<c:if test="${errMsg ne null}">
<script type="text/javascript">
  //错误提示
  dm.alert(decodeURIComponent('${errMsg}'));
</script>
</c:if>
<!-- 系统用户显示模板 -->
<script id="template" type="text/x-jquery-tmpl">
      {{each(index) list}}
       <tr {{if index %2 == 0}}class="grey" {{/if}}>
		<td>{{= index+1+((pageIndex-1)*pageSize)}}</td>
	    <td>{{= bookNo}}</td>
	    <td>{{= userName}}</td>
        <td>{{= userFullName}}</td>
        <td>{{= userPhone}}</td> 
	    <td>{{= userTypeName}}</td>
	    <td>{{= weight}}</td>
		<td>{{= price}}</td>
        <td>{{= amount}}</td> 
        <td>{{= startTime}}</td>
		<td>{{= endTime}}</td>
		<td>{{= statusName}}</td>
       </tr>
     {{/each}}
	</script>
<script type="text/javascript">
//增加校验模式
dmCheck.init("#form");
  var curIndex = 0;
   //页面加载时调用
   $(function(){
	   search();
   });
    //分页跳转回调
 	function backFunc(data){
 		//清空表格数据
 	   $("#grid").empty();
 		//填充数据
	   $('#template').tmpl(data.pageResult).appendTo("#grid");
	   //初始化分页标签
	   DMGold.PageTag.init({"divId":"pageTag","formId":"form","curPage":data.pageResult.pageIndex,"totalCount":data.pageResult.recordCount,
			          "pageCount":data.pageResult.pageTotal,"url":"prePurcGoldAjax.do","toPageCallBack":backFunc});
 	}
 	//查询数据
 	function search(){
 		DMGold.ajax({"formId":"form","serialize":true,"url":"prePurcGoldAjax.do","success":backFunc});
 	}
 	/**
 	显示按时间段删除输入框
 	*/
 	function deletePre(){
 		$("#delDialog").css("display","block");
 		$("#delForm input[type='text']").val("");
 	}
 	/**
 	按时间段删除
 	*/
 	function thSubmit(){
 		//校验是否输入删除时间
 		var startTime = $("#startDate1").val();
 		var endTime = $("#endDate1").val();
 		if(!startTime&&!endTime){
 			dm.alert("请输入删除时间",{"picClass":"d_error"});
 			return;
 		}
 		$("#delDialog").hide();
 		dm.confirm("是否删除？",{
				title:"确认",				//标题
				okName:"确定",			//如同confirm确定按钮的value
				cancleName:"取消",		//如同confirm取消按钮的value
				picClass:"d_perfect",
               callback:function(){	//按确定的执行的函数			 
            	   DMGold.ajax({"formId":'delForm',"serialize":true,"url":"delPurcGoldAjax.do","success":function(data){
            		   debugger;
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
