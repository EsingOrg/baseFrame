<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp"%>
<html>
<head>
<title>平台待检测-个人存金检测</title>
</head>

<body>
<!---------------右边内容开始--------------->
      <div class="r_main clearfix">
         
		<!--内容 -->
        <div class="main_title">检测</div>
		<div class="main_con">
		<form action="perCheckConfirm.do" method="post" id="publicForm">
		<input type="hidden" name="id" id="logisticId" value="${shopSendDetail.logisticId}">
			<ul class="view clearfix">
				<li>
                    <div class="til"><span style="color:red;">*&nbsp;</span>检测克重：</div>
                    <div class="infl">
                    <input type="text" name="sysCheckWeight"maxlength="10"   validate="q|gram" class="yhgl_input w100" />克</div>
                    <div class="til"><span style="color:red;">*&nbsp;</span>成色：</div>
                    <div class="infl">
                    <input type="text" name="sysCheckQuality" maxlength="20"  validate="q" class="yhgl_input w200" /></div>
                </li> 
                <li>
                	<div class="til">备注：</div>
                    <div class="infl"><textarea name="remark" cols="80" maxlength="150" rows="5" class="border"></textarea></div>
                </li>                                
            </ul>
             <div class="btn mt30 mb30">
             <input name="input"class="btn_cs ml10" type="button" onclick="confirm();" value="确认检测">
             <a href="<%=basePath %>business/logisticsMgt/waitCheck.do" class="btn_cs ml20">返回</a>
             </div>
             </form>
            <ul class="view clearfix" >
                <li>
                    <div class="til">订单克重：</div>
                    <div class="infl">${shopSendDetail.orderWeight}克</span></div>
                    <div class="til">实发净重：</div>
                    <div class="infr">${shopSendDetail.netWeight}克</div> 
                    <div class="til">毛重：</div>
                    <div class="infr">${shopSendDetail.grossWeight}克</div>  
                    <div class="til">包数：</div>
                    <div class="infr">${shopSendDetail.packageCount}包</div>                 
                </li>
               <c:if test="${shopSendDetail.logisticType =='POST' }">
               <li style="color:blue; ">
               		<div style="color:#666; "class="til">店铺名称：</div>
                    <div style="color:#666; "class="infl">${shopSendDetail.shopFullName}</div>
               		<div style="color:#666; "class="til">店铺名：</div>
                    <div style="color:#666; "class="infl">${shopSendDetail.shopName}</div>
                    <div class="til">发货方式：</div>
                    <div class="infl">${shopSendDetail.logisticTypeName}</div>
                    <div class="til">物流方：</div>
                    <div class="infl">${shopSendDetail.logisticCompany}</div>
                </li>  
                 <li style="color:blue; ">
                 	<div class="til">物流号：</div>
                    <div class="infl">${shopSendDetail.logisticNo}</div>
                    <div class="til">发货人：</div>
                    <div class="infl">${shopSendDetail.sendBy}</div>
                    <div class="til">发货时间：</div>
                    <div class="infl">${shopSendDetail.sendTime}</div>
                    <div class="til">备注：</div>
                    <div class="infl infl-remark" title="${shopSendDetail.remark}">${shopSendDetail.remark}</div>
                </li>
                </c:if> 
                <c:if test="${shopSendDetail.logisticType =='SELF_TO' }">
                <li style="color:red; ">
                	<div style="color:#666; "class="til">店铺名称：</div>
                    <div style="color:#666; "class="infl">${shopSendDetail.shopFullName}</div>
                	<div style="color:#666; "class="til">店铺名：</div>
                    <div style="color:#666; "class="infl">${shopSendDetail.shopName}</div>
                    <div class="til">发货方式：</div>
                    <div class="infl">${shopSendDetail.logisticTypeName}</div>
                    <div class="til">委托人：</div>
                    <div class="infl">${shopSendDetail.consigner}</div>
                </li>
                <li style="color:red; ">
                	<div class="til">委托人手机号：</div>
                    <div class="infl">${shopSendDetail.consignerPhone}</div>
                	<div class="til">委托人身份证号码：</div>
                    <div class="infl">${shopSendDetail.consignerIdcard}</div>
                    <div class="til">预约时间：</div>
                    <div class="infl">${shopSendDetail.bookTime}</div>
                    <div class="til">备注：</div>
                    <div class="infl infl-remark" title="${shopSendDetail.remark}">${shopSendDetail.remark}</div>
                </li>
                </c:if>
                <li>
                    <div class="til">平台实收净重：</div>
                    <div class="infl">${shopSendDetail.sysNetWeight}</div>
                    <div class="til">备注：</div>
                    <div class="infl">${receiveDetail.remark}</div>
                    <div class="til">收货人：</div>
                    <div class="infl">${shopSendDetail.receiveBy}</div>
                    <div class="til">收货时间：</div>
                    <div class="infl">${shopSendDetail.receiveTime}</div>
                </li>                                 
            </ul>
           
        </div>
        
        <!-- 搜索框 -->
			<form id="searchBox">
				<div class="main_con">
				<input type="hidden" name="logisticId" value="${shopSendDetail.logisticId}">
					<div class="admin_input clearfix">
						<p>
							订单号： <input type="text" name="orderNo" class="yhgl_input"
								 maxlength="23" />
						</p>
					    
						<p class="lo_btn">
							<input type="button"   class="search" id="searBtn" value="搜索" /> 
							<input name="input" type="button" class="export ml10" value="导出" onclick="exportData('searchBox','exportOrderByLogisticId.do?');"/>
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
                <td align="center">存金克重(克)</td>
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
	    <td>{{= loginName}}</td>
        <td>{{= userName}}</td> 
	    <td>{{= userPhone}}</td>
	    <td>{{= orderTypeName}}</td>
        <td>{{= weight}}</td> 
		<td>{{= statusName}}</td>	
		<td><a  href="#" onclick="openDetail('{{= orderId}}','{{= orderType}}')" class="orange">订单详情</a></td>
       </tr>
    {{/each}}
</script>
<script type="text/javascript">
dmCheck.init("#publicForm");
//确认事件
function confirm(){
	  if(!dmCheck.check("#publicForm")){
			return false;
		}
	  $("#publicForm").submit();
}
$(function(){
		  $('#searBtn').unbind("click"); //取绑‘click’事件
		  $("#searBtn").click(function(){
			  DMGold.ajax({"formId":"searchBox","serialize":true,"url":"findOrdersAjax.do?logisticId="+$('#logisticId').val(),"success":ordersCallBack});
		  });
		  $("#searBtn").trigger('click');
	});
	function ordersCallBack(data){
		$("#ordersGrid").empty();
		$('#ordersTemp').tmpl(data.pageResult).appendTo("#ordersGrid");
		//初始化分页标签
		DMGold.PageTag.init({"divId":"pageTag","formId":"searchBox","curPage":data.pageResult.pageIndex,"totalCount":data.pageResult.recordCount,
			          "pageCount":data.pageResult.pageTotal,"url":"findOrdersAjax.do?logisticId="+$('#logisticId').val(),"toPageCallBack":ordersCallBack});
		
	}
	function openDetail(orderId,orderType){
		var url = "perSaveDetail.do?id="+orderId+"&orderType="+orderType+"&showonly=show&t=<%=Math.random() %>"
		$.tbox.popup(url);
	}

</script>
</html>
