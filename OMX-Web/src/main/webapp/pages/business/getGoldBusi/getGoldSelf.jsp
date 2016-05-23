<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp"%>
<html>
<head>
<title>个人提金--店铺自提</title>
</head>
<body>
	<div class="systemUser">
		<div class="r_main clearfix ">
			<!--文本框 -->
			<div class="main_title">个人提金(店铺自取方式)</div>
			<!--文本框 --END-->
			<!--文本框 -->
			<div class="main_con clearfix">
          	<div class="user_con">
                <ul class="user_now clearfix">
                    <li>
                        <p class="yellow"><span class="f24" id="bookTakeCount"></span>笔</p>
                        <p>当前预约数</p>
                    </li>
                </ul>
          	</div>
          </div>
			<!--文本框 --END-->
			<!-- 搜索框 -->
			<form action="getGoldSelf.do" method="post" id="form">
			<input type="hidden" name="tabIndex" value="1" id="tabIndex"/>
				<div class="main_con">
					<div class="admin_input clearfix">
						<p>
							订单号： <input type="text" name="orderNo" class="yhgl_input" maxlength="23" />
						</p>
						<p>
							手机号： <input type="text" name="userPhone" class="yhgl_input"  maxlength="20" />
						</p>
						<p>提交时间：
								<input type="text" name="startCreateTime" class="yhgl_input date" id="createTime1" onclick="WdatePicker({maxDate: '#F{$dp.$D(\'createTime2\')}'})" />
							   <span class="mr5">至</span> 
							   <input type="text" name="endCreateTime" class="yhgl_input date" id="createTime2" onclick="WdatePicker({minDate: '#F{$dp.$D(\'createTime1\')}'})" />
							</p>
						<p>
								店铺名： <input type="text" name="shopName" class="yhgl_input" maxlength="20" />
							</p>
						<div class="all" >
							<p>
					                                        状态：
					            	 <dim:select name="status" enumType="TakeGoldStatus" headName="全部" headValue="" exclude="PERSONAL_RECEIVE" cssClass="yhgl_sel"></dim:select>
					        </p>
						</div>
						<div class="order" >
							 <p>预约时间：
							 	<input type="text" name="startBookTime" class="yhgl_input date" id="createTime3" onclick="WdatePicker({maxDate: '#F{$dp.$D(\'createTime4\')}'})" />
							   <span class="mr5">至</span> 
							   <input type="text" name="endBookTime" class="yhgl_input date" id="createTime4" onclick="WdatePicker({minDate: '#F{$dp.$D(\'createTime3\')}'})" />
							</p>
						</div>

						<p class="lo_btn">
							<input type="button" onclick="search();" class="search" id="searBtn" value="搜索" /> 
							<shiro:hasPermission name="YWGL_TJYW_DPZT_QB_DC"><div class="all">
							<input name="input" type="button" class="export ml10" value="导出" onclick="exportData('form','exportShopSelfOrder.do');"/>
							</div></shiro:hasPermission>
							<shiro:hasPermission name="YWGL_TJYW_DPZT_YYZ_DC"><div class="order">
							<input name="input" type="button" class="export ml10" value="导出" onclick="exportData('form','exportShopBookingOrder.do');"/>
							</div></shiro:hasPermission>
						</p>
					</div>
				</div>
			
			<!--搜索表框  --END-->

			<div class="main_con">
				<div class="menubox clearfix">
					<ul>
						<li id="all" class="hover"><a href="#">全部</a></li>
						<li id="order"><a href="#">预约中</a></li>
					</ul>
				</div>
				<!-- 全部 -->
				<div class=" all" >
					<table width="100%" border="0" cellspacing="0" cellpadding="3" 
						class="main_table tc">
						<thead>
						<tr class="title">
							<td align="center">序号</td>
							<td align="center">订单号</td>
							<td align="center">用户名</td>
							<td align="center">姓名</td>
							<td align="center">手机号</td>
							<td align="center">店铺名</td>
							<td align="center">店面名称</td>
							<td align="center">提金克重(克)</td>
							<td align="center">提交时间</td>
							<td align="center">实提克重(克)</td>
							<td align="center">扣除存源(克)</td>
							<td align="center">扣除买源(克)</td>
							<td align="center">手续费(元)</td>
							<td align="center">剩余存源(克)</td>
							<td align="center">剩余买源(克)</td>
							<td align="center">最后操作时间</td>
							<td align="center">状态</td>
							<td align="center">操作</td>
						</tr></thead><tbody id="allGrid"></tbody>
					</table>
				</div>
				<!-- 全部  END -->
                <!-- 预约中 -->
				<div class="order" style="display:none;">
						<table width="100%" border="0" cellspacing="0" cellpadding="3" 
							class="main_table tc">
							<thead>
							<tr class="title">
								<td align="center">序号</td>
								<td align="center">订单号</td>
								<td align="center">用户名</td>
								<td align="center">手机号</td>
								<td align="center">姓名</td>
								<td align="center">店铺名</td>
								<td align="center">店面名称</td>
								<td align="center">提金克重(克)</td>
								<td align="center">预约码</td>
								<td align="center">预约时间</td>
								<td align="center">剩余存源(克)</td>
								<td align="center">剩余买源(克)</td>
								<td align="center">提交时间</td>
								<td align="center">状态</td>
								<td align="center">操作</td>
							</tr></thead><tbody id="orderGrid"></tbody>
						</table>
						</div>
					<!-- 预约中 --END -->
			   <div class="all">
		          	<p class="fl stat">实提克重合计：<span class="yellow f24" id="totalTakeWeight"></span>克</p>
		          	<p class="stat fl">扣除存源合计：<span class="yellow f24" id="totalMinusSave"></span>克</p>
		          	<p class="stat fl">扣除买源合计：<span class="yellow f24" id="totalMinusBuy"></span>克</p>
		          	<p class="stat fl">手续费合计：<span class="yellow f24" id="totalFee"></span>元</p>
		          	<p class="fl stat">剩余存源合计：<span class="yellow f24" id="totalRemainSave"></span>克</p>
		          	<p class="stat fl">剩余买源合计：<span class="yellow f24" id="totalRemainBuy"></span>克</p>
		          	<p class="stat fl">提金克重合计：<span class="yellow f24" id="totalBookWeight"></span>克</p>
		        	<p class="stat fl"></p><p class="stat fl"></p><p class="stat fl"></p>
		        </div>
				<div  class="paging" id="pageTag"></div>
					<!--分页  --END-->
			</div>
			</form>
		</div>
	</div>
