<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>系统管理</title>
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
            <div class="til"><span class="ico1">后台账号管理</span></div>
            <ul class="con">
			   <shiro:hasPermission name="XTGL_HTZHGL_YHLB">
               <li class="hover"><a href="<%=basePath %>system/consoleAccountMgt/sysUserList.do" target="mainFrame">用户列表</a></li>
               </shiro:hasPermission>
               <shiro:hasPermission name="XTGL_HTZHGL_YHZGL">
               <li><a href="<%=basePath %>system/consoleAccountMgt/sysRoleList.do" target="mainFrame">用户组管理</a></li>
               </shiro:hasPermission>
            </ul>
        </div> 
        <div class="cell">
            <div class="til"><span class="ico2">业务设置</span></div>
            <ul class="con" style="display: none;">
				<shiro:hasPermission name="XTGL_YWSZ_YHSZ">
                <li><a id="sysConstants" href="<%=basePath %>system/businessSet/bankList.do" target="mainFrame">银行设置</a></li>
                </shiro:hasPermission>
                <shiro:hasPermission name="XTGL_YWSZ_HTMBSZ">
                <li><a id="sysProperty" href="<%=basePath %>system/businessSet/contractTempList.do" target="mainFrame">合同模板设置</a></li>
                </shiro:hasPermission>
                <shiro:hasPermission name="XTGL_YWSZ_SJTXSZ">
            	<li><a id="sysProperty" href="<%=basePath %>system/businessSet/mobileRemindList.do" target="mainFrame">手机提醒设置</a></li>
            	</shiro:hasPermission>
            </ul>           
        </div>  
        <div class="cell">
            <div class="til"><span class="ico2">财务设置</span></div>
            <ul class="con" style="display: none;">
                <shiro:hasPermission name="XTGL_CWSZ_FLSZ">
                <li><a id="sysConstants" href="<%=basePath %>system/financeSet/tariffList.do" target="mainFrame">费率设置</a></li>
                </shiro:hasPermission>
            </ul>           
        </div> 
        <div class="cell">
            <div class="til"><span class="ico2">站点管理</span></div>
            <ul class="con" style="display: none;">
                <shiro:hasPermission name="XTGL_ZDSZ_ZDXXSZ">
                <li><a id="sysConstants" href="<%=basePath %>system/webSiteMgt/webSiteInfoList.do" target="mainFrame">站点信息设置</a></li>
                </shiro:hasPermission>
                <shiro:hasPermission name="XTGL_ZDSZ_ZDLOGO">
                <li><a id="sysProperty" href="<%=basePath %>system/webSiteMgt/webSiteLogo.do" target="mainFrame">站点LOGO</a></li>
                </shiro:hasPermission>
                <shiro:hasPermission name="XTGL_ZDSZ_XYTK">
            	<li><a id="sysProperty" href="<%=basePath %>system/webSiteMgt/protocolItems.do" target="mainFrame">协议条款</a></li>
            	</shiro:hasPermission>
            </ul>           
        </div> 
        <div class="cell">
            <div class="til"><span class="ico2">运营设置</span></div>
            <ul class="con" style="display: none;">
                <shiro:hasPermission name="XTGL_YYSZ_YJMB">
                <li><a id="sysConstants" href="<%=basePath %>system/operationSet/mailTempalete.do" target="mainFrame">邮件模板</a></li>
                </shiro:hasPermission>
                <shiro:hasPermission name="XTGL_YYSZ_ZNXMB">
                <li><a id="sysProperty" href="<%=basePath %>system/operationSet/letterTempalete.do" target="mainFrame">站内信模板</a></li>
                </shiro:hasPermission>
                <shiro:hasPermission name="XTGL_YYSZ_DXMB">
            	<li><a id="sysProperty" href="<%=basePath %>system/operationSet/msgTempalete.do" target="mainFrame">短信模板</a></li>
            	</shiro:hasPermission>
                <shiro:hasPermission name="XTGL_YYSZ_TGSZ">
            	<li><a id="sysProperty" href="<%=basePath %>system/operationSet/promotionTempalete.do" target="mainFrame">推广设置</a></li>
            	</shiro:hasPermission>
                <shiro:hasPermission name="XTGL_YYSZ_TYJSZ">
            	<li><a id="sysProperty" href="<%=basePath %>system/operationSet/exprMoneyTempalete.do" target="mainFrame">体验金设置</a></li>
            	</shiro:hasPermission>
            </ul>           
        </div> 
        <div class="cell">
            <div class="til"><span class="ico2">系统参数设置</span></div>
            <ul class="con" style="display: none;">
            	<shiro:hasPermission name="XTGL_XTCSSZ_PTCLSZ">
                <li><a id="sysConstants" href="<%=basePath %>system/sysArgsSet/sysConstantList.do" target="mainFrame">平台常量设置</a></li>
                </shiro:hasPermission>
                <shiro:hasPermission name="XTGL_XTCSSZ_XTSXSZ">
                <li><a id="sysConstants" href="<%=basePath %>system/sysArgsSet/sysPropList.do" target="mainFrame">系统属性设置</a></li>
                </shiro:hasPermission>
            </ul>           
        </div> 
          <div class="cell">
            <div class="til"><span class="ico2">APP版本管理</span></div>
            <ul class="con" style="display: none;">
               <shiro:hasPermission name="XTGL_APPBBGL_APPBBGL">
                <li><a id="sysConstants" href="<%=basePath %>system/appVersionMgt/appVersionMgtList.do" target="mainFrame">APP版本管理</a></li>
                </shiro:hasPermission>
            </ul>           
        </div> 
        <div class="cell">
            <div class="til"><span class="ico2">系统日志</span></div>
            <ul class="con" style="display: none;">
                <shiro:hasPermission name="XTGL_XTRZ_QTRZ">
                <li><a href="<%=basePath %>system/sysLog/frontLog.do" target="mainFrame">前台日志</a></li> 
                </shiro:hasPermission>
					<shiro:hasPermission name="XTGL_XTRZ_HTRZ">
						<li><a href="<%=basePath %>system/sysLog/consoleLog.do"
							target="mainFrame">后台日志</a></li>
					</shiro:hasPermission>
					<shiro:hasPermission name="XTGL_XTRZ_XGSZRZ">
						<li><a href="<%=basePath%>system/sysLog/sysSettingLog.do"
							target="mainFrame">修改设置日志</a></li>
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
