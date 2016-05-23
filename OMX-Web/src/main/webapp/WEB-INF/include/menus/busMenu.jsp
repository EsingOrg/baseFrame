<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>业务管理</title>
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
            <div class="til"><span class="ico1">买金业务</span></div>
            <ul class="con">
             <shiro:hasPermission name="YWGL_MJYW_YMDD">
            	<li class="hover"><a href="<%=basePath %>business/purcGoldBusi/prePurcGold.do" target="mainFrame">预买订单</a></li> 
              </shiro:hasPermission>
              <shiro:hasPermission name="YWGL_MJYW_GRMJ">
                <li><a href="<%=basePath %>business/purcGoldBusi/personPurcGold.do" target="mainFrame">个人买金</a></li> 
               </shiro:hasPermission>
               <shiro:hasPermission name="YWGL_MJYW_DPMJ">
                <li><a href="<%=basePath %>business/purcGoldBusi/storePurcGold.do" target="mainFrame">店铺买金</a></li>
                 </shiro:hasPermission>
               <shiro:hasPermission name="YWGL_MJYW_MJCL">
                <li><a href="<%=basePath %>business/purcGoldBusi/purcGoldDeal.do" target="mainFrame">买金处理</a></li>
                 </shiro:hasPermission>
               <shiro:hasPermission name="YWGL_MJYW_MJZB">
                <li><a href="<%=basePath %>business/purcGoldBusi/purcGoldList.do" target="mainFrame">买金总表</a></li>
                 </shiro:hasPermission>
            </ul>
        </div> 
        <div class="cell">
            <div class="til"><span class="ico2">卖金业务</span></div>
            <ul class="con" style="display: none;">
            	<shiro:hasPermission name="YWGL_MJYW_YMMDD">
            	<li><a href="<%=basePath %>business/saleGoldBusi/preSaleGold.do" target="mainFrame">预卖订单</a></li> 
               </shiro:hasPermission>
               <shiro:hasPermission name="YWGL_SJYW_GRMJ">
                <li><a href="<%=basePath %>business/saleGoldBusi/personSaleGold.do" target="mainFrame">个人卖金</a></li> 
                 </shiro:hasPermission>
               <shiro:hasPermission name="YWGL_SJYW_DPMJ">
                <li><a href="<%=basePath %>business/saleGoldBusi/storeSaleGold.do" target="mainFrame">店铺卖金</a></li>
                 </shiro:hasPermission>
               <shiro:hasPermission name="YWGL_SJYW_MJCL">
                <li><a href="<%=basePath %>business/saleGoldBusi/saleGoldDeal.do" target="mainFrame">卖金处理</a></li> 
                 </shiro:hasPermission>
               <shiro:hasPermission name="YWGL_SJYW_MJZB">
                <li><a href="<%=basePath %>business/saleGoldBusi/saleGoldList.do" target="mainFrame">卖金总表</a></li>
                 </shiro:hasPermission>
            </ul>           
        </div>  
        <div class="cell">
            <div class="til"><span class="ico2">存金业务</span></div>
            <ul class="con" style="display: none;">
               <shiro:hasPermission name="YWGL_CJYW_GRCJ">
                <li><a href="<%=basePath %>business/saveGoldBusi/personSaveGold.do" target="mainFrame">个人存金</a></li> 
                 </shiro:hasPermission>
               <shiro:hasPermission name="YWGL_CJYW_DPCJ">
                <li><a href="<%=basePath %>business/saveGoldBusi/storeSaveGold.do" target="mainFrame">店铺存金</a></li>
                 </shiro:hasPermission>
               <shiro:hasPermission name="YWGL_CJYW_CJZB">
                <li><a href="<%=basePath %>business/saveGoldBusi/saveGoldList.do" target="mainFrame">存金总表</a></li>
                 </shiro:hasPermission>
            </ul>             
        </div>  
        <div class="cell">
            <div class="til"><span class="ico2">提金业务</span></div>
            <ul class="con" style="display: none;">
               <shiro:hasPermission name="YWGL_TJYW_DPZT">
                <li><a href="<%=basePath %>business/getGoldBusi/getGoldSelf.do?tabIndex=1" target="mainFrame">店铺自提</a></li> 
                 </shiro:hasPermission>
               <shiro:hasPermission name="YWGL_TJYW_KDDJ">
                <li><a href="<%=basePath %>business/getGoldBusi/getGoldFMS.do" target="mainFrame">快递到家</a></li>
                 </shiro:hasPermission>
               <shiro:hasPermission name="YWGL_TJYW_DPTJ">
                <li><a href="<%=basePath %>business/getGoldBusi/getGoldStore.do" target="mainFrame">店铺提金</a></li>
                 </shiro:hasPermission>
               <shiro:hasPermission name="YWGL_TJYW_TJZB">
                <li><a href="<%=basePath %>business/getGoldBusi/getGoldList.do" target="mainFrame">提金总表</a></li>
                 </shiro:hasPermission>
            </ul>             
        </div>  
        <div class="cell">
            <div class="til"><span class="ico2">换金业务</span></div>
            <ul class="con" style="display: none;">
               <shiro:hasPermission name="YWGL_HJYW_GRHJ">
                <li><a href="<%=basePath %>business/swopGoldBusi/personSwopGold.do?tabIndex=1" target="mainFrame">个人换金</a></li> 
               </shiro:hasPermission>
            </ul>             
        </div> 
        <div class="cell">
            <div class="til"><span class="ico2">物流管理</span></div>
            <ul class="con" style="display: none;">
               <shiro:hasPermission name="YWGL_WLGL_PTDFH">
                <li><a href="<%=basePath %>business/logisticsMgt/waitDispatch.do" target="mainFrame">平台待发货</a></li>
                 </shiro:hasPermission>
               <shiro:hasPermission name="YWGL_WLGL_PTDSH">
                <li><a href="<%=basePath %>business/logisticsMgt/waitReceive.do" target="mainFrame">平台待收货</a></li>
                 </shiro:hasPermission>
               <shiro:hasPermission name="YWGL_WLGL_PTDJC">
                <li><a href="<%=basePath %>business/logisticsMgt/waitCheck.do" target="mainFrame">平台待检测</a></li>
                 </shiro:hasPermission>
               <shiro:hasPermission name="YWGL_WLGL_PTYFH">
                <li><a href="<%=basePath %>business/logisticsMgt/dispatched.do" target="mainFrame">平台已发货</a></li>
                 </shiro:hasPermission>
               <shiro:hasPermission name="YWGL_WLGL_PTYSH">
                <li><a href="<%=basePath %>business/logisticsMgt/received.do" target="mainFrame">平台已收货</a></li>  
                 </shiro:hasPermission>
            </ul>             
        </div> 
        <div class="cell">
            <div class="til"><span class="ico2">平台出入库</span></div>
            <ul class="con" style="display: none;">
               <shiro:hasPermission name="YWGL_PTCRK_PTRK">
                <li><a href="<%=basePath %>business/platFormWarehouse/inbound.do" target="mainFrame">平台入库</a></li>
                 </shiro:hasPermission>
               <shiro:hasPermission name="YWGL_PTCRK_PTCK">
                <li><a href="<%=basePath %>business/platFormWarehouse/outbound.do" target="mainFrame">平台出库</a></li>
                 </shiro:hasPermission>
               <shiro:hasPermission name="YWGL_PTCRK_DPCCGL">
                <li><a href="<%=basePath %>business/platFormWarehouse/diffAdjust.do" target="mainFrame">店铺称差调整</a></li>
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
