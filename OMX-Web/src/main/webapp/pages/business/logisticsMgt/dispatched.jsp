<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp"%>
<html>
<head>
<title>平台已发货</title>
</head>
<body>
		<div class="r_main clearfix ">
			<!--文本框 -->
			<div class="main_title">平台已发货</div>
			<!--文本框 --END-->
			<!-- 搜索框 -->
			<form id="searchBox">
				<div class="main_con">
				<div class="admin_input clearfix">
						<div class="pershop">
							<p>
								店铺名： <input type="text" name="shopUserId" class="yhgl_input"
									 maxlength="20" />
							</p>
							<p>
								店铺名称： <input type="text" name="shopName" class="yhgl_input"
									 maxlength="20" />
							</p>
						</div>
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
						<div class="post" style="display:none;">
							<p>
								用户名： <input type="text" name="userName" class="yhgl_input"
									 maxlength="20" />
							</p>
							<p>
								手机号： <input type="text" name="phoneNumber" class="yhgl_input"
									maxlength="20" />
							</p>							
						</div>
						<p>发货时间： 
						  	<input type="text" name="sendStartTime" value="" class="yhgl_input date" class="Wdate" id="startDate" onclick="WdatePicker({readOnly:true,maxDate:'#F{$dp.$D(\'endDate\')}'})"/>
							<span class="mr5">至</span>
							<input type="text" name="sendEndTime" value="" class="yhgl_input date" class="Wdate" id="endDate" onclick="WdatePicker({readOnly:true,minDate:'#F{$dp.$D(\'startDate\')}'})"/>
				         </p>
				         <div class="pershop">
				        	 <p>
								发货方式：
								<dim:select name="sendWay" enumType="LogisticType" headName="全部" headValue="" exclude="SELF_TO" cssClass="yhgl_sel"></dim:select>
							</p>
						</div>	
						<p class="lo_btn">
							<input type="button" class="search" id="searBtn" value="搜索" /> 
							<shiro:hasPermission name="YWGL_WLGL_PTYFH_ZT_DC"><div id="persShopIdt" class="pershop" >
							<input  type="button" class="export ml10" value="导出" onclick="exportData('searchBox','exportPerShopTakeList.do')"/>
							</div></shiro:hasPermission>
							<shiro:hasPermission name="YWGL_WLGL_PTYFH_GR_DC"><div class="post">
							<input  type="button" class="export ml10" value="导出" onclick="exportData('searchBox','exportPerPostTakeList.do')"/>
							</div></shiro:hasPermission>
							<shiro:hasPermission name="YWGL_WLGL_PTYFH_DP_DC"><div class="shop">
							<input  type="button" class="export ml10" value="导出" onclick="exportData('searchBox','exportShopTakeList.do')"/>
							</div></shiro:hasPermission>
						</p>
					</div>
				</div>
			</form>
			<!--搜索表框  --END-->

			<div class="main_con">
				<div class="menubox clearfix">
					<ul>
						<li class="hover" id="perShop"><a href="#">个人店铺自提</a></li>
						<li id="post" ><a href="#">个人快递提金</a></li>
						<li id="shop" ><a href="#">店铺提金</a></li>
					</ul>
				</div>
				<!-- 个人店铺自提 -->
				<div class=" person" >
					<table width="100%" border="0" cellspacing="0" cellpadding="3" id="perShopTable"
						class="main_table tc">
						<thead>
						<tr class="title">
							<td align="center">序号</td>
							<td align="center">发货方式</td>
							<td align="center">物流方</td>
							<td align="center">物流号</td>
							<td align="center">用户名</td>
							<td align="center">店铺名称</td>
							<td align="center">提金克重(克)</td>
							<td align="center">实发净重(克)</td>
							<td align="center">毛重(克)</td>
							<td align="center">包数(包)</td>
							<td align="center">发货人</td>
							<td align="center">发货时间</td>
							<td align="center">收货人</td>
							<td align="center">收货时间</td>
							<td align="center">状态</td>
							<td align="center">操作</td>
						</tr>
						</thead><tbody id="perShopGrid"></tbody>
					</table>
				</div>
				<!-- 个人店铺自提  END -->
                <!-- 个人快递提金 -->
				<div class=" post" style="display:none;">
						<table width="100%" border="0" cellspacing="0" cellpadding="3" id="postTable"
							class="main_table tc">
							<thead>
							<tr class="title">
								<td align="center">序号</td>
								<td align="center">物流方</td>
								<td align="center">物流号</td>
								<td align="center">用户名</td>
								<td align="center">手机号</td>
								<td align="center">提金克重(克)</td>
								<td align="center">实发净重(克)</td>
								<td align="center">毛重(克)</td>
								<td align="center">包数(包)</td>
								<td align="center">发货人</td>
								<td align="center">发货时间</td>
								<td align="center">收货人</td>
								<td align="center">收货时间</td>
								<td align="center">状态</td>
								<td align="center">操作</td>
							</tr>
						</thead><tbody id="postGrid"></tbody>
						</table>
					</div>
	
					<!-- 个人快递提金 --END -->
					<!-- 店铺提金提金 -->
				<div class=" shop" style="display:none;">
						<table width="100%" border="0" cellspacing="0" cellpadding="3" id="shopTable"
							class="main_table tc">
							<thead>
							<tr class="title">
								<td align="center">序号</td>
								<td align="center">发货方式</td>
								<td align="center">物流方</td>
								<td align="center">物流号</td>
								<td align="center">用户名</td>
								<td align="center">店铺名称</td>
								<td align="center">提金克重(克)</td>
								<td align="center">实发净重(克)</td>
								<td align="center">毛重(克)</td>
								<td align="center">包数(包)</td>
								<td align="center">发货人</td>
								<td align="center">发货时间</td>
								<td align="center">收货人</td>
								<td align="center">收货时间</td>
								<td align="center">状态</td>
								<td align="center">操作</td>
							</tr>
							</thead>
							<tbody id="shopGrid"></tbody>
						</table>
					</div>
					<!-- 店铺提金提金 --END -->
	  		    <div class="mt10">
	  		    	<div class="perpost">
		          	<p class="fl">提金克重合计：<span class="yellow f24" id="orderWeightTotal"></span>克</p>
		          	<p class="ml100 fl">实发净重合计：<span class="yellow f24" id="netWeightTotal"></span>克</p>
		          	</div>
		          	<div class="shop">
		          	<p class="ml100 fl">毛重：<span class="yellow f24" id="grossWeightTotal"></span>克</p>
		          	<p class="ml100 fl">包数：<span class="yellow f24" id="packageCountTotal"></span>包</p>
		          	</div>
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
<!-- 个人到店铺提金模板 -->
<script id="perShopTemp" type="text/x-jquery-tmpl">
      {{each(index) list}}
       <tr {{if index %2 == 0}}class="grey" {{/if}}>
		<td>{{= index+1+((pageIndex-1)*pageSize)}}</td>
	    <td>{{= logisticTypeName}}</td>
	    <td>{{= logistiCompany}}</td>
        <td>{{= logisticNo}}</td> 
	    <td>{{= shopUserId}}</td>
	    <td>{{= shopName}}</td>
        <td>{{= orderWeight}}</td> 
		<td>{{= netWeight}}</td>
		<td>{{= grossWeight}}</td>
		<td>{{= packageCount}}</td>
		<td>{{= sendBy}}</td>
		<td>{{= sendTime}}</td>	
		<td>{{= receiveBy}}</td>	
		<td>{{= receiveTime}}</td>	
		<td>{{= statusName}}</td>	
		<td><a  href="<%=basePath %>business/logisticsMgt/perTakeByLogistic.do?logisticId={{= logisticId}}&t=<%=Math.random() %>" class="orange">查看</a></td>
       </tr>
    {{/each}}
