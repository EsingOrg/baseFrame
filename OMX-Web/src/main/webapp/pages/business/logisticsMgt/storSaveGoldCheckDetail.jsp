<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp"%>
<html>
<head>
<title>平台待检测-店铺存金检测</title>
</head>
<body>
<!---------------右边内容开始--------------->
      <div class="r_main clearfix">
         
		<!--内容 -->
        <div class="main_title">检测</div>
		<div class="main_con">
		<form action="shopCheckConfirm.do" method="post" id="publicForm">
		<input type="hidden" name="id" id="logisticId" value="${logisticId}">
            <ul class="mentioning clearfix" >
                <li>
                    <div class="til"><span style="color:red;">*&nbsp;</span>检测克重：</div>
                    <div class="infl"><input  name="sysCheckWeight" validate="q|weight" maxlength="10"    class="yhgl_input w100" style="float: left;"/><label>克</label></div>
                     <div class="til"><span style="color:red;">*&nbsp;</span>成色：</div>
                    <div class="infl"><input  name="sysCheckQuality"  validate="q"  maxlength="20"  class="yhgl_input w200" style="float: left;"/></div>
                </li>     
                <li>
                 <div class="til">备注：</div>
                 <div class="infl"><textarea name="remark" maxlength="150" cols="80" rows="5" class="border"></textarea></div>
                </li>                            
            </ul>
            <div class="btn mt30 mb30">
            <input name="input"class="btn_cs ml10" type="button" onclick="confirm();" value="确认检测">
            <a href="<%=basePath %>business/logisticsMgt/waitCheck.do?tabIndex=storeSave" class="btn_cs ml20">返回</a>
            </div>
            </form>
        </div>
        <div class="main_con">
        	<div class="initialorder clearfix">
                <div class="init_title">初始订单</div>
                <ul class="init_con clearfix">
                  <li>订单号：${initDetail.orderNo}</li>
                  <li>用户名：${initDetail.shopName}</li>
                  <li>店铺名：${initDetail.shopFullName}</li>
                  <li>存金克重：${initDetail.bookWeight}克</li>
                  <li>毛重：${initDetail.grossWeight} 克</li>
                  <li>包数：${initDetail.packageCount}包</li>
                  <li>提交时间：${initDetail.handleTime}</li>
                  <c:if test="${initDetail.logisticType =='POST'}">
                  <li style="color: red;">发货方式：${initDetail.logisticTypeName}</li>
                  <li style="color: red;">物流方：${initDetail.logisticCompany}</li>
                  <li style="color: red;">物流号：${initDetail.logisticNo}</li>
                  </c:if>
                  <c:if test="${initDetail.logisticType == 'SELF_TO'}">
                  <li style="color: blue;">发货方式：${initDetail.logisticTypeName}</li>
                  <li style="color: blue;">委托人：${initDetail.consigner}</li>
                  <li style="color: blue;">委托人身份证：${initDetail.consignerIdCard}</li>
                  <li style="color: blue;">委托人手机号：${initDetail.consignerPhone}</li>
                  <li style="color: blue;">预约时间：${initDetail.bookTime}</li>
                  </c:if>
                </ul>
            </div>
            <div class="initialorder clearfix">
                <div class="init_title">平台收货</div>
                <ul class="init_con clearfix">
                  <li>平台实收净重：${receiveDetail.sysNetWeight}克</li>
                  <li>备注：${receiveDetail.remark}</li>
                  <li>收货人：${receiveDetail.receiveBy}</li>
                  <li>收货时间：${receiveDetail.receiveTime}</li>
                  <li>状态：${receiveDetail.statusName}</li>
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
       