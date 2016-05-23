<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp"%>
<html>
<head>
<title>平台待发货</title>
</head>
<body>
	<div class="systemUser">
		<div class="r_main clearfix ">
			<!--文本框 -->
			<div class="main_title">平台待发货</div>
			<div class="main_con clearfix">
			<div class="user_con">
                <ul class="user_now clearfix">
                    <li>
                        <p class="yellow"><span class="f24" id="selfTakeCount"></span>单</p>
                        <p>个人店铺自提</p>
                    </li>
                    <li>
                        <p class="yellow"><span class="f24" id=postTakeCount></span>单</p>
                        <p>个人快递到家</p>
                    </li>
                    <li>
                        <p class="yellow"><span class="f24" id="shopTakeCount"></span>单</p>
                        <p>店铺提金</p>
                    </li>
                </ul>
          	</div>
          	</div>
			<!--文本框 --END-->
			<!-- 搜索框 -->
			
				<div class="main_con">
					<div class="admin_input clearfix">
						
						<div class="personGet">
						<form id="personGetBox">
							<p>订单号：
							 <input type="text" name="orderNo" class="yhgl_input" maxlength="20" />
							</p>
							<p>用户名：
							 <input type="text" name="userName" class="yhgl_input" maxlength="20" />
							</p>
							<p>姓名： 
							 <input type="text" name="userFullName" class="yhgl_input" maxlength="20" />
							</p>
							<p>手机号： 
							 <input type="text" name="userPhone" class="yhgl_input" maxlength="20" />
							</p>
							<p>订单类型：
					          <dim:select name="orderType" enumType="OrderType" headName="全部" headValue=""
					          exclude="BUY,SALE,SAVE,CHANGE,CHANGE_SAVE" cssClass="yhgl_sel"></dim:select>
					        </p>
					        <p>最后操作时间：
							   <input type="text" name="startUpdateTime" value="" class="yhgl_input date" class="Wdate" id="startDate" onclick="WdatePicker({readOnly:true,maxDate:'#F{$dp.$D(\'endDate\')}'})"/>
							   <span class="mr5">至</span> 
							   <input type="text" name="endUpdateTime" value="" class="yhgl_input date" class="Wdate" id="endDate" onclick="WdatePicker({readOnly:true,minDate:'#F{$dp.$D(\'startDate\')}'})"/>
							</p>
							<p>店铺名： 
							  <input type="text" name="shopName" class="yhgl_input" maxlength="20" />
							</p>
							<p style="width:210px;">店铺名称： 
							  <input type="text" name="shopFullName" class="yhgl_input" maxlength="20" />
							</p>
							</form>
							<div id='batchDiv' style="display:none;"></div>
						</div>
						<div class="express" style="display: none;">
						  <form id="expressBox">
							<p>订单号：
							 <input type="text" name="orderNo" class="yhgl_input" maxlength="20" />
							</p>
							<p>用户名：
							 <input type="text" name="userName" class="yhgl_input" maxlength="20" />
							</p>
							<p>姓名：
							  <input type="text" name="userFullName" class="yhgl_input" maxlength="20" />
							</p>
							<p>最后操作时间：
							   <input type="text" name="startUpdateTime" class="yhgl_input date" class="Wdate" id="startDate1" onclick="WdatePicker({readOnly:true,maxDate:'#F{$dp.$D(\'endDate1\')}'})"/>
							   <span class="mr5">至</span> 
							   <input type="text" name="endUpdateTime" class="yhgl_input date" class="Wdate" id="endDate1" onclick="WdatePicker({readOnly:true,minDate:'#F{$dp.$D(\'startDate1\')}'})"/>
							</p>
							</form>
						</div>
						<div class="storeGet" style="display: none;">
						  <form id="storeGetBox">
							<p>订单号：
							 <input type="text" name="orderNo" class="yhgl_input" maxlength="20" />
							</p>
							<p>用户名：
							 <input type="text" name="shopName" class="yhgl_input" maxlength="20" />
							</p>
							<p>店铺名称：
							  <input type="text" name="shopFullName" class="yhgl_input" maxlength="20" />
							</p>
							 <p>最后操作时间：
							   <input type="text" name="startUpdateTime"class="yhgl_input date" class="Wdate" id="startDate2" onclick="WdatePicker({readOnly:true,maxDate:'#F{$dp.$D(\'endDate2\')}'})"/>
							   <span class="mr5">至</span> 
							   <input type="text" name="endUpdateTime" class="yhgl_input date" class="Wdate" id="endDate2" onclick="WdatePicker({readOnly:true,minDate:'#F{$dp.$D(\'startDate2\')}'})"/>
							</p>
							</form>
						</div>
						<p class="lo_btn">
							<input  type="button" class="search" value="搜索" id="searchBnt"/> 
							<shiro:hasPermission name="YWGL_WLGL_PTDFH_ZT_DC"><div class="personGet fl" style="width:84px;">
							<input name="input" type="button" class="export ml10"value="导出" onclick="exportData('personGetBox','<%=basePath%>business/logisticsMgt/wdPersonGetExport.do');" /></div>
							</shiro:hasPermission>
							<shiro:hasPermission name="YWGL_WLGL_PTDFH_DJ_DC"><div class="express fl" style="width:84px;">
							<input name="input" type="button" class="export ml10"value="导出" onclick="exportData('expressBox','<%=basePath%>business/logisticsMgt/wdExpressExport.do');"/></div>
							</shiro:hasPermission>
							<shiro:hasPermission name="YWGL_WLGL_PTDFH_TJ_DC"><div class="storeGet fl" style="width:84px;">
							<input name="input" type="button" class="export ml10"value="导出" onclick="exportData('storeGetBox','<%=basePath%>business/logisticsMgt/wdStoreGetExport.do');"/></div>
							</shiro:hasPermission>
							
							<shiro:hasPermission name="YWGL_WLGL_PTDFH_ZT_PLFH"><div class="personGet fl" style="width:84px; padding-left:15px;">
							<input	name="input" type="button" class="btn_cs ml10" value="批量发货" onclick="sendBatch('persOrder');" />
							</div></shiro:hasPermission>
							<%--  <shiro:hasPermission name="YWGL_WLGL_PTDFH_DJ_PLFH"><div class="express fl" style="width:84px; padding-left:15px;">
							<input	name="input" type="button" class="btn_cs ml10" value="批量发货"  onclick="sendBatch('exprOrder');"/>
							</div></shiro:hasPermission>  --%>
							<shiro:hasPermission name="YWGL_WLGL_PTDFH_TJ_PLFH"><div class="storeGet fl" style="width:84px; padding-left:15px;">
							<input	name="input" type="button" class="btn_cs ml10" value="批量发货"  onclick="sendBatch('shopOrder');"/>
							</div></shiro:hasPermission>
						</p>
					</div>
				</div>
			<!--搜索表框  --END-->
			<div class="main_con">
				<div class="menubox clearfix">
					<ul>
						<li class="hover" id="personGet"><a href="#">个人店铺自提</a></li>
						<li id="express" ><a href="#">个人快递到家</a></li>
						<li id="storeGet" ><a href="#">店铺提金</a></li>
					</ul>
				</div>
				<!-- 个人店铺自提 -->
				<div class=" personGet">
					<table width="100%" border="0" cellspacing="0" cellpadding="3" 
						class="main_table tc">
						<thead>
						<tr class="title">
							<td align="center"><input id="personGetGridAll" onclick="selectAll('personGetGrid');"  type="checkbox" /> 全选</td>
							<td align="center">序号</td>
							<td align="center">订单号</td>
							<td align="center">用户名</td>
							<td align="center">姓名</td>
							<td align="center">手机号</td>
							<td align="center">店铺名</td>
							<td align="center">店铺名称</td>
							<td align="center">订单类型</td>
							<td align="center">提金克重(克)</td>
							<td align="center">手续费(元)</td>
							<td align="center">最后操作时间</td>
							<td align="center">状态</td>
							<td align="center">操作</td>
						</tr>
						</thead><tbody id="personGetGrid"></tbody>
					</table>
				</div>
				<!-- 个人店铺自提  END -->
                <!-- 个人快递到家 -->
				<div class=" express" style="display: none">
				  <table width="100%" border="0" cellspacing="0" cellpadding="3" class="main_table tc">
					<thead>
					<tr class="title">
						<td><input id="expressGridAll" onclick="selectAll('expressGrid');"  type="checkbox" /> 全选</td>
						<td align="center">序号</td>
						<td align="center">订单号</td>
						<td align="center">用户名</td>
						<td align="center">姓名</td>
						<td align="center">手机号</td>
						<td align="center">订单类型</td>
						<td align="center">提金克重(克)</td>
						<td align="center">加工费(元)</td>
						<td align="center">邮保费(元)</td>
						<td align="center">制品</td>
						<td align="center">数量(件)</td>
						<td align="center">最后操作时间</td>
						<td align="center">状态</td>
						<td align="center">操作</td>
					</tr>
					</thead><tbody id="expressGrid"></tbody>
				  </table>
				</div>
				<!-- 个人快递到家 --END -->
				<!-- 店铺提金 -->
				<div class=" storeGet" style="display: none"
					id="histCont">
					<table width="100%" border="0" cellspacing="0" cellpadding="3" class="main_table tc">
						<thead>
						<tr class="title">
						    <td><input id="storeGetGridAll" onclick="selectAll('storeGetGrid');"  type="checkbox" /> 全选</td>
							<td align="center">序号</td>
							<td align="center">订单号</td>
							<td align="center">用户名</td>
							<td align="center">店铺名称</td>
							<td align="center">订单类型</td>
							<td align="center">提金克重(克)</td>
							<td align="center">手续费(元)</td>
							<td align="center">最后操作时间</td>
							<td align="center">状态</td>
							<td align="center">操作</td>
						</tr>
						</thead><tbody id="storeGetGrid"></tbody>
					</table>
				</div>
				<!-- 店铺提金 --END -->
				<!--分页-->
		        <div class="mt10">
		          	<p class="fl"> 提金克重合计：<span class="yellow f24" id="totalWeight"></span>克</p>
		          	<p id="shouxuf" class="ml100 fl">手续费合计：<span class="yellow f24" id="totalFee"></span>元</p>
		          	<p class="express ml100 fl">加工费合计：<span class="yellow f24" id="totalPorcessFee"></span>元</p>
		          	<p class="express ml100 fl">邮保费合计：<span class="yellow f24" id="totalPostFee"></span>元</p>
		        </div> 
				<div  class="paging" id="pageTag"></div>
				<!--分页  --END-->
			</div>
		</div>
	</div>
