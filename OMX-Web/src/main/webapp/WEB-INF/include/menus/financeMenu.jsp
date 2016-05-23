<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>财务管理</title>
<%@ include file="/WEB-INF/include/common/commHeader.jsp" %>
<script type="text/javascript" src="<%=basePath %>js/left_menu.js"></script>
</head>
<!---------------左边内容开始--------------->
<body style=" background:#f3f3f3;">
<!---------------左边内容开始--------------->
    <div class="l_main">
      <!---------------左侧导航开始--------------->
        <div class="main_nav">
        <div class="cell">
            <div class="til"><span class="ico1">提现</span></div>
            <ul class="con">
            	<shiro:hasPermission name="CWGL_TX_DSH">
                <li class="hover"><a href="<%=basePath %>finance/getFinancePeingList.do?status=PENDING" target="mainFrame">待审核</a></li>
                </shiro:hasPermission>
                <shiro:hasPermission name="CWGL_TX_DFK">
                <li><a href="<%=basePath %>finance/getFinanceLoanList.do?status=PASS" target="mainFrame">待放款</a></li>
                </shiro:hasPermission>
                <shiro:hasPermission name="CWGL_TX_YTX">
                <li><a href="<%=basePath %>finance/getAlreadyMentionedList.do?status=RELEASED" target="mainFrame">已提现</a></li>
                </shiro:hasPermission>
                <shiro:hasPermission name="CWGL_TX_TXSB">
                <li><a href="<%=basePath %>finance/getFinanceCashOutFailList.do?status=RELEASE_FAILED" target="mainFrame">提现失败</a></li>
                </shiro:hasPermission>
            </ul>
        </div> 
        <div class="cell">
            <div class="til"><span class="ico2">充值记录</span></div>
            <ul class="con" style="display: none;">
            	<shiro:hasPermission name="CWGL_CZJL_XSCZ">
                <li><a id="sysConstants" href="<%=basePath %>finance/getFinanceOnlineRecharge.do" target="mainFrame">线上充值</a></li>
                </shiro:hasPermission>
                <shiro:hasPermission name="CWGL_CZJL_XXCZ">
                <li><a id="sysProperty" href="<%=basePath %>finance/getFinanceBelowlineRecharge.do" target="mainFrame">线下充值</a></li>
                </shiro:hasPermission>
            </ul>           
        </div>  
        <div class="cell">
            <div class="til"><span class="ico2">交易记录</span></div>
            <ul class="con" style="display: none;">
            	<shiro:hasPermission name="CWGL_JYJL_PTJYJL">
                <li><a href="<%=basePath %>finance/getFinancePlatformTradingRecord.do" target="mainFrame">平台交易记录</a></li> 
                </shiro:hasPermission>
                <shiro:hasPermission name="CWGL_JYJL_GRJYJL">
                <li><a href="<%=basePath %>finance/getFinancePersonTradingRecord.do?userType=PERSONAL" target="mainFrame">个人交易记录</a></li> 
                </shiro:hasPermission>
                <shiro:hasPermission name="CWGL_JYJL_DPJYJL">
                <li><a href="<%=basePath %>finance/getFinanceStoreTradingRecord.do?userType=SHOP" target="mainFrame">店铺交易记录</a></li>
                </shiro:hasPermission>
            </ul>             
        </div>  
        <div class="cell">
            <div class="til"><span class="ico2">订单明细</span></div>
            <ul class="con" style="display: none;">
            		<shiro:hasPermission name="CWGL_DDMX_DDMX">
                	<li><a href="<%=basePath %>finance/getFinanceOrderDetail.do" target="mainFrame">订单明细</a></li>
                	</shiro:hasPermission>
                	<shiro:hasPermission name="CWGL_DDMX_YCRZ">
                	<li><a href="<%=basePath %>finance/getFinanceOrderExceptions.do" target="mainFrame">异常日志</a></li>
                	</shiro:hasPermission>
            </ul>             
        </div>  
      </div>
      <!---------------左侧导航结束--------------->
    </div>
    <div class="l_ico"></div>
    <!---------------左边内容结束--------------->
</body>
</html>
