<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp" %>
<html>
  <head>
  <title>个人卖金</title>
  </head>
  <body>
	<div >				
			<div class="r_main clearfix ">
			   <!--文本框 -->
			<div class="main_title">个人卖金</div>
			<!--文本框 --END-->
				<form id="form">
			     <!--搜索表框  -->
	          <div class="main_con">
	          <div class="admin_input clearfix">
	          <p>
	                                        订单号：
	                 <input type="text" name="orderNo" class="yhgl_input" maxlength="23"/>
	           </p>
	            <p>
	                                        用户名：
	                 <input type="text" name="userName" class="yhgl_input" maxlength="20"/>
	           </p>
	            <p>
	                                        手机号：
	                 <input type="text" name="userPhone" class="yhgl_input" maxlength="20"/>
	           </p>
	           <p>交易时间：
				   <input type="text" name="startCreateTime"  class="yhgl_input date" class="Wdate" id="startDate" onclick="WdatePicker({readOnly:true,maxDate:'#F{$dp.$D(\'endDate\')}'})"/>
				   <span class="mr5">至</span> 
				   <input type="text" name="endCreateTime"  class="yhgl_input date" class="Wdate" id="endDate" onclick="WdatePicker({readOnly:true,minDate:'#F{$dp.$D(\'startDate\')}'})"/>
				</p>
				<p>成交金价：
				   <input type="text" name="startDealPrice" validate="amount"  class="yhgl_input"  maxlength="20"/>
				   <span class="mr5">元  至</span> 
				  <input type="text" name="endDealPrice" validate="amount"  class="yhgl_input"  maxlength="20"/>元
				</p>
	              <p class="lo_btn">
	              <input type="button" onclick="search();" class="search" value="搜索" /> 
	              <shiro:hasPermission name="YWGL_SJYW_GRMJ_DC">
	               <input name="input" type="button" class="export ml10" value="导出" onclick="exportData('form','personSaleGoldExpo.do');"/>
	            </shiro:hasPermission>
	            </div>
	            </div> 
          <!--搜索表框  --END-->  
				</form>
				<div class="main_con">
				 <table   width="100%" border="0" cellspacing="0" cellpadding="3" class="main_table tc" >
						<thead>
						<tr class="title">
							<td>序号</td>
						    <td>订单号</td>
						    <td>用户名</td>
							<td>姓名</td>
							<td>手机号</td>
							<td>卖金克重(克)</td>
						    <td>成交金价(元/克)</td>
						    <td>成交额(元)</td>
						    <td>扣除买源(克)</td>
						    <td>扣除存源(克)</td>
						    <td>剩余买源(克)</td>
						    <td>剩余存源(克)</td>
						    <td>手续费(元)</td>
							<td>交易时间</td>
						</tr>
				        </thead>
					<tbody id="grid"></tbody>
				</table>
				<div class="mt10">
		          	<p class="stat fl">卖金克重总计：<span class="yellow f24" id="totalWeight"></span>克</p>
		          	<p class="stat fl">成交额总计：<span class="yellow f24" id="totalAmount"></span>元</p>
		          	<p class="stat fl">扣除买源总计：<span class="yellow f24" id="totalMinusBuy"></span>克</p>
		          	<p class="stat fl">扣除存源总计：<span class="yellow f24" id="totalMinusSave"></span>克</p>
		          	<p class="stat fl">手续费总计：<span class="yellow f24" id="totalFee"></span>元</p>
		          	<p class="stat fl">剩余买源总计：<span class="yellow f24" id="totalRemainBuy"></span>克</p>
		          	<p class="stat fl">剩余存源总计：<span class="yellow f24" id="totalRemainSave"></span>克</p>
		          	<p class="stat fl">平均成交金价：<span class="yellow f24" id="avgPrice"></span>元</p>
		          	<p class="stat fl"></p><p class="stat fl"></p>
		        </div>
				<div  class="paging" id="pageTag"></div>
				</div>
			</div>
			<div class="pager"></div>
		</div>

 </body>
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
	    <td>{{= orderNo}}</td>
	    <td>{{= userName}}</td>
        <td>{{= userFullName}}</td>
        <td>{{= userPhone}}</td> 
	    <td>{{= weight}}</td>
	    <td>{{= dealPrice}}</td>
        <td>{{= amount}}</td> 
        <td>{{= minusBuy}}</td>
	    <td>{{= minusSave}}</td>
        <td>{{= remainBuy}}</td> 
        <td>{{= remainSave}}</td>
	    <td>{{= fee}}</td>
        <td>{{= createTime}}</td>
       </tr>
{{/each}}
</script>
<script type="text/javascript">
//增加校验模式
dmCheck.init("#form");
   //页面加载时调用
   $(function(){
	   search();
   });
 //查询
	function search(){
		if(!dmCheck.check("#form")){
			return false;
		}
		DMGold.ajax({"formId":"form","serialize":true,"url":"persSaleSearch.do","success":pageTagCallBack});
	}
   //分页跳转回调
   function pageTagCallBack(data){
		//清空表格数据
		$("#grid").empty();
		//填充数据
		 $('#template').tmpl(data.pageResult).appendTo("#grid");
		//初始化分页标签
		DMGold.PageTag.init({"divId":"pageTag","formId":"form","curPage":data.pageResult.pageIndex,"totalCount":data.pageResult.recordCount,
			          "pageCount":data.pageResult.pageTotal,"url":"persSaleSearch.do","toPageCallBack":pageTagCallBack});
		//初始化统计数据
		if(!data.statResult){
			 $("#totalWeight").empty();
		  	 $("#totalAmount").empty();
		  	 $("#totalMinusBuy").empty();
		  	 $("#totalMinusSave").empty();
		  	 $("#totalFee").empty();
		  	 $("#totalRemainBuy").empty();
		  	 $("#totalRemainSave").empty();
		  	 $("#avgPrice").empty();
			 $("#totalWeight").append('0.000');
		  	 $("#totalAmount").append('0.00');
		  	 $("#totalMinusBuy").append('0.000');
		  	 $("#totalMinusSave").append('0.000');
		  	 $("#totalFee").append('0.00');
		  	 $("#totalRemainBuy").append('0.000');
		  	 $("#totalRemainSave").append('0.000');
		  	 $("#avgPrice").append('0.00');
			 return false;
		}
	  	 var totalWeight = data.statResult.totalWeight;
	  	 var totalAmount= data.statResult.totalAmount;
	  	 var totalMinusBuy = data.statResult.totalMinusBuy;
	  	 var totalMinusSave = data.statResult.totalMinusSave;
	  	 var totalFee = data.statResult.totalFee;
	  	 var totalRemainBuy = data.statResult.totalRemainBuy;
	  	 var totalRemainSave = data.statResult.totalRemainSave;
	  	 var avgPrice = data.statResult.avgPrice;
	  	 $("#totalWeight").empty();
	  	 $("#totalAmount").empty();
	  	 $("#totalMinusBuy").empty();
	  	 $("#totalMinusSave").empty();
	  	 $("#totalFee").empty();
	  	 $("#totalRemainBuy").empty();
	  	 $("#totalRemainSave").empty();
	  	 $("#avgPrice").empty();
	  	 $("#totalWeight").append(totalWeight?totalWeight:'0.000');
	  	 $("#totalAmount").append(totalAmount?totalAmount:'0.00');
	  	 $("#totalMinusBuy").append(totalMinusBuy?totalMinusBuy:'0.000');
	  	 $("#totalMinusSave").append(totalMinusSave?totalMinusSave:'0.000');
	  	 $("#totalFee").append(totalFee?totalFee:'0.00');
	  	 $("#totalRemainBuy").append(totalRemainBuy?totalRemainBuy:'0.000');
	  	 $("#totalRemainSave").append(totalRemainSave?totalRemainSave:'0.000');
	  	 $("#avgPrice").append(avgPrice?avgPrice:'0.00');
	}
	
</script>
</html>