</body>
<c:if test="${errMsg ne null}">
<script type="text/javascript">
//错误提示
dm.alert(decodeURIComponent('${errMsg}'));
</script>
</c:if>
<!-- 个人店铺自提  GridList数据 -->
<script id="personGetTemp" type="text/x-jquery-tmpl">
{{each(index) list}}
       <tr {{if index %2 == 0}}class="grey" {{/if}}>
		<td style="display:none;"><input name="tableId" value='{{= id}}' type='text'/></td>
		{{if status=='SYS_CANCEL'}}
			<td><input disabled="false" value='{{= id}}' type='checkbox'/></td> 
        {{/if}}
        {{if status!='SYS_CANCEL'}}
			<td><input type='checkbox' onclick="selectOrder('persOrder','{{= id}}','{{= shopName}}',this,'{{= userName}}');"/></td> 
        {{/if}}
		<td>{{= index+1+((pageIndex-1)*pageSize)}}</td>
        <td>{{= orderNo}}</td> 
	    <td>{{= userName}}</td>
	    <td>{{= userFullName}}</td>
        <td>{{= userPhone}}</td> 
	    <td>{{= shopName}}</td>
	    <td>{{= shopFullName}}</td>
        <td>{{= orderTypeName}}</td> 
		<td>{{= takeWeight}}</td>
        <td>{{= fee}}</td>
		<td>{{= updateTime}}</td>
		<td>{{= statusName}}</td>
        {{if status=='SYS_CANCEL'}}
         <td>
			<a  href="orderDetailPersTak.do?id={{= id}}&url=waitDispatch.do&tableId=personGet&orderType={{= orderType}}&t=<%=Math.random() %>" class="orange">订单详情</a>
		 </td>
        {{/if}}
        {{if status!='SYS_CANCEL'}}
		<td><shiro:hasPermission name="YWGL_WLGL_PTDFH_ZT_FH">
			<a  href="<%=basePath %>business/logisticsMgt/personGetSend.do?id={{= id}}&t=<%=Math.random() %>" class="orange">发货</a>
			</shiro:hasPermission><shiro:hasPermission name="YWGL_WLGL_PTDFH_ZT_ZF">
