<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp"%>
<html>
<head>
<title>定期金产品管理</title>

</head>
<body>
	<div class="systemUser">
		<div class="r_main clearfix ">
			<!--文本框 -->
			<div class="main_title">定期金产品管理</div>
			<!--文本框 --END-->
			<div class="main_con">
				<div class="menubox clearfix" style="border-bottom-style: none;padding-left: 50px; text-align: center;">
               <ul>
               	  <c:forEach items="${dayList.data.list}" var="day" varStatus="st">
               	  	<li class="${findReq.dueTime == day.dueTime ? 'hover' : ''}"><a href="getTreasuryPeriodicalGoldManageList.do?dueTime=${day.dueTime}&termId=${day.productId}">${day.dueTime}天</a></li>
               	  </c:forEach>
               </ul>
          </div>
            <ul class="part_infor clearfix" >
                <li>
                    <div class="til">产品ID：</div>
                    <div class="info" style="  width: auto;padding-left: 30px;">${pageList.data.singleResult.no }</div>                   
                </li>
                <li>
                    <div class="til">产品名称：</div>
                    <div class="info" style=" width: auto;padding-left: 30px;">${pageList.data.singleResult.name }</div>
                </li>  
                <li>
                    <div class="til">期限：</div>
                    <div class="info" style=" width: auto;padding-left: 30px;">${pageList.data.singleResult.dueTime }天</div>
                </li> 
                <c:if test="${pageList.data.singleResult.stepRateFlag == 'N'}">
                <li>
                    <div class="til">年利率：</div>
                    <div class="info" style=" width: auto;padding-left: 30px;"><fmt:formatNumber value="${pageList.data.singleResult == null ? '0' : pageList.data.singleResult.yearRate == null ? '0' : pageList.data.singleResult.yearRate}" maxFractionDigits="2" type="percent" /></div>
                </li> 
                </c:if>
                <c:if test="${pageList.data.singleResult.stepRateFlag == 'Y'}">
                <c:forEach items="${pageList.data.singleResult.rateList}" var="rate" varStatus="st">
                	<li>
	                    <div class="til">转入克重${rate.maxWeight == null ? '大于' : rate.maxWeight == '0.000' ? '大于' : '' }：</div>
	                    <div class="info" style=" width: auto;padding-left: 30px;">${rate.minWeight }克<c:if test="${rate.maxWeight != null && rate.maxWeight != '0.000'}">-${rate.maxWeight }克</c:if>&nbsp;&nbsp;&nbsp;&nbsp;年利率&nbsp;<fmt:formatNumber value="${rate.yearRate }" maxFractionDigits="2" type="percent" /></div>
	                </li>
                </c:forEach>
                </c:if>
                <li>
                    <div class="til">投资管理费率：</div>
                    <div class="info" style=" width: auto;padding-left: 30px;"><fmt:formatNumber value="${pageList.data.singleResult.manageRate}" maxFractionDigits="2" type="percent" /></div>
                </li> 
                <li>
                    <div class="til">最少持有天数：</div>
                    <div class="info" style=" width: auto;padding-left: 30px;">${pageList.data.singleResult.minDay }天</div>
                </li>  
                <li>
                    <div class="til">还款方式：</div>
                    <div class="info" style=" width: auto;padding-left: 30px;">${pageList.data.singleResult.repaymentName }</div>
                </li>  
                <li>
                    <div class="til">起息日：</div>
                    <div class="info" style=" width: auto;padding-left: 30px;"><c:if test="${pageList.data.singleResult.valueDate != null}">T+${pageList.data.singleResult.valueDate}</c:if></div>
                </li>  
                <li>
                    <div class="til">提前转出利率：</div>
                    <div class="info" style=" width: auto;padding-left: 30px;"><fmt:formatNumber value="${pageList.data.singleResult.preOutRate }" maxFractionDigits="2" type="percent" /></div>
                </li>
                <li>
                    <div class="til">排序：</div>
                    <div class="info" style=" width: auto;padding-left: 30px;">${pageList.data.singleResult.sort }</div>
                </li>
                <li>
                    <div class="til">描述：</div>
                    <div class="info" style=" width: auto;padding-left: 30px;width:50%;">${pageList.data.singleResult.termDesc }</div>
                </li>
                <li>
                    <div class="til">是否在前台展示：</div>
                    <div class="info" style=" width: auto;padding-left: 30px;">
                    	<c:if test="${pageList.data.singleResult.showFlag == 'Y'}">
                    		是
                    	</c:if>
                    	<c:if test="${pageList.data.singleResult.showFlag == 'N'}">
                    		否
                    	</c:if>
                    </div>
                </li>
                <li>
                    <div class="til">累计成交总重：</div>
                    <div class="info" style=" width: auto;padding-left: 30px;">${pageList.data.columnStatResult == null ? '0.000' : pageList.data.columnStatResult.weight == null ? '0.000' : pageList.data.columnStatResult.weight}克</div>
                </li>
                <li>
                    <div class="til">累计成交价格：</div>
                    <div class="info" style=" width: auto;padding-left: 30px;">${pageList.data.columnStatResult == null ? '0.000' : pageList.data.columnStatResult.amount == null ? '0.000' : pageList.data.columnStatResult.amount }元</div>
                </li>
                <li>
                    <div class="til">累计赚取利息：</div>
                    <div class="info" style=" width: auto;padding-left: 30px;">${pageList.data.columnStatResult == null ? '0.000' : pageList.data.columnStatResult.finishAmount == null ? '0.000' : pageList.data.columnStatResult.finishAmount }元</div>
                </li>                                   
            </ul>
            <c:if test="${dayList.data.list != null && dayList.data != null}">
             <div style="margin-left: 470px;">
            	 <shiro:hasPermission name="JKGL_LLGL_DQJCPGL_XG">
             	<a  href="<%=basePath %>treasury/updatePeriodicalGoldBox.do?dueTime=${findReq.dueTime }&termId=${pageList.data.singleResult.id}" class="btn_cs">修改</a>
             	</shiro:hasPermission>
             	<shiro:hasPermission name="JKGL_LLGL_DQJCPGL_CKXGJL">
             	<a href="#"></a><a href="<%=basePath %>treasury/updatePeriodicalGoldRecord.do?termNo=${pageList.data.singleResult.no }&termId=${pageList.data.singleResult.id }" class="btn_cs ml20">查看修改记录</a>
             	</shiro:hasPermission>
             </div>
             </c:if>
		</div>

		</div>
	</div>
</body>
<script type="text/javascript">
    //弹出框
    function popDiv(url){
 	   $.tbox.popup(url);
    }
 	function openDivPwd(id,loginName){
 		loginNames = encodeURIComponent(encodeURIComponent(loginName));
 		popDiv('<%=basePath %>system/sysuser_modify_pwd.jsp?id='+id+'&ln='+loginNames+'&t=<%=Math.random() %>');
 	}
 </script>
</html>
							