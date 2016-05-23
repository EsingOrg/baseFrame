<%-- <%@page import="com.dimeng.p2p.common.enu.UserInfoType"%>--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>统计管理</title>
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
            <div class="til"><span class="ico2">图表统计</span></div>
            <ul class="con" >
            	<shiro:hasPermission name="TJGL_TBTJ_MJTJ">
                <li class="hover"><a href="<%=basePath%>chartStatistic/buyGoldMain.do" target="mainFrame">买金统计</a></li>
                </shiro:hasPermission>
                <shiro:hasPermission name="TJGL_TBTJ_SJTJ">
                <li><a href="<%=basePath%>chartStatistic/saleGoldMain.do" target="mainFrame">卖金统计</a></li>
                </shiro:hasPermission>
                <shiro:hasPermission name="TJGL_TBTJ_CJTJ">
                <li><a href="<%=basePath%>chartStatistic/keepGoldMain.do" target="mainFrame">存金统计</a></li>
                </shiro:hasPermission>
                <shiro:hasPermission name="TJGL_TBTJ_TJTJ">
                <li><a href="<%=basePath%>chartStatistic/bringGoldMain.do" target="mainFrame">提金统计</a></li>
                </shiro:hasPermission>
                <shiro:hasPermission name="TJGL_TBTJ_HJTJ">
                <li><a href="<%=basePath%>chartStatistic/excGoldMain.do" target="mainFrame">换金统计</a></li>
                </shiro:hasPermission>
            </ul>           
        </div>  
        <div class="cell">
            <div class="til"><span class="ico1">资产统计</span></div>
            <ul class="con" style="display: none;">
            	<shiro:hasPermission name="TJGL_ZCTJ_CZTJ">
                <li ><a href="<%=basePath%>assetStatistic/rechargeMain.do" target="mainFrame">充值统计</a></li>
                </shiro:hasPermission>
                <shiro:hasPermission name="TJGL_ZCTJ_TXTJ"> 
                <li><a href="<%=basePath%>assetStatistic/withdrawMain.do" target="mainFrame">提现统计</a></li>
                </shiro:hasPermission>
                <shiro:hasPermission name="TJGL_ZCTJ_PTSZTJ">
                <li><a href="<%=basePath%>assetStatistic/incomeAndExpenseMain.do" target="mainFrame">平台收支统计</a></li>
                </shiro:hasPermission>
                <shiro:hasPermission name="TJGL_ZCTJ_GRZCTJ">
                <li><a href="<%=basePath%>assetStatistic/personAssetList.do"  target="mainFrame">个人资产统计</a></li>
                </shiro:hasPermission>
                <shiro:hasPermission name="TJGL_ZCTJ_DPZCTJ">
                <li><a href="<%=basePath%>assetStatistic/shopAssetList.do"  target="mainFrame">店铺资产统计</a></li>
                </shiro:hasPermission>
                <shiro:hasPermission name="TJGL_ZCTJ_PTZCTJ">
                <li><a href="<%=basePath%>assetStatistic/platformAssetList.do" target="mainFrame">平台资产统计</a></li> 
                </shiro:hasPermission>
            </ul>
        </div> 
        <div class="cell">
            <div class="til"><span class="ico2">用户统计</span></div>
            <ul class="con" style="display: none;">
            	<shiro:hasPermission name="TJGL_YHTJ_ZXYHTJ">
                <li><a href="<%=basePath%>userStatistic/inlineUser.do?startTime=<%=String.valueOf(new java.sql.Date(System.currentTimeMillis()))%>&endTime=<%=String.valueOf(new java.sql.Date(System.currentTimeMillis()))%>&statType=HOUR" target="mainFrame">在线用户统计</a></li>
                </shiro:hasPermission>
                <shiro:hasPermission name="TJGL_YHTJ_YHTJ"> 
                <li><a href="<%=basePath%>userStatistic/userMain.do" target="mainFrame">用户统计</a></li>
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