</script>
<!-- 个人快递提金模板 -->
<script id="postTemp" type="text/x-jquery-tmpl">
      {{each(index) list}}
       <tr {{if index %2 == 0}}class="grey" {{/if}}>
		<td>{{= index+1+((pageIndex-1)*pageSize)}}</td>
	    <td>{{= logistiCompany}}</td>
        <td>{{= logisticNo}}</td> 
	    <td>{{= userName}}</td>
	    <td>{{= phoneNumber}}</td>
        <td>{{= orderWeight}}</td> 
		<td>{{= netWeight}}</td>
		<td>{{= grossWeight}}</td>
		<td>{{= packageCount}}</td>
		<td>{{= sendBy}}</td>
		<td>{{= sendTime}}</td>	
		<td>{{= receiveBy}}</td>	
		<td>{{= receiveTime}}</td>	
		<td>{{= statusName}}</td>	
		<td><a  href="<%=basePath %>business/logisticsMgt/postTakeByLogistic.do?logisticId={{= logisticId}}&t=<%=Math.random() %>" class="orange">查看</a></td>
       </tr>
    {{/each}}
</script>
<!-- 店铺提金模板 -->
<script id="shopTemp" type="text/x-jquery-tmpl">
      {{each(index) list}}
       <tr {{if index %2 == 0}}class="grey" {{/if}}>
		<td>{{= index+1+((pageIndex-1)*pageSize)}}</td>
	    <td>{{= logisticType=='POST'?'物流发货':logisticTypeName}}</td>
	    <td>{{= logistiCompany}}</td>
        <td>{{= logisticNo}}</td> 
	    <td>{{= shopUserId}}</td>
	    <td>{{= shopName}}</td>
        <td>{{= orderWeight}}</td> 
		<td>{{= netWeight}}</td>
		<td>{{= grossWeight}}</td>
		<td>{{= packageCount}}</td>
		<td>{{= sendBy}}</td>
		<td>{{= sendTime}}</td>	
		<td>{{= receiveBy}}</td>	
		<td>{{= receiveTime}}</td>	
		<td>{{= statusName}}</td>	
		<td><a  href="<%=basePath %>business/logisticsMgt/shopTakeByLogistic.do?logisticId={{= logisticId}}&t=<%=Math.random() %>" class="orange">查看</a></td>
       </tr>
    {{/each}}
