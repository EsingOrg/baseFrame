<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp"%>
<html>
<head>
<title>个人换金</title>
<c:if test="${errMsg ne null}">
<script type="text/javascript">
  //错误提示
  dm.alert(decodeURIComponent('${errMsg}'));
</script>
</c:if>
<!-- 个人存金--全部  GridList数据 -->
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
		<td>{{= shopCheckWeight}}</td>
		<td>{{= shopChangeWeight}}</td>
		<td>{{= fee}}</td>
		<td>{{= createTime}}</td>
		<td>{{= updateTime}}</td>
		<td>{{= statusName}}</td>
		<td>
			<a  href="swopGoldOrderDetail.do?id={{= id}}&tabIndex=1" class="orange">订单详情</a>
		</td>
       </tr>
	{{/each}}
</script>
<!-- 个人存金--预约中  GridList数据 -->
<script id="orderTemp" type="text/x-jquery-tmpl">
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
        <td>{{= bookCode}}</td>
		<td>{{= bookTime}}</td>
		<td>{{= updateTime}}</td>
		<td>{{= statusName}}</td>
		<td>
			<a  href="swopGoldOrderDetail.do?id={{= id}}&tabIndex=2" class="orange">订单详情</a>
			<shiro:hasPermission name="YWGL_HJYW_GRHJ_ZF">
<a  href="javascript:del({{= id}},'{{= orderNo}}')" class="orange">作废</a></shiro:hasPermission>
		</td>
       </tr>
	{{/each}}
</script>
<script type="text/javascript">
  $(function(){
	init();
  });
  function init(){
	//为'全部'选项卡添加单击事件，显示个人存金-全部信息
	  $("#all").click(function(){
		  $(this).addClass("hover");
		  $("#order").removeClass("hover");
		  $(".order").css("display","none");
		  $(".all").css("display","block");
		  //添加查询事件
		  $("input[name=tabIndex]").val(1);
		  //$("input[name=export]").unbind("click");
		  //$("input[name=export]").click(exportData('form','exportAllExcGold.do'));
		  search();
	  });
	//为'预约中'选项卡添加单击事件，显示个人存金-预约中信息
	  $("#order").click(function(){
		  $(this).addClass("hover");
		  $("#all").removeClass("hover");
		  $(".all").css("display","none");
		  $(".order").css("display","block");
		//添加查询事件
		  $("input[name=tabIndex]").val(2);
		  //$("input[name=export]").unbind("click");
		  //$("input[name=export]").click(exportData('form','exportBookExcGold.do'));
		  search();
	  });
	  var tabIndex = '${tabIndex}';
	  if(tabIndex==1){
		  $("#all").trigger('click');		  
	  }else{
		  $("#order").trigger('click');
	  }
  }
  function search(){
	 DMGold.ajax({"formId":"form","serialize":true,"url":"personSwopGoldAjax.do","success":pageTagCallBack});
  }