<a  href="javascript:persInvalid({{= id}})" class="changeStatus orange">作废</a></shiro:hasPermission>
		</td>
        {{/if}}
       </tr>
{{/each}}
</script>
<!-- 个人快递到家  GridList数据 -->
<script id="expressTemp" type="text/x-jquery-tmpl">
{{each(index) list}}
       <tr {{if index %2 == 0}}class="grey" {{/if}}>
		<td style="display:none;"><input name="tableId" value='{{= id}}' type='text'/></td>
		{{if status=='SYS_CANCEL'}}
			<td><input disabled="false" value='{{= id}}' type='checkbox'/></td> 
        {{/if}}
        {{if status!='SYS_CANCEL'}}
			<td><input type='checkbox' onclick="selectOrder('exprOrder','{{= id}}','{{= shopName}}',this,'{{= userName}}');"/></td> 
        {{/if}} 
		<td>{{= index+1+((pageIndex-1)*pageSize)}}</td> 
	    <td>{{= orderNo}}</td>
	    <td>{{= userName}}</td>
        <td>{{= userFullName}}</td> 
	    <td>{{= userPhone}}</td>
        <td>{{= orderTypeName}}</td>
        <td>{{= takeWeight}}</td>
        <td>{{= fee}}</td>
		<td>{{= postFee}}</td>
        <td>{{= productName}}</td>
		<td>{{= productCount}}</td>
		<td>{{= updateTime}}</td>
		<td>{{= statusName}}</td>
		{{if status=='SYS_CANCEL'}}
         <td>
			<a  href="orderDetailExprTak.do?id={{= id}}&url=waitDispatch.do&tableId=express&orderType={{= orderType}}&t=<%=Math.random() %>" class="orange">订单详情</a>
		 </td>
        {{/if}}
        {{if status!='SYS_CANCEL'}}
		<td><shiro:hasPermission name="YWGL_WLGL_PTDFH_DJ_FH">
			<a  href="<%=basePath %>business/logisticsMgt/expressSend.do?id={{= id}}&t=<%=Math.random() %>" class="orange">发货</a>
			</shiro:hasPermission><shiro:hasPermission name="YWGL_WLGL_PTDFH_DJ_ZF">
