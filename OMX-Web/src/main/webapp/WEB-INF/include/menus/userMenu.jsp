<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>用户管理</title>
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
            <div class="til"><span class="ico1">用户信息</span></div>
            <ul class="con">
            	<shiro:hasPermission name="YHGL_YHXX_GRXX">
                <li class="hover"><a href="<%=basePath %>user/per/userPerList.do" target="mainFrame">个人信息</a></li>
                </shiro:hasPermission> 
                <shiro:hasPermission name="YHGL_YHXX_DPXX">
                <li><a href="<%=basePath %>shop/shopPerList.do" target="mainFrame">店铺信息</a></li>
                </shiro:hasPermission>
            </ul>
        </div> 
        <div class="cell">
            <div class="til"><span class="ico2">店铺申请</span></div>
            <ul class="con" style="display: none;">
            	<shiro:hasPermission name="YHGL_DPSQ_DSH">
                <li><a href="<%=basePath %>audit/auditList.do?type=2" target="mainFrame">待审核</a></li>
                </shiro:hasPermission>
                <shiro:hasPermission name="YHGL_DPSQ_SHTG">
                <li><a href="<%=basePath %>audit/auditList.do?type=1" target="mainFrame">审核通过</a></li>
                </shiro:hasPermission>
                <shiro:hasPermission name="YHGL_DPSQ_SHBTG">
                <li><a href="<%=basePath %>audit/auditList.do?type=0" target="mainFrame">审核不通过</a></li>
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
