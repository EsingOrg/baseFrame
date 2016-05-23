<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp" %>
<html>
  <head>
  <title>个人买金</title>
  </head>
  <body>
	<div >				
			<div class="r_main clearfix ">
			   <div class="main_title">个人买金</div>
			     <!--搜索表框  -->
			 <form id="form">
	          <div class="main_con">
	          <div class="admin_input clearfix">
	          <p>
	                                        订单号：
	                 <input type="text" name="orderNo" class="yhgl_input"  maxlength="20"/>
	           </p>
	            <p>
	                                        用户名：
	                 <input type="text" name="userName" class="yhgl_input"  maxlength="20"/>
	           </p>
	            <p>
	                                        手机号：
	                 <input type="text" name="userPhone" class="yhgl_input"  maxlength="20"/>
	           </p>
	           <p>交易时间：
				   <input type="text" name=startCreateTime  class="yhgl_input date" class="Wdate" id="startDate" onclick="WdatePicker({readOnly:true,maxDate:'#F{$dp.$D(\'endDate\')}'})"/>
				   <span class="mr5">至</span> 
				   <input type="text" name="endCreateTime"  class="yhgl_input date" class="Wdate" id="endDate" onclick="WdatePicker({readOnly:true,minDate:'#F{$dp.$D(\'startDate\')}'})"/>
				</p>
				<p>成交金价：
				   <input type="text" name="startDealPrice" validate="amount" class="yhgl_input"  maxlength="20"/>
				   <span class="mr5">元  至</span> 
				  <input type="text" name="endDealPrice" validate="amount" class="yhgl_input"  maxlength="20"/>元
				</p>
	              <p class="lo_btn">
	               <input type="button" class="search" value="搜索" onclick="search();" /> 
	               <shiro:hasPermission name="YWGL_MJYW_GRMJ_DC">
	               <input name="input" type="button" class="export ml10" value="导出" onclick="exportData('form','persPurGoldExpo.do');"/>
	               </shiro:hasPermission>
	            </div>
	            </div> 
	            </form>
          <!--搜索表框  --END-->  
				<div class="main_con">
				 <table   width="100%" border="0" cellspacing="0" cellpadding="3" class="main_table tc" >
						<thead>
						<tr class="title">
							<td>序号</td>
						    <td>订单号</td>
						    <td>用户名</td>
							<td>姓名</td>
							<td>手机号</td>
							<td>买金克重(克)</td>
						    <td>成交金价(元/克)</td>
						    <td>成交额(元)</td>
							<td>交易时间</td>
						</tr>
				        </thead>
					<tbody id="listGrid"></tbody>
				</table>
				<div class="mt10">
		          	<p class="fl">买金克重总计：<span class="yellow f24" id="totalWeight"></span>克</p>
		          	<p class="ml100 fl">成交额总计：<span class="yellow f24" id="totalAmount"></span>元</p>
		          	<p class="ml100 fl">平均成交金价：<span class="yellow f24" id="avgPrice"></span>元</p>
		        </div> 
				<div  class="paging" id="pageTag"></div>  
				</div>
			</div>
			<div class="pager"></div>
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
<script id="listGridTemplate" type="text/x-jquery-tmpl">
      {{each(index) list}}
       <tr {{if index %2 == 0}}class="grey" {{/if}}>
		<td>{{= index+1+((pageIndex-1)*pageSize)}}</td>
	    <td>{{= orderNo}}</td>
	    <td>{{= userName}}</td>
        <td>{{= userFullName}}</td>
        <td>{{= userPhone}}</td> 
	    <td>{{= weight}}</td>
	    <td>{{= dealPrice}}</td>
        <td>{{= amount}}</td> 
        <td>{{= createTime}}</td>
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
 	   $("#listGrid").empty();
 		//填充数据
	   $('#listGridTemplate').tmpl(data.pageResult).appendTo("#listGrid");
	   //初始化分页标签
	   DMGold.PageTag.init({"divId":"pageTag","formId":"form","curPage":data.pageResult.pageIndex,"totalCount":data.pageResult.recordCount,
			          "pageCount":data.pageResult.pageTotal,"url":"personPurcGoldAjax.do","toPageCallBack":backFunc});
	 //加载统计数据
	 if(!data.statResult){
		 $("#totalWeight").empty();
	  	 $("#totalAmount").empty();
	  	 $("#avgPrice").empty();
		$("#totalWeight").append('0.000');
	    $("#totalAmount").append('0.00');  
	    $("#avgPrice").append('0.00');
		return false;
	 }
  	 var totalWeight = data.statResult.totalWeight;//买金克重总计
  	 var totalAmount = data.statResult.totalAmount;//成交额总计
  	 var avgPrice = data.statResult.avgPrice;//平均成交金价
  	 $("#totalWeight").empty();
  	 $("#totalAmount").empty();
  	 $("#avgPrice").empty();
  	 if(totalWeight){
  		$("#totalWeight").append(totalWeight);
  	 }else{
  		$("#totalWeight").append('0.000');
  	 }
  	 if(totalAmount){
  		$("#totalAmount").append(totalAmount);
  	 }else{
  		$("#totalAmount").append('0.00');	 
  	 }
  	 if(avgPrice){
  		$("#avgPrice").append(avgPrice);
  	 }else{
  		$("#avgPrice").append('0.00');
  	 }
 	}
 	//查询数据
 	function search(){
 		if(!dmCheck.check("#form")){
			return false;
		} 
 		DMGold.ajax({"formId":"form","serialize":true,"url":"personPurcGoldAjax.do","success":backFunc});
 	}
</script>
</html>