<a  href="javascript:exprInvalid({{= id}})" class="changeStatus orange">作废</a></shiro:hasPermission>
		</td>
        {{/if}}
       </tr>
{{/each}}
</script>
<!-- 店铺提金  GridList数据 -->
<script id="storeGetTemp" type="text/x-jquery-tmpl">
{{each(index) list}}
       <tr {{if index %2 == 0}}class="grey" {{/if}}>
		<td style="display:none;"><input name="tableId" value='{{= id}}' type='text'/></td>
		{{if status=='SYS_CANCEL'}}
			<td><input disabled="false" value='{{= id}}' type='checkbox'/></td> 
        {{/if}}
        {{if status!='SYS_CANCEL'}}
			<td><input type='checkbox' onclick="selectOrder('shopOrder','{{= id}}','{{= shopName}}',this,'{{= userName}}');"/></td> 
        {{/if}}
        <td>{{= index+1+((pageIndex-1)*pageSize)}}</td> 
	    <td>{{= orderNo}}</td>
	    <td>{{= shopName}}</td>
        <td>{{= shopFullName}}</td>
        <td>{{= orderTypeName}}</td>
		<td>{{= bookWeight}}</td>
		<td>{{= fee}}</td>
		<td>{{= updateTime}}</td>
		<td>{{= statusName}}</td>
		{{if status=='SYS_CANCEL'}}
         <td>
			<a  href="orderDetailShopTak.do?id={{= id}}&url=waitDispatch.do&tableId=storeGet&orderType={{= orderType}}&t=<%=Math.random() %>" class="orange">订单详情</a>
		 </td>
        {{/if}}
        {{if status!='SYS_CANCEL'}}
		<td><shiro:hasPermission name="YWGL_WLGL_PTDFH_TJ_FH">
			<a  href="<%=basePath %>business/logisticsMgt/shopTakeSend.do?id={{= id}}&t=<%=Math.random() %>" class="orange">发货</a>