</script>
<script type="text/javascript">
        //页面加载时调用
        $(function(){
    	  //为'个人店铺自提'选项卡添加单击事件
    	  $("#perShop").click(function(){
    		  $(this).addClass("hover");
    		  $("#post").removeClass("hover");
    		  $("#shop").removeClass("hover");
    		  $('.perpost').css("display","block");
    		  $(".pershop").css("display","block");
    		  $(".shop").css("display","none");
    		  $(".post").css("display","none");
    		  $(".person").css("display","block");
    		  //添加查询事件
    		  $('#searBtn').unbind("click"); //取绑‘click’事件
    		  $("#searBtn").click(function(){
    			  DMGold.ajax({"formId":"searchBox","serialize":true,"url":"perShopTakeAjax.do","success":personCallBack});
    		  });
    		  $('#expBtn').unbind("click");
    		  $("#expBtn").click(function(){
    			  exportData('searchBox','exportPerShopTakeList.do')
    		  });
    		  $("#searBtn").trigger('click');
    		  
    	  });
    	//为'个人快递'选项卡添加单击事件，
    	  $("#post").click(function(){
    		  $(this).addClass("hover");
    		  $("#perShop").removeClass("hover");
    		  $("#shop").removeClass("hover");
    		  $('.perpost').css("display","block");
    		  $(".pershop").css("display","none");
    		  $(".person").css("display","none");
    		  $(".shop").css("display","none");
    		  $(".post").css("display","block");
    		//添加查询事件
    		  $('#searBtn').unbind("click"); 
    		  $("#searBtn").click(function(){
    			  DMGold.ajax({"formId":"searchBox","serialize":true,"url":"perPostTakeAjax.do","success":postCallBack});
    		  });
    		  $("#searBtn").trigger('click');
    		  $('#expBtn').unbind("click");
    		  $("#expBtn").click(function(){
    			  exportData('searchBox','exportPerPostTakeList.do')
    		  });
    	  });
      //为'店铺提金'选项卡添加单击事件
  	  $("#shop").click(function(){
  		  $(this).addClass("hover");
  		  $("#perShop").removeClass("hover");
  		  $('.perpost').css("display","block");
  		  $("#post").removeClass("hover");
  		  $(".pershop").css("display","block");
  		  $("#persShopIdt").css("display","none");
  		  $(".person").css("display","none");
  		  $(".post").css("display","none");
  		  $(".shop").css("display","block");
  		//添加查询事件
  		  $('#searBtn').unbind("click"); 
  		  $("#searBtn").click(function(){
  			  DMGold.ajax({"formId":"searchBox","serialize":true,"url":"shopTakeAjax.do","success":shopCallBack});
  		  });
  		  $("#searBtn").trigger('click');
  		$('#expBtn').unbind("click");
		  $("#expBtn").click(function(){
			  exportData('searchBox','exportShopTakeList.do')
		  });
  	  });
      //默认加载‘个人店铺自提’数据
  	  $("#${tabIndex}").trigger('click');
      });
        
       //person分页跳转回调
     	function personCallBack(data){
     		//清空表格数据
     		$("#perShopGrid").empty();
     		$('#perShopTemp').tmpl(data.pageResult).appendTo("#perShopGrid");
     		//初始统计信息
	       	DMGold.PageTag.initStat({"orderWeightTotal":null,"netWeightTotal":null},data.total,'0.000');
    		//初始化分页标签
    		DMGold.PageTag.init({"divId":"pageTag","formId":"searchBox","curPage":data.pageResult.pageIndex,"totalCount":data.pageResult.recordCount,
    			          "pageCount":data.pageResult.pageTotal,"url":"perShopTakeAjax.do","toPageCallBack":personCallBack});
     	}
     	//post分页跳转回调
     	function postCallBack(data){
     		//清空表格数据
     		$("#postGrid").empty();
     		//填充数据
    		$('#postTemp').tmpl(data.pageResult).appendTo("#postGrid");
    		//初始统计信息
 	       	DMGold.PageTag.initStat({"orderWeightTotal":null,"netWeightTotal":null},data.total,'0.000');
    		//初始化分页标签
    		DMGold.PageTag.init({"divId":"pageTag","formId":"searchBox","curPage":data.pageResult.pageIndex,"totalCount":data.pageResult.recordCount,
    			          "pageCount":data.pageResult.pageTotal,"url":"perPostTakeAjax.do","toPageCallBack":postCallBack});
     	}
     	//shop分页跳转回调
     	function shopCallBack(data){
     		//清空表格数据
     		$("#shopGrid").empty();
     		//填充数据
    		 $('#shopTemp').tmpl(data.pageResult).appendTo("#shopGrid");
     		
    		//初始统计信息
 	       	DMGold.PageTag.initStat({"orderWeightTotal":null,"netWeightTotal":null,"grossWeightTotal":null},data.total,'0.000');
 	     //初始统计信息
 	       	DMGold.PageTag.initStat({"packageCountTotal":null},data.total,'0');
    		//初始化分页标签
    		DMGold.PageTag.init({"divId":"pageTag","formId":"searchBox","curPage":data.pageResult.pageIndex,"totalCount":data.pageResult.recordCount,
    			          "pageCount":data.pageResult.pageTotal,"url":"shopTakeAjax.do","toPageCallBack":shopCallBack});
     	}

    </script>
                                                                                
</html>
