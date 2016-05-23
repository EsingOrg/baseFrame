<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp"%>
<html>
<head>
<title>平台待收货-个人存金收货</title>
</head>

<body>
<!---------------右边内容开始--------------->
      <div class="r_main clearfix">
         
		<!--内容 -->
        <div class="main_title">收货</div>
        <form action="receiveConfirm.do" method="post" id="publicForm">
		<div class="main_con">
            <ul class="view clearfix" >
                <li>
                    <div class="til">订单克重：</div>
                    <div class="infr">${logisticDetail.singleResult.orderWeight}克&nbsp</div>
                    <div class="til">实发净重：</div>
                    <div class="infr">${logisticDetail.singleResult.netWeight}克&nbsp</div> 
                    <div class="til">毛重：</div>
                    <div class="infr">${logisticDetail.singleResult.grossWeight}克&nbsp</div>  
                    <div class="til">包数：</div>
                    <div class="infr">${logisticDetail.singleResult.packageCount}包&nbsp</div>                 
                </li>
                <c:if test="${logisticDetail.singleResult.logisticType =='POST' }">
                <li>
                    <div class="til">店铺名：</div>
                    <div class="infl">${logisticDetail.singleResult.shopName}&nbsp</div>
                    <div class="til">发货方式：</div>
                    <div class="infl">物流发货</div>
                    <div class="til">物流方：</div>
                    <div class="infl">${logisticDetail.singleResult.logisticCompany}&nbsp</div>
                    <div class="til">物流号：</div>
                    <div class="infl">${logisticDetail.singleResult.logisticNo}&nbsp</div>
                </li>  
                 <li>
                    <div class="til">备注：</div>
                    <div class="infl">${logisticDetail.singleResult.remark}&nbsp</div>
                    <div class="til">发货人：</div>
                    <div class="infl">${logisticDetail.singleResult.sendBy}&nbsp</div>
                    <div class="til">发货时间：</div>
                    <div class="infl">${logisticDetail.singleResult.sendTime}&nbsp</div>
                    <div class="til">店铺名称：</div>
                    <div class="infl">${logisticDetail.singleResult.shopFullName}&nbsp</div>
                </li>
                </c:if>
                <c:if test="${logisticDetail.singleResult.logisticType =='SELF_TO' }">
                <li >
                    <div class="til">店铺名：</div>
                    <div class="infl">${logisticDetail.singleResult.shopName}&nbsp</div>
                    <div style="color:red; ">
                    <div class="til">发货方式：</div>
                    <div class="infl">${logisticDetail.singleResult.logisticTypeName}&nbsp</div>
                    <div class="til">委托人：</div>
                    <div class="infl">${logisticDetail.singleResult.consigner}&nbsp</div>
                    <div class="til">委托人手机号：</div>
                    <div class="infl">${logisticDetail.singleResult.consignerPhone}&nbsp</div>
                    </div>
                </li>
                <li style="color:red; ">
                    <div class="til">委托人身份证号：</div>
                    <div class="infl">${logisticDetail.singleResult.consignerIdCard}&nbsp</div>
                    <div class="til">预约时间：</div>
                    <div class="infl">${logisticDetail.singleResult.bookTime}&nbsp</div>
                </li>
                </c:if>
                <c:if test="${status !='SYS_CANCEL' }">
                <li>
                    <div class="til"><span style="color:red;">*&nbsp;</span>平台实收净重：</div>
                    <div class="infl">
                    <input type="text" validate="q|gram" name="sysNetWeight" id="sysNetWeight" maxlength="10"  class="yhgl_input w100" style="float: left;"/>
                    <label>克</label>
                    </div>
                    <div class="til">备注：</div>
                    <div class="infl"><textarea name="remark" id="remark"maxlength="150"  cols="80" rows="5" class="border"></textarea></div>
                </li>    
                </c:if>  
                <c:if test="${status =='SYS_CANCEL' }">
                <li>
                	<div class="til">备注：</div>
                    <div class="infl">${logisticDetail.singleResult.remark}</div>
                    <div class="til">处理人：</div>
                    <div class="infl">${logisticDetail.singleResult.handler}</div>
                    <div class="til">处理时间：</div>
                    <div class="infl">${logisticDetail.singleResult.handleTime}</div>
                </li>    
                </c:if>    
            </ul>
            <input type="hidden" name="id" id="logisticId" value="${logisticId}">
            <div class="btn mt30 mb30">
            <c:if test="${status !='SYS_CANCEL'}">
            <input name="input"class="btn_cs ml10" type="button" onclick="confirm();" value="确认收货">
            </c:if> 
            <a href="<%=basePath %>business/logisticsMgt/waitReceive.do" class="btn_cs ml20">返回</a>
            </div>
        </div>
        </form>
        <!-- 搜索框 -->
			<form id="searBtn">
				<div class="main_con">
					<div class="admin_input clearfix">
					<input type="hidden"  name="logisticId" value="${logisticDetail.singleResult.logisticId}">
						<p>
							订单号： <input type="text" name="orderNo" class="yhgl_input"
								maxlength="23" />
						</p>
					    
						<p>
							手机号： <input type="text" name="userPhone" class="yhgl_input"
								 maxlength="20" />
						</p>
						<p>
							姓名： <input type="text" name="userFullName" class="yhgl_input"
								 maxlength="20" />
						</p>
						<p class="lo_btn">
							<input type="button" onclick="search();" class="search" value="查询" /> 
							<input name="input" type="button" class="export ml10" onclick="exportData('searBtn','exportOrdersByLogistic.do');" value="导出" />
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
                <td align="center">订单克重</td>
                <td align="center">状态</td> 
                <td align="center">操作</td>              
              </tr>
             </thead>
             <tbody id="ordersGrid">
             </tbody>
            </table>
            <div id="pageTag"></div>
        </div>

		<!--内容  --END-->
          
</div>
<!---------------右边内容结束--------------->
</body>
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
        <td>{{= userFullName}}</td> 
	    <td>{{= userPhone}}</td>
	    <td>{{= orderTypeName}}</td>
        <td>{{= shopCheckWeight}}</td> 
		<td>{{= statusName}}</td>	
		<td><a  href="#" onclick="openDetail('{{= id}}','{{= orderType}}')" class="orange">订单详情</a></td>
       </tr>
    {{/each}}
</script>
<script type="text/javascript">
dmCheck.init("#publicForm");
/**
 * 确认收货
 */
function confirm(){
	  if(!dmCheck.check("#publicForm")){
			return false;
		}
	  $("#publicForm").submit();
}
/**
 * 页面加载完成后执行方法
 */
$(function(){
		 search();
	}
);

/**
 * 查看详情
 */
function openDetail(id,orderType){
	var url = "perSaveDetail.do?id="+id+"&orderType="+orderType+"&showonly=show&t=<%=Math.random() %>"
	$.tbox.popup(url);
}
/**
 * 查询 
 */
 function search(){
	 DMGold.ajax({"formId":"searBtn","serialize":true,"url":"findShopSendedOrderList.do","success":ordersCallBack});
}
 /**
  * 查询回调
  */
 function ordersCallBack(data){
 	$("#ordersGrid").empty();
 	$('#ordersTemp').tmpl(data.pageResult).appendTo("#ordersGrid");
 	//初始化分页标签
 	DMGold.PageTag.init({"divId":"pageTag","formId":"searBtn","curPage":data.pageResult.pageIndex,"totalCount":data.pageResult.recordCount,
 		          "pageCount":data.pageResult.pageTotal,"url":"findShopSendedOrderList.do","toPageCallBack":ordersCallBack});
 	
 }
</script>
</html>
