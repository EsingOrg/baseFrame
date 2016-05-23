<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp"%>
<html>
<head>
<title>平台已收货</title>
</head>
<body>
		<div class="r_main clearfix ">
			<!--文本框 -->
			<div class="main_title">平台已收货</div>
			<!--文本框 --END-->
			<!-- 搜索框 -->
			<form id="searchBox">
				<div class="main_con">
					<div class="admin_input clearfix">
						<p>
								店铺名： <input type="text" name="shopUserId" class="yhgl_input"
									 maxlength="20" />
						</p>
						<p>
								店铺名称： <input type="text" name="shopName" class="yhgl_input"
									maxlength="20" />
						</p>
						<p>
							物流方：
								 <select name="logistiCompany" class="yhgl_sel">
			                 <option value="">全部</option>
			                 <c:forEach items="${logsReq}" var="item">
			                 <option value="${item }">${item }</option>
			                 </c:forEach>
			                 </select>
						</p>
						<p>
							物流号： <input type="text" name="logistiNo" class="yhgl_input"
								 maxlength="20" />
						</p>
						<p>
							发货方式：
							<dim:select name="sendWay" enumType="SaveGoldStatus" headName="全部" headValue="" exclude="SELF_FROM" cssClass="yhgl_sel"></dim:select>
						</p>
						<p>预约时间： 
						  	<input type="text" name="bookStartTime" value="" class="yhgl_input date" class="Wdate" id="startDate" onclick="WdatePicker({readOnly:true,maxDate:'#F{$dp.$D(\'endDate\')}'})"/>
							<span class="mr5">至</span>
							<input type="text" name="bookEndTime" value="" class="yhgl_input date" class="Wdate" id="endDate" onclick="WdatePicker({readOnly:true,minDate:'#F{$dp.$D(\'startDate\')}'})"/>
				         </p>
						<p class="lo_btn">
							<input type="button" class="search" id="searBtn" value="搜索" /> 
							<shiro:hasPermission name="YWGL_WLGL_PTYSH_GR_DC"><div class="person">
							<input type="button" class="export ml10" value="导出" onclick="exportData('searchBox','exportPerSaveLogisList.do')"/>
							</div></shiro:hasPermission>
							<shiro:hasPermission name="YWGL_WLGL_PTYSH_DP_DC"><div class="shop">
							<input type="button" class="export ml10" value="导出" onclick=" exportData('searchBox','exportShopSaveLogisList.do')"/>
							</div></shiro:hasPermission>
						</p>
					</div>
				</div>
			</form>
			<!--搜索表框  --END-->
			<div class="main_con">
				<div class="menubox clearfix">
					<ul>
						<li id="person"><a href="#">个人存金</a></li>
						<li  id="shop" ><a href="#">店铺存金</a></li>
					</ul>
				</div>
				<!-- 个人存金 -->
				<div class=" person">
					<table width="100%" border="0" cellspacing="0" cellpadding="3" id="allTable"
						class="main_table tc">
						<thead>
						<tr class="title">
							<td align="center">序号</td>
							<td align="center">用户名</td>
							<td align="center">店铺名称</td>
							<td align="center">发货方式</td>
							<td align="center">物流方</td>
							<td align="center">物流号</td>
							<td align="center">预约时间</td>
							<td align="center">订单克重(克)</td>
							<td align="center">实发净重(克)</td>
							<td align="center">平台实收净重(克)</td>
							<td align="center">发货人</td>
							<td align="center">检测克重(克)</td>
							<td align="center">检测人</td>
							<td align="center">最后操作时间</td>
							<td align="center">状态</td>
							<td align="center">操作</td>
						</tr>
						</thead>
						<tbody id="personGrid"></tbody>
					</table>
				</div>
				<!-- 个人存金  END -->
				
                <!-- 店铺存金-->
				<div class=" shop" style="display:none;">
						<table width="100%" border="0" cellspacing="0" cellpadding="3" id="orderTable"
							class="main_table tc">
							<thead>
							<tr class="title">
								<td align="center">序号</td>
								<td align="center">订单号</td>
								<td align="center">用户名</td>
								<td align="center">店铺名称</td>
								<td align="center">发货方式</td>
								<td align="center">物流方</td>
								<td align="center">物流号</td>
								<td align="center">预约时间</td>
								<td align="center">存金克重(克)</td>
								<td align="center">平台实收净重(克)</td>
								<td align="center">发货人</td>
								<td align="center">检测克重(克)</td>
								<td align="center">检测人</td>
								<td align="center">最后操作时间</td>
								<td align="center">状态</td>
								<td align="center">操作</td>
							</tr>
							<thead>
							<tbody id="shopGrid"></tbody>
						</table>
					</div>
				<div class="mt10">
		          	<p class="fl">订单克重合计：<span class="yellow f24" id="orderWeightTotal"></span>克</p>
		          	<p class="ml100 fl">平台实收净重合计：<span class="yellow f24" id="sysNetWeightTotal"></span>克</p>
		          	<p class="ml100 fl">检测克重合计：<span class="yellow f24" id="sysCheckWeightTotal"></span>克</p>
		        </div> 
				<div  class="paging" id="pageTag"></div>
		</div>
	</div>
</body>
<c:if test="${errMsg ne null}">
<script type="text/javascript">
  //错误提示
  dm.alert(decodeURIComponent('${errMsg}'));
