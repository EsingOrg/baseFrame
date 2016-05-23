<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>金库管理</title>
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
            <div class="til"><span class="ico1">金库管理</span></div>
            <ul class="con">
            	<shiro:hasPermission name="JKGL_JKGL_YWZL">
                <li class="hover"><a href="<%=basePath %>treasury/getTreasuryManageList.do" target="mainFrame">业务总览</a></li>
                </shiro:hasPermission>
                <shiro:hasPermission name="JKGL_JKGL_JKZL">
                <li><a href="<%=basePath %>treasury/getTreasurySummaryList.do" target="mainFrame">金库总览</a></li>
                </shiro:hasPermission>
                <shiro:hasPermission name="JKGL_JKGL_DPJRTZ">
                <li><a href="<%=basePath %>treasury/getTreasuryStoreTodayAccountList.do?flag=1" target="mainFrame">店铺今日台账</a></li>
                </shiro:hasPermission>
                <shiro:hasPermission name="JKGL_JKGL_DPLSTZ">
                <li><a href="<%=basePath %>treasury/getTreasuryStoreHistoryAccountList.do?flag=1" target="mainFrame">店铺历史台账</a></li>
                </shiro:hasPermission>
            </ul>
        </div>

        <div class="cell">
            <div class="til"><span class="ico2">金库存期管理</span></div>
            <ul class="con" style="display: none;">
            	<shiro:hasPermission name="JKGL_JKCQGL_CQZL">
                <li><a id="sysConstants" href="<%=basePath %>treasury/getTreasuryCpqiList.do" target="mainFrame">存期总览</a></li>
                </shiro:hasPermission>
                <shiro:hasPermission name="JKGL_JKCQGL_HJMX">
                <li><a id="sysProperty" href="<%=basePath %>treasury/getTreasuryLiveGoldDetailList.do?flag=1" target="mainFrame">活金明细</a></li>
                </shiro:hasPermission>
                <shiro:hasPermission name="JKGL_JKCQGL_DQJJK">
                <li><a id="sysProperty" href="<%=basePath %>treasury/getTreasuryTermGoldList.do?flag=0" target="mainFrame">定期金金库</a></li>
                </shiro:hasPermission>
                <shiro:hasPermission name="JKGL_JKCQGL_DQJMX">
                <li><a id="sysProperty" href="<%=basePath %>treasury/getTreasuryTermGoldDetailList.do?flag=1&dNum=0" target="mainFrame">定期金明细</a></li>
                </shiro:hasPermission>
            </ul>           
        </div>
        <div class="cell">
            <div class="til"><span class="ico2">利率管理</span></div>
            <ul class="con" style="display: none;">
            	<shiro:hasPermission name="JKGL_LLGL_HJLL">
                <li><a href="<%=basePath %>treasury/getTreasuryLiveGoldRateList.do" target="mainFrame">活金利率</a></li> 
                </shiro:hasPermission>
                <shiro:hasPermission name="JKGL_LLGL_DDJCPGL">
                <li><a href="<%=basePath %>treasury/getTreasuryPeriodicalGoldManageList.do" target="mainFrame">定期金产品管理</a></li>
                </shiro:hasPermission>
            </ul>             
        </div>  
        <div class="cell">
            <div class="til"><span class="ico2">制品管理</span></div>
            <ul class="con" style="display: none;">
            		<shiro:hasPermission name="JKGL_ZPGL_HJZP">
                	<li><a href="<%=basePath %>treasury/getTreasuryKingProductList.do" target="mainFrame">黄金制品</a></li>
                	</shiro:hasPermission>
            </ul>             
        </div> 
        <div class="cell">
            <div class="til"><span class="ico2">金价管理</span></div>
            <ul class="con" style="display: none;">
            		<shiro:hasPermission name="JKGL_JJGL_JYSSSJJ">
                	<li><a href="<%=basePath %>treasury/getRealTimeKingPriceList.do" target="mainFrame">交易所实时金价</a></li>
                	</shiro:hasPermission>
                	<shiro:hasPermission name="JKGL_JJGL_XGQTJYJJ">
                	<li><a href="<%=basePath %>treasury/getFrontTradeKingPriceList.do" target="mainFrame">修改前台交易金价</a></li>
                	</shiro:hasPermission>
                	<shiro:hasPermission name="JKGL_JJGL_HJJXJJ">
                	<li><a href="<%=basePath %>treasury/getLiveGoldInterestKingPrice.do" target="mainFrame">活金结息金价</a></li>
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
