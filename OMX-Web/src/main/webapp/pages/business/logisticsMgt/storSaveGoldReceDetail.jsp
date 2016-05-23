<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp"%>
<html>
<head>
<title>平台待收货-店铺存金收货</title>
</head>
<body>
<!---------------右边内容开始--------------->
      <div class="r_main clearfix">
		<!--内容 -->
        <div class="main_title">收货</div>
        <form action="receiveConfirm.do" method="post" id="publicForm">
		<div class="main_con">
            <ul class="mentioning clearfix" >
                <li>
                    <div class="til"><span style="color:red;">*&nbsp;</span>平台实收净重：</div>
                    <div class="infl">
                    <input type="text" validate="q|weight" name="sysNetWeight" id="sysNetWeight" maxlength="10"  class="yhgl_input w100" style="float: left;"/>
                    <label>克</label>
                    </div>
                   <div class="til">备注：</div>
                   <div class="infl"><textarea name="remark" id="remark"maxlength="150"  cols="80" rows="5" class="border"></textarea></div>
                </li>                                 
            </ul>
            <input type="hidden" name="id" id="logisticId" value="${logisticId}">
            <div class="btn mt30 mb30">
            <input name="input"class="btn_cs ml10" type="button" onclick="confirm();" value="确认收货">
            <a href="<%=basePath %>business/logisticsMgt/waitReceive.do?tabIndex=shopSave" class="btn_cs ml20">返回</a>
            </div>
        </div>
        </form>
        <div class="main_con">
        	<div class="initialorder clearfix">
                <div class="init_title">初始订单</div>
                <ul class="init_con clearfix" >
                    <li>订单号：${logisticDetail.orderNo}</li>
                    <li>用户名：${logisticDetail.shopName}</li>
                    <li>店铺名称：${logisticDetail.shopFullName}</li>        
                    <li>存金克重：${logisticDetail.bookWeight}克</li>
                    <li>毛重：${logisticDetail.grossWeight}克</li>
                    <li>包数：${logisticDetail.packageCount}包</li>        
                    <li>提交时间：${logisticDetail.handleTime}</li>
                <c:if test="${logisticDetail.logisticType == 'POST'}">
                  <div style="color:red;">
                    <li>发货方式：物流发货</li>
                    <li>物流方：${logisticDetail.logisticCompany}</li>        
                    <li>物流号：${logisticDetail.logisticNo}</li> 
                    </div>
                </c:if>     
                <c:if test="${logisticDetail.logisticType == 'SELF_TO'}">
                  <div style="color:blue;">
                    <li>发货方式：${logisticDetail.logisticTypeName}</li>
                    <li>委托人：${logisticDetail.consigner}</li>        
                    <li>委托人身份证号：${logisticDetail.consignerIdCard}</li>        
                    <li>委托人手机号：${logisticDetail.consignerPhone}</li>
                    <li>预约时间：${logisticDetail.bookTime}</li>  
                    </div>      
                </c:if>
                    <li>状态：${logisticDetail.statusName}</li>
                </ul>
            </div>
        </div>
    </div>
  </body>
  <script type="text/javascript">
dmCheck.init("#publicForm");
//确认事件
function confirm(){
	  if(!dmCheck.check("#publicForm")){
			return false;
		}
	  $("#publicForm").submit();
}
</script>
</html>
       