</script>
</c:if>
<!-- 个人存金模板 -->
<script id="personTemp" type="text/x-jquery-tmpl">
      {{each(index) list}}
       <tr {{if index %2 == 0}}class="grey" {{/if}}>
		<td>{{= index+1+((pageIndex-1)*pageSize)}}</td>
	    <td>{{= shopUserId}}</td>
	    <td>{{= shopName}}</td>
		<td>{{= logisticType=='POST'?'物流发货':logisticTypeName}}</td>
        <td>{{= logistiCompany}}</td> 
	    <td>{{= logisticNo}}</td>
	    <td>{{= bookTime}}</td>
        <td>{{= orderWeight}}</td> 
		<td>{{= netWeight}}</td>
		<td>{{= sysNetWeight}}</td>
		<td>{{= sendBy}}</td>
		<td>{{= sysCheckWeight}}</td>	
		<td>{{= handler}}</td>	
		<td>{{= lastOperateTime}}</td>	
		<td>{{= statusName}}</td>
		<td><a  href="<%=basePath %>business/logisticsMgt/perSaveByLogis.do?logisticId={{= logisticId}}&t=<%=Math.random() %>" class="orange">查看</a></td>
       </tr>
    {{/each}}
</script>

<!-- 店铺存金模板 -->
<script id="shopTemp" type="text/x-jquery-tmpl">
      {{each(index) list}}
       <tr {{if index %2 == 0}}class="grey" {{/if}}>
		<td>{{= index+1+((pageIndex-1)*pageSize)}}</td>
		<td>{{= orderNo}}</td>
	    <td>{{= shopUserId}}</td>
	    <td>{{= shopName}}</td>
        <td>{{= logisticType=='POST'?'物流发货':logisticTypeName}}</td>
		<td>{{= logistiCompany}}</td>
	    <td>{{= logisticNo}}</td>
	    <td>{{= bookTime}}</td>
        <td>{{= orderWeight}}</td> 
		<td>{{= sysNetWeight}}</td>
		<td>{{= sendBy}}</td>
		<td>{{= sysCheckWeight}}</td>	
		<td>{{= handler}}</td>	
		<td>{{= lastOperateTime}}</td>	
		<td>{{= statusName}}</td>
		<td><a  href="<%=basePath %>business/logisticsMgt/shopSaveDetail.do?id={{= orderId}}&url=received.do&tabIndex=shop&t=<%=Math.random() %>" class="orange">订单详情</a></td>
       </tr>
    {{/each}}
</script>
<script type="text/javascript">
        //页面加载时调用
        $(function(){
    	  //为'全部'选项卡添加单击事件，显示个人存金-全部信息
    	  $("#person").click(function(){
    		  $(this).addClass("hover");
    		  $("#shop").removeClass("hover");
    		  $('#searBtn').unbind("click"); 
    		  $('.shop').css("display","none");
    		  $('.person').css("display","block");
      		  $("#searBtn").click(function(){
      			  DMGold.ajax({"formId":"searchBox","serialize":true,"url":"peronSaveListAjax.do","success":personCallBack});
      		  });
      		 $('#expBtn').unbind("click");
   		  	 $("#expBtn").click(function(){
   			 	 exportData('searchBox','exportPerSaveLogisList.do')
   		  		});
      		  $("#searBtn").trigger('click');
      		  
    	  });
    	  $("#shop").click(function(){
    		  $(this).addClass("hover");
    		  $("#person").removeClass("hover");
    		  $('.person').css("display","none");
    		  $('.shop').css("display","block");
    		  $('#searBtn').unbind("click"); 
      		  $("#searBtn").click(function(){
      			  DMGold.ajax({"formId":"searchBox","serialize":true,"url":"shopSaveListAjax.do","success":shopCallBack});
      		  });
      		 $('#expBtn').unbind("click");
   		  	 $("#expBtn").click(function(){
   			 	 exportData('searchBox','exportShopSaveLogisList.do')
   		  		});
      		  $("#searBtn").trigger('click');
    	  });
    		//默认加载‘个人存金’数据
    	  $("#${tabIndex}").trigger('click');
        });
        
      //person分页跳转回调
     	function personCallBack(data){
     		//清空表格数据
     		$("#personGrid").empty();
     		//填充数据
    		 $('#personTemp').tmpl(data.pageResult).appendTo("#personGrid");
    		//初始化分页标签
    		DMGold.PageTag.init({"divId":"pageTag","formId":"searchBox","curPage":data.pageResult.pageIndex,"totalCount":data.pageResult.recordCount,
    			          "pageCount":data.pageResult.pageTotal,"url":"peronSaveListAjax.do","toPageCallBack":personCallBack});
    		//初始统计信息
	       	DMGold.PageTag.initStat({"orderWeightTotal":null,"sysNetWeightTotal":null,"sysCheckWeightTotal":null},data.total,'0.000');
     	}
     	//shop分页跳转回调
     	function shopCallBack(data){
     		//清空表格数据
     		$("#shopGrid").empty();
     		//填充数据
    		 $('#shopTemp').tmpl(data.pageResult).appendTo("#shopGrid");
    		 $('#personTemp').tmpl(data.pageResult).appendTo("#personGrid");
    		//初始化分页标签
    		DMGold.PageTag.init({"divId":"pageTag","formId":"searchBox","curPage":data.pageResult.pageIndex,"totalCount":data.pageResult.recordCount,
    			          "pageCount":data.pageResult.pageTotal,"url":"shopSaveListAjax.do","toPageCallBack":shopCallBack});
    		//初始统计信息
	       	DMGold.PageTag.initStat({"orderWeightTotal":null,"sysNetWeightTotal":null,"sysCheckWeightTotal":null},data.total,'0.000');
     	}
    </script>
</html>