</shiro:hasPermission><shiro:hasPermission name="YWGL_WLGL_PTDFH_TJ_ZF">			
<a  href="javascript:shopInvalid({{= id}})" class="changeStatus orange">作废</a></shiro:hasPermission>
		</td>
        {{/if}}
       </tr>
{{/each}}
</script>
<script type="text/javascript">
        //页面加载时调用
        $(document).ready(function(){
    	  //为'个人店铺自提'选项卡添加单击事件
    	  $("#personGet").click(function(){
    		  $(this).addClass("hover");
    		  $("#express").removeClass("hover");
    		  $("#storeGet").removeClass("hover");
    		  $(".express").css("display","none");
    		  $(".storeGet").css("display","none");
    		  $(".personGet").css("display","block");
    		  //显示手工费
    		  $("#shouxuf").css("display","block");
    		  //取绑'查询按钮'单击事件
    		  $("#searchBnt").unbind('click');
    		  //绑定'查询按钮'单击事件
    		  $("#searchBnt").click(function(){
    			  //查询时重置 缓存订单id
    			  persIds = new Array();
      			  exprIds = new Array();
                  storIds = new Array();
    			  DMGold.ajax({"formId":"personGetBox","serialize":true,"url":"wdPersonGetAjax.do","success":initPersonGet});
    		  });
    		  $("#searchBnt").trigger('click');
    		  //初始化导出时间
    		  $("#wdExport").click(function(){
    			  exportData('personGetBox','<%=basePath%>business/logisticsMgt/wdPersonGetExport.do');
    		  });
    		  //初始化批量发货按钮事件
    		  $("#batchSendBtn").unbind('click');
    		  $("#batchSendBtn").click(function(){
    			  sendBatch('persOrder');
    		  });
    	  });
    	//为'个人快递到家'选项卡添加单击事件
    	  $("#express").click(function(){
    		  $(this).addClass("hover");
    		  $("#personGet").removeClass("hover");
    		  $("#storeGet").removeClass("hover");
    		  $(".personGet").css("display","none");
    		  $(".storeGet").css("display","none");
    		  $(".express").css("display","block");
    		  //隐藏手工费
    		  $("#shouxuf").css("display","none");
    		  //取绑'查询按钮'单击事件
    		  $("#searchBnt").unbind('click');
    		  //绑定'查询按钮'单击事件
    		  $("#searchBnt").click(function(){
    			//查询时重置 缓存订单id
    			  persIds = new Array();
      			  exprIds = new Array();
                  storIds = new Array();
    			  DMGold.ajax({"formId":"expressBox","serialize":true,"url":"wdExpressAjax.do","success":initExpress});
    		  });
    		  $("#searchBnt").trigger('click');
    		//初始化导出时间
    		  $("#wdExport").click(function(){
    			  exportData('personGetBox','<%=basePath%>business/logisticsMgt/wdExpressExport.do');
    		  });
    		//初始化批量发货按钮事件
    		  $("#batchSendBtn").unbind('click');
    		  $("#batchSendBtn").click(function(){
    			  sendBatch('exprOrder');
    		  });
    	  });
    	//为'店铺提金'选项卡添加单击事件
    	  $("#storeGet").click(function(){
    		  $(this).addClass("hover");
    		  $("#personGet").removeClass("hover");
    		  $("#express").removeClass("hover");
    		  $(".personGet").css("display","none");
    		  $(".express").css("display","none");
    		  $(".storeGet").css("display","block");
    		  //显示手工费
    		  $("#shouxuf").css("display","block");
    		  //取绑'查询按钮'单击事件
    		  $("#searchBnt").unbind('click');
    		  //绑定'查询按钮'单击事件
    		  $("#searchBnt").click(function(){
    			//查询时重置 缓存订单id
    			  persIds = new Array();
      			  exprIds = new Array();
                  storIds = new Array();
    			  DMGold.ajax({"formId":"storeGetBox","serialize":true,"url":"wdStoreGetAjax.do","success":initStoreGet});
    		  });
    		  $("#searchBnt").trigger('click');
    		//初始化导出时间
    		  $("#wdExport").click(function(){
    			  exportData('personGetBox','<%=basePath%>business/logisticsMgt/wdStoreGetExport.do');
    		  });
    		//初始化批量发货按钮事件
    		  $("#batchSendBtn").unbind('click');
    		  $("#batchSendBtn").click(function(){
    			  sendBatch('shopOrder');
    		  });
    	  });
    	  //初始化加载'个人店铺自提'
    	  $("#${tabIndex}").click();
    	  //初始化统计信息
    	  initStat();
        });
        //初始化--个人店铺自提
     	function initPersonGet(data){
     		//清空表格数据
     		$("#personGetGrid").empty();
     		//填充数据
    		 $('#personGetTemp').tmpl(data.pageResult).appendTo("#personGetGrid");
    		//初始化分页标签
    		DMGold.PageTag.init({"divId":"pageTag","formId":"personGetBox","curPage":data.pageResult.pageIndex,"totalCount":data.pageResult.recordCount,
    			          "pageCount":data.pageResult.pageTotal,"url":"wdPersonGetAjax.do","toPageCallBack":initPersonGet});
    		//初始化统计信息
    		if(!data.statResult){
    			$("#totalWeight").empty();
   	  	  	    $("#totalFee").empty();
   	  		    $("#totalWeight").append(0);
	  	  	    $("#totalFee").append(0);
   	  	  	    return ;
    		}
    		 $("#totalWeight").empty();
	  	  	 $("#totalFee").empty();
	  	  	 var totalWeight = data.statResult.totalWeight;
	  	  	 var totalFee= data.statResult.totalFee;
	  	  	 $("#totalWeight").append(totalWeight);
	  	  	 $("#totalFee").append(totalFee);
	  	  	 
	  	  	 //初始化checkbox选中状态
	  	  	initCKStatus('personGetGrid',persIds,'personGetGridAll');
     	};
     	//初始化--个人快递到家
     	function initExpress(data){
     		//清空表格数据
     		$("#expressGrid").empty();
     		//填充数据
    		 $('#expressTemp').tmpl(data.pageResult).appendTo("#expressGrid");
    		//初始化分页标签
    		DMGold.PageTag.init({"divId":"pageTag","formId":"personGetBox","curPage":data.pageResult.pageIndex,"totalCount":data.pageResult.recordCount,
    			          "pageCount":data.pageResult.pageTotal,"url":"wdExpressAjax.do","toPageCallBack":initExpress});
    		
    		//初始化统计信息
    		if(!data.statResult){
    			$("#totalWeight").empty();
   	  	  	    $("#totalFee").empty();
   	  	  	    $("#totalPorcessFee").empty();
   	  	  		$("#totalPostFee").empty();
   	  		    $("#totalWeight").append(0);
	  	  	    $("#totalFee").append(0);
	  	  	    $("#totalPorcessFee").append(0);
	  	  	    $("#totalPostFee").append(0);
   	  	  	    return ;
    		}
    		 $("#totalWeight").empty();
	  	  	 $("#totalFee").empty();
	  	  	 $("#totalPorcessFee").empty();
	  	  	 $("#totalPostFee").empty();
	  	  	 var totalWeight = data.statResult.totalWeight;
	  	  	 var totalFee= data.statResult.totalFee;
	  	  	 var totalPostFee= data.statResult.totalPostFee;
	  	  	 $("#totalWeight").append(totalWeight);
	  	  	 $("#totalFee").append(totalFee);
	  	  	 $("#totalPorcessFee").append(totalFee);
	  	  	 $("#totalPostFee").append(totalPostFee);
	  	    //初始化checkbox选中状态
		  	 initCKStatus('expressGrid',exprIds,'expressGridAll');
     	}
     	//初始化--店铺提金
     	function initStoreGet(data){
     		//清空表格数据
     		$("#storeGetGrid").empty();
     		//填充数据
    		 $('#storeGetTemp').tmpl(data.pageResult).appendTo("#storeGetGrid");
    		//初始化分页标签
    		DMGold.PageTag.init({"divId":"pageTag","formId":"personGetBox","curPage":data.pageResult.pageIndex,"totalCount":data.pageResult.recordCount,
    			          "pageCount":data.pageResult.pageTotal,"url":"wdStoreGetAjax.do","toPageCallBack":initStoreGet});
    		//初始化统计信息
    		if(!data.statResult){
    			$("#totalWeight").empty();
   	  	  	    $("#totalFee").empty();
   	  		    $("#totalWeight").append(0);
	  	  	    $("#totalFee").append(0);
   	  	  	    return ;
    		 }
    		 $("#totalWeight").empty();
	  	  	 $("#totalFee").empty();
	  	  	 var totalWeight = data.statResult.totalWeight;
	  	  	 var totalFee= data.statResult.totalFee;
	  	  	 $("#totalWeight").append(totalWeight);
	  	  	 $("#totalFee").append(totalFee);
	  	   //初始化checkbox选中状态
		  	 initCKStatus('storeGetGrid',storIds,'storeGetGridAll');
     	}
     	//初始化统计数据
     	function initStat(){
     		 DMGold.ajax({"formId":"searchBox","serialize":true,"url":"wdStatAjax.do","success":function(data){
   	  	  	    var selfTakeCount = data.statResult.selfTakeCount;
   	  	  	    var postTakeCount = data.statResult.postTakeCount;
   	  	  	    var shopTakeCount = data.statResult.shopTakeCount;
   	  	  	    $("#selfTakeCount").append(selfTakeCount);
   	  	  	    $("#postTakeCount").append(postTakeCount);
   	  	        $("#shopTakeCount").append(shopTakeCount);
     		 }});
     	}
     	//个人店铺自提：订单作废
        function persInvalid(id){
   	//	 dm.confirm("是否确认作废该订单？",{
   		//		title:"确认",				//标题
   			//	okName:"确定",			//如同confirm确定按钮的value
   			//	cancleName:"取消",		//如同confirm取消按钮的value
   			//	callback:function(){	//按确定的执行的函数
   			//		location.href = "persInvalid.do?id="+id;
   			//	}
   			//});
   		dm.confirm("是否确认作废该订单？",{
				title:"确认",				//标题
				okName:"确定",			//如同confirm确定按钮的value
				cancleName:"取消",		//如同confirm取消按钮的value
				picClass:"d_perfect",
               callback:function(){	//按确定的执行的函数			 
            	   DMGold.ajax({"data":{'id':id},"serialize":true,"url":"persInvalid.do","success":function(data){
						//显示提示信息
						if("000000"==data.code){
							dm.alert(data.description,{"picClass":"d_succeed"});
						}else{
							dm.alert(data.description,{"picClass":"d_error"});
						}
						//刷新个人店铺自提列表
						$("#personGet").click();
					}});
				}
			});

        }
      //快递到家：订单作废
        function exprInvalid(id){
   		 //dm.confirm("是否确认作废该订单？",{
   		 //		title:"确认",				//标题
   		//		okName:"确定",			//如同confirm确定按钮的value
   		//		cancleName:"取消",		//如同confirm取消按钮的value
   		//		callback:function(){	//按确定的执行的函数
   		//			location.href = "exprInvalid.do?id="+id;
   		//		}
   		//	});
	   		dm.confirm("是否确认作废该订单？",{
				title:"确认",				//标题
				okName:"确定",			//如同confirm确定按钮的value
				cancleName:"取消",		//如同confirm取消按钮的value
				picClass:"d_perfect",
	           callback:function(){	//按确定的执行的函数			 
	        	   DMGold.ajax({"data":{'id':id},"serialize":true,"url":"exprInvalid.do","success":function(data){
						//显示提示信息
						if("000000"==data.code){
							dm.alert(data.description,{"picClass":"d_succeed"});
						}else{
							dm.alert(data.description,{"picClass":"d_error"});
						}
						//刷新个人店铺自提列表
						$("#express").click();
					}});
				}
			  });
	    }
      //店铺提金：订单作废
        function shopInvalid(id){
   		// dm.confirm("是否确认作废该订单？",{
   		//		title:"确认",				//标题
   		//		okName:"确定",			//如同confirm确定按钮的value
   		//		cancleName:"取消",		//如同confirm取消按钮的value
   		//		callback:function(){	//按确定的执行的函数
   		//			location.href = "shopInvalid.do?id="+id;
   		//		}
   		//	});
   		dm.confirm("是否确认作废该订单？",{
			title:"确认",				//标题
			okName:"确定",			//如同confirm确定按钮的value
			cancleName:"取消",		//如同confirm取消按钮的value
			picClass:"d_perfect",
           callback:function(){	//按确定的执行的函数			 
        	   DMGold.ajax({"data":{'id':id},"serialize":true,"url":"shopInvalid.do","success":function(data){
					//显示提示信息
					if("000000"==data.code){
						dm.alert(data.description,{"picClass":"d_succeed"});
					}else{
						dm.alert(data.description,{"picClass":"d_error"});
					}
					//刷新个人店铺自提列表
					$("#storeGet").click();
				}});
			}
		  });
        }
      //弹出框
        function popDiv(url){
     	   $.tbox.popup(url);
        }
      //定义全局变量
      //个人店铺自提订单集合对象
      var persIds = new Array();
      //个人快递到家
      var exprIds = new Array();
      //店铺提金
      var storIds = new Array();
      //选择订单Id
     function selectOrder(panel,orderId,shipper,td,userName){
    	//个人店铺自提
		 if(panel=="persOrder"){
			 if(td.checked){
				 persIds[persIds.length] = {"id":orderId,"shipper":shipper,"userName":userName};
			 }else{
				 for(var i=0;i<persIds.length;i++){
					 if(persIds[i].id==orderId){
						 persIds.splice(i,1);
					 }
				 }
			 }
		 }
		//个人快递到家
		 if(panel=="exprOrder"){
			 if(td.checked){
				 exprIds[exprIds.length] = {"id":orderId,"shipper":shipper,"userName":userName};
			 }else{
				 for(var i=0;i<exprIds.length;i++){
					 if(exprIds[i].id==orderId){
						 exprIds.splice(i,1);
					 }
				 }
			 }
		 }
		//店铺提金
		 if(panel=="shopOrder"){
			 if(td.checked){
				 storIds[storIds.length] = {"id":orderId,"shipper":shipper,"userName":userName};
			 }else{
				 for(var i=0;i<storIds.length;i++){
					 if(storIds[i].id==orderId){
						 storIds.splice(i,1);
					 }
				 }
			 }
		 }
     }
      //全选、取消全选           {gird:表格id}
	 function selectAll(grid) {
   		  var allObj = $("#"+grid+"All");
		  var checkObjs = $("#"+grid).find("input[type=checkbox]").not($("input[disabled=false]"));
		  if(allObj.attr("checked")) {
			checkObjs.attr("checked", true);
		  } else {
		 	checkObjs.removeAttr("checked");
		  }
		  for(var i=0;i<checkObjs.length;i++){
			checkObjs[i].onclick();
		  } 
	  };
	  //翻页是初始化checkbox状态{gridId:表格Tbody id,orderIds:初始数据id,selectAllId:全选ckbox id}
	  function initCKStatus(gridId,orderIds,selectAllId){
	  	 if(orderIds.length>0){
	  		 //获取表格下所有的TR标签
	  		 var gridTRs = $("#"+gridId).find("tr");
	  		 //循环所有的tr,查找含有与oId相等的td的tr，将tr中的check置为选中状态
	  		 for(var i=0;i<gridTRs.length;i++){
	  			 var tr = gridTRs[i];
	  			 var id = $(tr).children().first().find('input[name=tableId]').val();
	  			 for(var j=0;j<orderIds.length;j++){
	  				 if(id==orderIds[j].id){
	  					 //选中该tr
	  					 var ckBox = $(tr).find("input[type=checkbox]").not($("input[disabled=false]"));
	  					 if(ckBox){
	  						 ckBox.attr("checked",true);
	  					 }
	  					 break;
	  				 }
	  			 }
	  		 }
	  	 }
	  	 //是否为全选
	  	var checkObjs = $("#"+gridId).find("input[type=checkbox]").not($("input[disabled=false]"));
		for(var i=0;i<checkObjs.length;i++){
			if(!$(checkObjs[i]).attr("checked")){
				$('#'+selectAllId).attr("checked",false);
				return false;
			}
		} 
		$('#'+selectAllId).attr("checked",true);
	  	 
	  }
      //批量发货
      function sendBatch(panel){
    	//个人店铺自提
 		 if(panel=="persOrder"){
 			 //校验是否选择订单
 			 if(persIds.length<1){
 				dm.alert("请选择订单！");
				return false;
 			 }
 			 //当且仅当同一用户或同一店铺是才能批量发货
 			if(!isSameShop(persIds)){
 				dm.alert("批量发货，只适用于同一个店铺！");
				return false;
 			}
 			//构造form表单，发送post请求
 			var pForm = document.createElement("form");
 			pForm.method = "post";
 			pForm.action = "persGetBatcSend.do";
 			//组装参数，发送请求
 			for(var i=0;i<persIds.length;i++){
 				var input = document.createElement("input");
 				input.name="orderIdList";
 				input.value=persIds[i].id;
 				$(pForm).append(input);
 			}
 			pForm.id='smbForm';
 			$("#batchDiv").empty().append(pForm);
 			$("#smbForm").submit();
 		 }
 		//个人快递到家
 		 if(panel=="exprOrder"){
 			 //校验是否选择订单
 			 if(exprIds.length<1){
 				dm.alert("请选择订单！");
				return false;
 			 }
 			 //当且仅当同一用户或同一店铺是才能批量发货
 			if(!isSameUser(exprIds)){
 				dm.alert("批量发货，只适用于同一个用户！");
				return false;
 			}
 			//构造form表单，发送post请求
 			var pForm = document.createElement("form");
 			pForm.method = "post";
 			pForm.action = "expressBatcSend.do";
 			//组装参数，发送请求
 			for(var i=0;i<exprIds.length;i++){
 				var input = document.createElement("input");
 				input.name="orderIdList";
 				input.value=exprIds[i].id;
 				$(pForm).append(input);
 			}
 			pForm.id='smbForm';
 			$("#batchDiv").empty().append(pForm);
 			var flag = false;
 			//跳转之前校验收货人地址是否相同
 			DMGold.ajax({"formId":"smbForm","serialize":true,"url":"verifyAddr.do","success":function(data){
 				if(!data.success){
 					flag = true;
 				}
 			}});
 			if(flag){
 				dm.alert("存在不同收货地址，不能批量发货！");
 				return;
 			}
 			$("#smbForm").submit();
 		 }
 		//店铺提金
 		 if(panel=="shopOrder"){
 			 //校验是否选择订单
 			 if(storIds.length<1){
 				dm.alert("请选择订单！");
				return false;
 			 }
 			 //当且仅当同一用户或同一店铺是才能批量发货
 			//if(!(isSameShop(storIds)||isSameUser(storIds))){
 			if(!(isSameShop(storIds))){
 				dm.alert("批量发货，只适用于同一个店铺名！");
				return false;
 			}
 			//构造form表单，发送post请求
 			var pForm = document.createElement("form");
 			pForm.method = "post";
 			pForm.action = "shopTakeBatcSend.do";
 			//组装参数，发送请求
 			for(var i=0;i<storIds.length;i++){
 				var input = document.createElement("input");
 				input.name="orderIdList";
 				input.value=storIds[i].id;
 				$(pForm).append(input);
 			}
 			pForm.id='smbForm';
 			$("#batchDiv").empty().append(pForm);
 			$("#smbForm").submit();
 		 }
      }
      //判断是否为同一店铺
      function isSameShop(shops){
    	//是否存在不同店铺
			for(var i=0;i<shops.length;i++){
				for(var j=0;j<shops.length;j++){
					if(shops[i].shipper!=shops[j].shipper){
						//dm.alert("存在不同的店铺！");
						return false;
					}
				}
			}
    	return true;
      }
      //判断是否为同一用户
      function isSameUser(users){
    	//是否存在不同用户
			for(var i=0;i<users.length;i++){
				for(var j=0;j<users.length;j++){
					if(users[i].userName!=users[j].userName){
						//dm.alert("存在不同的店铺！");
						return false;
					}
				}
			}
    	return true;
      }
    </script>
</html>
					