//分页跳转回调
	function pageTagCallBack(data){
		//清空表格数据
		$("#allGrid").empty();
		$("#orderGrid").empty();
		//填充数据
		$('#allTemp').tmpl(data.pageResult).appendTo("#allGrid");
		$('#orderTemp').tmpl(data.pageResult).appendTo("#orderGrid");
		//初始化分页标签
		DMGold.PageTag.init({"divId":"pageTag","formId":"form","curPage":data.pageResult.pageIndex,"totalCount":data.pageResult.recordCount,
			          "pageCount":data.pageResult.pageTotal,"url":"personSwopGoldAjax.do","toPageCallBack":pageTagCallBack});
		initStat(data);
	}
  function del(userId,orderNo){
  	dm.confirm("是否确认作废该订单？",{
	title:"确认",				//标题
	okName:"确定",			//如同confirm确定按钮的value
	cancleName:"取消",		//如同confirm取消按钮的value
	callback:function(){	//按确定的执行的函数
		DMGold.ajax({"data":{'id':userId,'orderNo':orderNo},"serialize":true,"url":"excOrderInvalide.do","success":function(data){
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
 //初始化统计数据
   function initStat(data){
 	//初始克总计
   	DMGold.PageTag.initStat({"totalShopCheckWeight":null,"totalShopChangeWeight":null},data.statResult,'0.000');
 	//初始化元总计
   	DMGold.PageTag.initStat({"totalFee":null},data.statResult,'0.00');
//初始化数量总计
   	DMGold.PageTag.initStat({"bookChangeCount":null},data.statResult,'0');
   }
</script>

</head>
<body>
	<div class="systemUser">
		<div class="r_main clearfix ">
			<!--文本框 -->
			<div class="main_title">个人换金</div>
			<div class="main_con clearfix">
          	<div class="user_con">
                <ul class="user_now clearfix">
                    <li>
                        <p class="yellow"><span class="f24" id="bookChangeCount"></span>笔</p>
                        <p>当前预约数</p>
                    </li>
                </ul>
          	</div>
          </div>
			<!--文本框 --END-->
			<!-- 搜索框 -->
			<form action="personSwopGold.do" method="post" id="form">
				<input type="hidden" name="tabIndex" value="${tabIndex}">
				<div class="main_con">
					<div class="admin_input clearfix">
						<p>
							订单号： <input type="text" name="orderNo" class="yhgl_input" maxlength="23" />
						</p>
						<p>
							手机号： <input type="text" name="userPhone" class="yhgl_input" maxlength="20" />
						</p>
						<p>
							店铺名： <input type="text" name="shopName" class="yhgl_input" maxlength="20" />
						</p>
						<p>
							店铺名称： <input type="text" name="shopFullName" class="yhgl_input" maxlength="20" />
						</p>
						<p>提交时间：
								<input type="text" name="startCreateTime" class="yhgl_input date" id="createTime1" onclick="WdatePicker({maxDate: '#F{$dp.$D(\'createTime2\')}'})" />
							   <span class="mr5">至</span> 
							   <input type="text" name="endCreateTime" class="yhgl_input date" id="createTime2" onclick="WdatePicker({minDate: '#F{$dp.$D(\'createTime1\')}'})" />
							</p>
						<div class="all">
							<p>
					                                        状态：
					            	 <dim:select name="status" enumType="ChangeGoldStatus" headName="全部" headValue=""  cssClass="yhgl_sel"></dim:select>
					        </p>
						</div>
						<div class="order">
							 <p>预约时间：
							 	<input type="text" name="startBookTime" class="yhgl_input date" id="createTime3" onclick="WdatePicker({maxDate: '#F{$dp.$D(\'createTime4\')}'})" />
							   <span class="mr5">至</span> 
							   <input type="text" name="endBookTime" class="yhgl_input date" id="createTime4" onclick="WdatePicker({minDate: '#F{$dp.$D(\'createTime3\')}'})" />
							</p>
						</div>
						<p class="lo_btn">
							<input type="button" onclick="search();" class="search" value="搜索" /> 
							<shiro:hasPermission name="YWGL_HJYW_GRHJ_QB_DC"><div class="all">
							<input name="input" type="button" class="export ml10" value="导出" onclick="exportData('form','exportAllExcGold.do');"/>
							</div>
							</shiro:hasPermission>
							<shiro:hasPermission name="YWGL_HJYW_GRHJ_YYZ_DC"><div class="order">
							<input name="input" type="button" class="export ml10" value="导出" onclick="exportData('form','exportBookExcGold.do');"/>
							</div>
							</shiro:hasPermission>
						</p>
					</div>
				</div>
			
			<!--搜索表框  --END-->

			<div class="main_con">
				<div class="menubox clearfix">
					<ul>
						<li id="all" ><a href="#">全部</a></li>
						<li id="order"><a href="#">预约中</a></li>
					</ul>
				</div>
				<!-- 全部 -->
				<div class="all" >
					<table width="100%" border="0" cellspacing="0" cellpadding="3" class="main_table tc" >
					<thead>
						<tr class="title">
							<td align="center">序号</td>
							<td align="center">订单号</td>
							<td align="center">用户名</td>
							<td align="center">姓名</td>
							<td align="center">手机号</td>
							<td align="center">店铺名</td>
							<td align="center">店铺名称</td>
							<td align="center">换金克重(克)</td>
							<td align="center">店测克重(克)</td>
							<td align="center">店换克重(克)</td>
							<td align="center">手续费(元)</td>
							<td align="center">提交时间</td>
							<td align="center">最后操作时间</td>
							<td align="center">状态</td>
							<td align="center">操作</td>
						</tr>
						</thead><tbody id="allGrid"></tbody>
					</table>
				</div>
				<!-- 全部  END -->
                <!-- 预约中 -->
				<div class="order">
						<table width="100%" border="0" cellspacing="0" cellpadding="3" class="main_table tc">
							<thead>
							<tr class="title">
								<td align="center">序号</td>
								<td align="center">订单号</td>
								<td align="center">用户名</td>
								<td align="center">姓名</td>
								<td align="center">手机号</td>
								<td align="center">店铺名</td>
								<td align="center">店面名称</td>
								<td align="center">换金克重(克)</td>
								<td align="center">预约码</td>
								<td align="center">预约时间</td>
								<td align="center">提交时间</td>
								<td align="center">状态</td>
								<td align="center">操作</td>
							</tr></thead><tbody id="orderGrid"></tbody>
						</table>
					</div>
					<div class="mt10 all">
		          	<p class="fl">店测克重合计：<span class="yellow f24" id="totalShopCheckWeight"></span>克</p>
		          	<p class="ml100 fl">店换克重合计：<span class="yellow f24" id="totalShopChangeWeight"></span>克</p>
		          	<p class="ml100 fl">手续费合计：<span class="yellow f24" id="totalFee"></span>克</p>
		        	</div>
					<!-- 预约中 --END -->
					<!--分页-->
					   <div id="pageTag"></div>						
					<!--分页  --END-->
			</div>
			</form>
		</div>
	</div>
</body>
</html>
