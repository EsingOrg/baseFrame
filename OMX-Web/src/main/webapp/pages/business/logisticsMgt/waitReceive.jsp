<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp"%>
<html>
<head>
<title>平台待收货</title>
</head>
<body>
	<div>
		<div class="r_main clearfix ">
			<!--文本框 -->
			<div class="main_title">平台待收货</div>
			<div class="main_con clearfix">
			<div class="user_con">
                <ul class="user_now clearfix">
                    <li>
                        <p class="yellow"><span class="f24" id="personalSaveCount"></span>个</p>
                        <p>个人存金</p>
                    </li>
                    <li>
                        <p class="yellow"><span class="f24" id=shopSaveCount></span>个</p>
                        <p>店铺存金</p>
                    </li>
                </ul>
          	</div>
          	</div>
			<!--文本框 --END-->
			<!-- 搜索框 -->
			<form id="searchBox">
				<div class="main_con">
					<div class="admin_input clearfix">
				      <div class="shopSave">
							<p>
								订单号： <input type="text" name="orderNo" class="yhgl_input"
									 maxlength="23" />
							</p>
						</div>
						<p>店铺名： 
						  <input type="text" name="shopName" class="yhgl_input" maxlength="20" />
						</p>
						<p>发货方式：
					      <dim:select name="logisticType" enumType="SaveGoldStatus" headName="全部" headValue="" exclude="delete" cssClass="yhgl_sel"></dim:select>
					    </p>
						<p>物流方：
						  <!-- <input type="text" name="logisticCompany" class="yhgl_input" maxlength="20" /> -->
						   <select name="logisticCompany" class="yhgl_sel">
			                 <option value="">全部</option>
			                 <c:forEach items="${logsReq}" var="item">
			                 <option value="${item }">${item }</option>
			                 </c:forEach>
			                 </select>
						</p>
						<p>物流号：
						  <input type="text" name="logisticNo" class="yhgl_input" maxlength="20" />
						</p>
						<div class="personSave">
						<p>发货人： 
						  <input type="text" name="sendBy" class="yhgl_input" maxlength="20" />
						</p></div>
						<p>预约时间：
							   <input type="text" name="startBookTime"  class="yhgl_input date" class="Wdate" id="startDate" onclick="WdatePicker({readOnly:true,maxDate:'#F{$dp.$D(\'endDate\')}'})"/>
							   <span class="mr5">至</span> 
							   <input type="text" name="endBookTime"  class="yhgl_input date" class="Wdate" id="endDate" onclick="WdatePicker({readOnly:true,minDate:'#F{$dp.$D(\'startDate\')}'})"/>
						</p>
						<p >店铺名称： 
							  <input type="text" name="shopFullName" class="yhgl_input" maxlength="20" />
						</p>
						<p class="lo_btn" style="width:80px;">
							<input type="button" class="search" id="searchBtn" value="查询" /> 
						<shiro:hasPermission name="YWGL_WLGL_PTDSH_GR_DC"><div class="personSave">
							<input type="button" class="export ml10" value="导出" onclick=" exportData('searchBox','exportSysReceivePerSave.do');"/>
							</div></shiro:hasPermission>
							<shiro:hasPermission name="YWGL_WLGL_PTDSH_DP_DC"><div class="shopSave">
							<input type="button" class="export ml10" value="导出" onclick="exportData('searchBox','exportSysReceiveShopSave.do');"/>
							</div></shiro:hasPermission>
						</p>
					</div>
				</div>
			</form>
			<!--搜索表框  --END-->
			<div class="main_con">
				<div class="menubox clearfix">
					<ul>
						<li id="personSave"><a href="#">个人存金</a></li>
						<li id="shopSave" ><a href="#">店铺存金</a></li>
					</ul>
				</div>
				<!-- 个人存金 -->
				<div class="personSave">
				<div class=" personSave">
					<table width="100%" border="0" cellspacing="0" cellpadding="3" class="main_table tc">
					  <thead> 
						<tr class="title">
							<td align="center">序号</td>
							<td align="center">用户名</td>
							<td align="center">店铺名称</td>
							<td align="center">发货方式</td>
							<td align="center">物流方</td>
							<td align="center">物流号</td>
							<td align="center">预约时间</td>
							<td align="center">订金克重(克)</td>
							<td align="center">实发净重(克)</td>
							<td align="center">毛重(克)</td>
							<td align="center">包数(包)</td>
							<td align="center">发货人</td>
							<td align="center">发货时间</td>
							<td align="center">状态</td>
							<td align="center">操作</td>
						</tr>
					   </thead><tbody id='personSaveGrid'></tbody>
					</table>
					</div>
					</div>
				<!-- 个人存金  END -->
                <!-- 店铺存金 -->
                <div style="display:none" class="shopSave">
				 <div class=" " 	id="histCont">
						<table width="100%" border="0" cellspacing="0" cellpadding="3" class="main_table tc">
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
								<td align="center">毛重(克)</td>
								<td align="center">包数(包)</td>
								<td align="center">发货人</td>
								<td align="center">提交时间</td>
								<td align="center">状态</td>
								<td align="center">操作</td>
							</tr>
						  </thead><tbody id="shopSaveGrid"></tbody>
						</table>
					 </div>
					</div>
					<!-- 店铺存金 --END -->
					<!-- 统计信息 -->
					<div class="mt10 personSave">
		          	<p class="fl">订单克重：<span class="yellow f24" id="totalOrderWeight"></span>克</p>
		          	<p class="ml100 fl">实发净重：<span class="yellow f24" id="totalSysNetWeight"></span>克</p>
		          	</div>
		          	<div class="shopSave"><p class="ml100 fl">存金克重：<span class="yellow f24" id="totalSaveWeight"></span>克</p></div>
		          	<p class="ml100 fl">毛重：<span class="yellow f24" id="totalGrossWeight"></span>克</p>
		          	<p class="ml100 fl">包数：<span class="yellow f24" id="totalPackageCount"></span>包</p>
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
<!-- 平台待收货--个人存金  GridList数据 -->
<script id="personSaveTemp" type="text/x-jquery-tmpl">
	{{each(index) list}}
       <tr {{if index %2 == 0}}class="grey" {{/if}}>
		<td>{{= index+1+((pageIndex-1)*pageSize)}}</td>
	    <td>{{= shopName}}</td>
	    <td>{{= shopFullName}}</td>
        <td>{{= logisticType=='POST'?'物流发货':logisticTypeName}}</td>
	    <td>{{= logisticCompany}}</td>
	    <td>{{= logisticNo}}</td>
        <td>{{= bookTime}}</td>
        <td>{{= orderWeight}}</td> 
		<td>{{= netWeight}}</td>
        <td>{{= grossWeight}}</td> 
		<td>{{= packageCount}}</td>
		<td>{{= sendBy}}</td>
		<td>{{= sendTime}}</td>
		<td>{{= statusName}}</td>
       {{if status=='SYS_RECEIVE'}}
         <td>
			<shiro:hasPermission name="YWGL_WLGL_PTDSH_GR_SH">
			<a  href="<%=basePath %>business/logisticsMgt/personReceive.do?logisticId={{= logisticId}}&t=<%=Math.random() %>" class="orange">收货</a>
			</shiro:hasPermission>
			<shiro:hasPermission name="YWGL_WLGL_PTDSH_GR_ZF">
			<a  href="javascript:perCanle({{= logisticId}})" class="orange">作废</a>
			</shiro:hasPermission>
		 </td>
        {{/if}}
        {{if status=='SYS_CANCEL'}}
		<td>
			<a  href="<%=basePath %>business/logisticsMgt/personReceive.do?logisticId={{= logisticId}}&status={{= status}}&t=<%=Math.random() %>" class="orange">订单详情</a>
		</td>
        {{/if}}
       </tr>
{{/each}}
</script>
<!-- 平台待收货--店铺存金  GridList数据 -->
<script id="shopSaveTemp" type="text/x-jquery-tmpl">
	{{each(index) list}}
       <tr {{if index %2 == 0}}class="grey" {{/if}}>
		<td>{{= index+1+((pageIndex-1)*pageSize)}}</td>
		<td>{{= orderNo}}</td>
	    <td>{{= shopName}}</td>
	    <td>{{= shopFullName}}</td>
        <td>{{= logisticType=='POST'?'物流发货':logisticTypeName}}</td>
	    <td>{{= logisticCompany}}</td>
	    <td>{{= logisticNo}}</td>
        <td>{{= bookTime}}</td>
        <td>{{= bookWeight}}</td> 
        <td>{{= grossWeight}}</td> 
		<td>{{= packageCount}}</td>
		<td>{{= sendBy}}</td>
		<td>{{= sendTime}}</td>
		<td>{{= statusName}}</td>
       {{if status=='SYS_RECEIVE'}}
         <td>
			<shiro:hasPermission name="YWGL_WLGL_PTDSH_DP_SH">
			<a  href="<%=basePath %>business/logisticsMgt/shopReceive.do?logisticId={{= logisticId}}&id={{= id}}&t=<%=Math.random() %>" class="orange">收货</a>
			</shiro:hasPermission>
			<shiro:hasPermission name="YWGL_WLGL_PTDSH_DP_ZF">
			<a  href="javascript:shopCanle({{= id}})" class="changeStatus orange">作废</a>
			</shiro:hasPermission>
		 </td>
        {{/if}}
        {{if status=='SYS_CANCEL'}}
		<td>
			<a  href="<%=basePath %>business/saveGoldBusi/orderDetail.do?id={{= id}}&orderType=SAVE&userType=SHOP&url=../logisticsMgt/waitReceive.do&tabIndex=shopSave&t=<%=Math.random() %>" class="orange">订单详情</a>
		</td>
        {{/if}}
       </tr>
	{{/each}}
