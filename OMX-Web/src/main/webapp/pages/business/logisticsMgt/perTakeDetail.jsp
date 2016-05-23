<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp"%>
<html>
<head>
<title>平台已发货-个人店铺自提--查看</title>
</head>

<body>
<!---------------右边内容开始--------------->
      <div class="r_main clearfix">
         
		<!--内容 -->
        <div class="main_title">查看</div>
		<div class="main_con">
            <ul class="view clearfix" >
                <li>
                    <div class="til">店铺名：</div>
                    <div class="infl">${list.singleResult.shopUserId}&nbsp</div>
                    <div class="til">提金克重：</div>
                    <div class="infr">${list.singleResult.orderWeight}克&nbsp</div> 
                    <div class="til">店铺地址：</div>
                    <div class="infr" style="width:400px;">${list.singleResult.shopAddress} &nbsp</div>
                </li>
                <li>
                    <div class="til">实发净重：</div>
                    <div class="infl">${list.singleResult.netWeight}克&nbsp</div>
                    <div class="til">毛重：</div>
                    <div class="infl">${list.singleResult.grossWeight}克&nbsp</div>
                    <div class="til">包数：</div>
                    <div class="infl">${list.singleResult.packageCount}包&nbsp</div>
                    <div class="til">发货方式：</div>
                    <div class="infl">${list.singleResult.logisticTypeName}</div>
                </li>
                <c:if test="${list.singleResult.logisticType == 'POST'}">
	                <li> 
	                    <div class="til">物流方：</div>
	                    <div class="infl">${list.singleResult.logistiCompany}&nbsp</div>
	                    <div class="til">物流号：</div>
	                    <div class="infl">${list.singleResult.logisticNo}&nbsp</div>
	                    <div class="til">备注：</div>
	                    <div class="infl">${list.singleResult.remark}&nbsp</div>
	                    <div class="til">店铺名称：</div>
	                    <div class="infl">${list.singleResult.shopName}&nbsp</div>
	                </li>
	                <li>
	                    <div class="til">发货人：</div>
	                    <div class="infl">${list.singleResult.sendBy}&nbsp</div>
	                    <div class="til">发货时间：</div>
	                    <div class="infl">${list.singleResult.sendTime}&nbsp</div>
	                </li>
                </c:if>  
                <c:if test="${list.singleResult.logisticType ==  'SELF_FROM'}">
	                <li> 
	                    <div class="til">备注：</div>
	                    <div class="infl">${list.singleResult.remark}&nbsp</div>
	                    <div class="til">店铺名称：</div>
	                    <div class="infl">${list.singleResult.shopName}&nbsp</div>
	                    <div class="til">发货人：</div>
	                    <div class="infl">${list.singleResult.sendBy}&nbsp</div>
	                    <div class="til">发货时间：</div>
	                    <div class="infl">${list.singleResult.sendTime}&nbsp</div>
	                </li>
                </c:if>  
                 
                <c:if test="${list.singleResult.statusName=='待店铺收货'}">
                <li style="color:red; ">
                    <div class="til">状态：</div>
                    <div class="infl">${list.singleResult.statusName}&nbsp</div>
                </li>
                </c:if>
                <c:if test="${list.singleResult.statusName =='已完成'}">
                <li style="color:red; ">
                    <div class="til">状态：</div>
                    <div class="infl">${list.singleResult.statusName}&nbsp</div>
                    <div class="til">收货人：</div>
                    <div class="infl">${list.singleResult.receiveBy}&nbsp</div>
                    <div class="til">收货时间：</div>
                    <div class="infl">${list.singleResult.receiveTime}&nbsp</div>
                </li> 
                </c:if>                                
            </ul>
            <div class="btn mt30 mb30"><a href="dispatched.do" class="btn_cs ml20">返回</a></div>
        </div>
 
        <!-- 搜索框 -->
        <form id="searchBox">
				<div class="main_con">
					<div class="admin_input clearfix">
					<input type="hidden" id="logisticId" name="logisticId" value="${list.singleResult.logisticId}">
						<p>
							订单号： <input type="text" name="orderNo" class="yhgl_input"
								maxlength="23" />
						</p>
					    
						<p>
							用户名： <input type="text" name="userName" class="yhgl_input"
								 maxlength="20" />
						</p>
						<p class="lo_btn">
							<input type="button"   class="search" id="searBtn" value="搜索" /> 
							<input name="input" type="button" class="export ml10" value="导出" onclick="exportData('searchBox','exportPerTakeOrdersByLogistic.do');"/>
						</p>
					</div>
				</div>
				</form>
			<!--搜索表框  --END-->
        <div class="main_con">
        <table width="100%" border="0" cellspacing="0" cellpadding="3" class="main_table tc">
            <thead>
              <tr class="title">
                <td align="center">序号</td> 
                <td align="center">订单号</td> 
                <td align="center">用户名</td> 
                <td align="center">姓名</td> 
                <td align="center">手机号</td> 
                <td align="center">订单类型</td>
                <td align="center">提金克重(克)</td> 
                <td align="center">手续费</td>
                <td align="center">状态</td> 
                <td align="center">操作</td>              
              </tr>    
              </thead>  
              <tbody id="ordersGrid"></tbody> 
            </table>
            <div id="pageTag"></div>
        </div>

		<!--内容  --END-->
          
</div>
<!---------------右边内容结束--------------->
</body>
<c:if test="${errMsg ne null}">
<script type="text/javascript">
  //错误提示
  dm.alert(decodeURIComponent('${errMsg}'));
</script>
</c:if>
<script id="ordersTemp" type="text/x-jquery-tmpl">
      {{each(index) list}}
       <tr {{if index %2 == 0}}class="grey" {{/if}}>
		<td>{{= index+1+((pageIndex-1)*pageSize)}}</td>
	    <td>{{= orderNo}}</td>
	    <td>{{= userName}}</td>
        <td>{{= realName}}</td> 
	    <td>{{= phone}}</td>
	    <td>{{= orderTypeName}}</td>
        <td>{{= orderWeight}}</td> 
		<td>{{= fee}}</td>
		<td>{{= statusName}}</td>	
		<td><a  href="#" onclick="openDetail('{{= orderId}}','{{= orderType}}')" class="orange">订单详情</a></td>
       </tr>
    {{/each}}
</script>
<script type="text/javascript">
$(function(){
		  $('#searBtn').unbind("click"); //取绑‘click’事件
		  $("#searBtn").click(function(){
			  DMGold.ajax({"formId":"searchBox","serialize":true,"url":"perTakeOrdersAjax.do?logisticId="+$('#logisticId').val(),"success":ordersCallBack});
		  });
		  $("#searBtn").trigger('click');
	});
	function ordersCallBack(data){
		$("#ordersGrid").empty();
		$('#ordersTemp').tmpl(data.pageResult).appendTo("#ordersGrid");
		//初始化分页标签
		DMGold.PageTag.init({"divId":"pageTag","formId":"searchBox","curPage":data.pageResult.pageIndex,"totalCount":data.pageResult.recordCount,
			          "pageCount":data.pageResult.pageTotal,"url":"perTakeOrdersAjax.do?logisticId="+$('#logisticId').val(),"toPageCallBack":ordersCallBack});
		
	}
	function openDetail(orderId,orderType){
		var url = "pertTakeorderDetail.do?id="+orderId+"&orderType="+orderType+"&showonly=show&t=<%=Math.random() %>"
		$.tbox.popup(url);
	}

</script>



</html>