</body>
<c:if test="${errMsg ne null}">
		<script type="text/javascript">
		   //错误提示
           dm.alert(decodeURIComponent('${errMsg}'));
  		</script>
</c:if>
<!-- 个人提金--全部  GridList数据 -->
<script id="allTemp" type="text/x-jquery-tmpl">
	{{each(index) list}}
       <tr {{if index %2 == 0}}class="grey" {{/if}}>
		<td>{{= index+1+((pageIndex-1)*pageSize)}}</td>
	    <td>{{= orderNo}}</td>
	    <td>{{= userName}}</td>
        <td>{{= userFullName}}</td> 
	    <td>{{= userPhone}}</td>
	    <td>{{= shopName}}</td>
        <td>{{= shopFullName}}</td> 
		<td>{{= bookWeight}}</td>
		<td>{{= createTime}}</td>
		<td>{{= takeWeight}}</td>
		<td>{{= minusSave}}</td>
		<td>{{= minusBuy}}</td>
		<td>{{= fee}}</td>
		<td>{{= remainSave}}</td>
		<td>{{= remainBuy}}</td>
		<td>{{= updateTime}}</td>
		<td>{{= statusName}}</td>
		<td><a  href="orderTakeDetail.do?id={{= id}}&orderType={{= orderType}}&tabIndex=1" class="orange">订单详情</a></td>
	{{/each}}