</script>
<script type="text/javascript">
        //页面加载时调用
        $(function(){
    	  //为'个人存金'选项卡添加单击事件，显示平台待收货-全部信息
    	  $("#personSave").click(function(){
    		  $(this).addClass("hover");
    		  $("#shopSave").removeClass("hover");
    		  $(".shopSave").css("display","none");
    		  $(".personSave").css("display","block");
    		  //取绑'查询按钮'单击事件
    		  $("#searchBtn").unbind('click');
    		  //绑定'查询按钮'单击事件
    		  $("#searchBtn").click(function(){
    			  DMGold.ajax({"formId":"searchBox","serialize":true,"url":"sysReceivePerSaveAjax.do","success":personSaveCallback});
    		  });
    		  $('#expBtn').unbind("click");
    		  $("#expBtn").click(function(){
    			  exportData('searchBox','exportSysReceivePerSave.do')
    		  });
    		  $("#searchBtn").trigger('click');
    	  });
    	//为'店铺存金'选项卡添加单击事件，显示平台待收货-预约中信息
    	  $("#shopSave").click(function(){
    		  $(this).addClass("hover");
    		  $("#personSave").removeClass("hover");
    		  $(".personSave").css("display","none");
    		  $(".shopSave").css("display","block");
    		  //取绑'查询按钮'单击事件
    		  $("#searchBtn").unbind('click');
    		  //绑定'查询按钮'单击事件
    		  $("#searchBtn").click(function(){
    			  DMGold.ajax({"formId":"searchBox","serialize":true,"url":"shopSavePageListAjax.do","success":shopSaveCallback});
    		  });
    		  $('#expBtn').unbind("click");
    		  $("#expBtn").click(function(){
    			  exportData('searchBox','exportSysReceiveShopSave.do')
    		  });
    		  $("#searchBtn").trigger('click');
    	  });
    	  $("#${tabIndex}").trigger('click');
    	  //初始化 统计信息
    	  initStat();
        });
      //初始化--个人存金
     	function personSaveCallback(data){
     		//清空表格数据
     		$("#personSaveGrid").empty();
     		$('#totalOrderWeight').empty();
     		$('#totalSysNetWeight').empty();
     		$('#totalGrossWeight').empty();
     		$('#totalPackageCount').empty();
     		if(data.statResult != null ){
     			$('#totalOrderWeight').append(data.statResult.totalWeight);
     			$('#totalSysNetWeight').append(data.statResult.totalNetWeight);
     			$('#totalGrossWeight').append(data.statResult.totalGrossWeight);
     			$('#totalPackageCount').append(data.statResult.totalPackageCount);
     		}else{
     			$('#totalOrderWeight').append("0.000");
     			$('#totalSysNetWeight').append("0.000");
     			$('#totalGrossWeight').append("0.000");
     			$('#totalPackageCount').append("0");
     		}
     		//填充数据
    		$('#personSaveTemp').tmpl(data.pageResult).appendTo("#personSaveGrid");
    		//初始化分页标签
    		DMGold.PageTag.init({"divId":"pageTag","formId":"form","curPage":data.pageResult.pageIndex,"totalCount":data.pageResult.recordCount,
    			          "pageCount":data.pageResult.pageTotal,"url":"sysReceivePerSaveAjax.do","toPageCallBack":personSaveCallback});
     	}
     	//初始化--店铺存金
     	function shopSaveCallback(data){
     		//清空表格数据
     		$("#shopSaveGrid").empty();
     		$('#totalSaveWeight').empty();
     		$('#totalGrossWeight').empty();
     		$('#totalPackageCount').empty();
     		if(data.statResult != null ){
     			$('#totalSaveWeight').append(data.statResult.totalWeight);
     			$('#totalGrossWeight').append(data.statResult.totalGrossWeight);
     			$('#totalPackageCount').append(data.statResult.totalPackageCount);
     		}else{
     			$('#totalSaveWeight').append("0.000");
     			$('#totalGrossWeight').append("0.000");
     			$('#totalPackageCount').append("0.000");
     		}
     		//填充数据
    		 $('#shopSaveTemp').tmpl(data.pageResult).appendTo("#shopSaveGrid");
    		//初始化分页标签
    		DMGold.PageTag.init({"divId":"pageTag","formId":"form","curPage":data.pageResult.pageIndex,"totalCount":data.pageResult.recordCount,
    			          "pageCount":data.pageResult.pageTotal,"url":"shopSavePageListAjax.do","toPageCallBack":shopSaveCallback});
     	}
     	
     	//初始化统计数据
     	function initStat(){
     		 DMGold.ajax({"formId":"searchBox","serialize":true,"url":"findSysReceiveCount.do","success":function(data){
   	  	  	    DMGold.PageTag.initStat({"personalSaveCount":null,"shopSaveCount":null},data.statResult,"0");
     		 }});
     	}
     	
        function perCanle(logisticId){
   		 dm.confirm("是否确认作废该订单？",{
   				title:"确认",				//标题
   				okName:"确定",			//如同confirm确定按钮的value
   				cancleName:"取消",		//如同confirm取消按钮的value
   				callback:function(){	//按确定的执行的函数
   					location.href = "perReceiveCanle.do?id="+logisticId;
   				}
   			});
        }
        function shopCanle(id){
      		 dm.confirm("是否确认作废该订单？",{
      				title:"确认",				//标题
      				okName:"确定",			//如同confirm确定按钮的value
      				cancleName:"取消",		//如同confirm取消按钮的value
      				callback:function(){	//按确定的执行的函数
      					location.href = "shopReceiveCanle.do?id="+id;
      				}
      			});
           }
        
      //弹出框
        function popDiv(url){
     	   $.tbox.popup(url);
        }
    </script>

</html>