</script>
<!-- 个人提金--预约中  GridList数据 -->
<script id="orderTemp" type="text/x-jquery-tmpl">
	{{each(index) list}}
       <tr {{if index %2 == 0}}class="grey" {{/if}}>
		<td>{{= index+1+((pageIndex-1)*pageSize)}}</td>
	    <td>{{= orderNo}}</td>
	    <td>{{= userName}}</td>
		<td>{{= userPhone}}</td>
        <td>{{= userFullName}}</td> 
	    <td>{{= shopName}}</td>
        <td>{{= shopFullName}}</td> 
		<td>{{= bookWeight}}</td>
        <td>{{= bookCode}}</td>
        <td>{{= bookTime}}</td>
		<td>{{= remainSave}}</td>
		<td>{{= remainBuy}}</td>
		<td>{{= updateTime}}</td>
		<td>{{= statusName}}</td>
		<td>
			<a  href="orderTakeDetail.do?id={{= id}}&orderType={{= orderType}}&tabIndex=2" class="orange">订单详情</a>
			<shiro:hasPermission name="YWGL_TJYW_DPZT_ZF">
<a  href="javascript:del({{= id}},'{{= orderNo}}')" class="changeStatus orange">作废</a>
		</shiro:hasPermission></td>
       </tr>
	{{/each}}
</script>
<script type="text/javascript">
      //-----------------------------------------------------------------
      //页面加载时调用
        $(function(){
    	  document.getElementById("");
    	  $(".order").css("display","none");
    	  //为'全部'选项卡添加单击事件，显示全部信息
    	  $("#all").click(function(){
    		  $(this).addClass("hover");
    		  $("#order").removeClass("hover");
    		  $(".order").css("display","none");
    		  $(".all").css("display","block");
    		  $("#tabIndex").val(1);
    		  search();
    	  });
    	//为'预约中'选项卡添加单击事件，显示预约中信息
    	  $("#order").click(function(){
    		  $(this).addClass("hover");
    		  $("#all").removeClass("hover");
    		  $(".all").css("display","none");
    		  $(".order").css("display","block");
    		  $("#tabIndex").val(2);
    		  search();
    	  });
    	  if('1'=='${tabIndex}'){
    		  $("#all").click();
    	  }else{
    		  $("#order").click();
    	  }
        });
        function search(){
    		DMGold.ajax({"formId":"form","serialize":true,"url":"getGoldSelfAjax.do","success":pageTagCallBack});
    	}
    	function pageTagCallBack(data){
     		//清空表格数据
     		$("#allGrid").empty();
     		$("#orderGrid").empty();
     		//填充数据
    		$('#allTemp').tmpl(data.pageResult).appendTo("#allGrid");
    	    $('#orderTemp').tmpl(data.pageResult).appendTo("#orderGrid");
    		//初始化分页标签
    		DMGold.PageTag.init({"divId":"pageTag","formId":"form","curPage":data.pageResult.pageIndex,"totalCount":data.pageResult.recordCount,
    			          "pageCount":data.pageResult.pageTotal,"url":"getGoldSelfAjax.do","toPageCallBack":pageTagCallBack});
    		//初始化克重总计
	       	DMGold.PageTag.initStat({"totalTakeWeight":null,"totalMinusSave":null,"totalMinusBuy":null,
	       		"totalRemainSave":null,"totalRemainBuy":null,"totalBookWeight":null},data.statResult,'0.000');
	       	//初始元总计
	       	DMGold.PageTag.initStat({"totalFee":null},data.statResult,'0.00');
	        //初始数量总计
	       	DMGold.PageTag.initStat({"bookTakeCount":null},data.statResult,'0');
     	}
     	function del(userId,orderNo){
      		 dm.confirm("是否确认作废该订单？",{
      				title:"确认",				//标题
      				okName:"确定",			//如同confirm确定按钮的value
      				cancleName:"取消",		//如同confirm取消按钮的value
      				callback:function(){	//按确定的执行的函数
      					
      					DMGold.ajax({"data":{'id':userId,'orderNo':orderNo},"serialize":true,"url":"orderInvalide.do","success":function(data){
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
         //弹出框
           function popDiv(url){
        	   $.tbox.popup(url);
           }
    </script>
</html>
