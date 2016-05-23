<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/WEB-INF/include/common/commHeader.jsp" %>
<title>体验金设置</title>
</head>
<body>
<!---------------右边内容开始--------------->
<div class="r_main clearfix">
  <div class="menubox clearfix">
	<ul>
		<li class="hover" id="auto"><a href="#">自动发放</a></li>
		<li id="manu"><a href="#">手动充值</a></li>
	</ul>
  </div>
	<div class="menu_bd clearfix" id="autoPanel">
        <!--搜索表框  -->
        <form id="mForm" action="exprMoneyTempSave.do" method="post">
        <div class="me_con">
        <div class="form_title"></div>
        <div class="part" id="con_one_1">
        	<ul class="infor clearfix">
        		<li>
        			<div class="til"><input name="isGiveReg"  type="checkbox" value="Y" ${data.isGiveReg eq "Y" ? "checked" : "" } />注册赠送体验金</div>
        		</li>
        	</ul>
            <ul class="infor clearfix" >
                <li>
                    <div class="til"><span class="red">*&nbsp;</span>赠送金额：</div>
                    <div class="info">
                    	<input type="text" maxlength="10" name="regAmount" validate="q|amount"  value="${data.regAmount}" class="yhgl_input w100" />&nbsp;元&nbsp;&nbsp;&nbsp;&nbsp;
                    	<span class="red">*&nbsp;</span>有效期：<input type="text" maxlength="4" validate="q|z" name="regExpDate"  value="${data.regExpDate}" class="yhgl_input w100" />&nbsp;天&nbsp;&nbsp;&nbsp;&nbsp;
                    	<span class="red">*&nbsp;</span>收益期：<input type="text" maxlength="3" validate="q|z" name="regIncome"  value="${data.regIncome}" class="yhgl_input w100" />&nbsp;天&nbsp;&nbsp;&nbsp;
                    </div>                   
                </li>
            </ul>
            
            <br>
            <ul class="infor clearfix">
        		<li>
        			<div class="til"><input name="iSGiveBugGold"  type="checkbox" value="Y" ${data.iSGiveBugGold eq "Y" ? "checked" : "" } />首次买金赠送体验金</div> 
        		</li>
        	</ul>
            <ul class="infor clearfix" >
                <li>
                    <div class="til"><span class="red">*&nbsp;</span>买金克数小于：</div>
                    <div class="info">
                    	<input type="text" maxlength="10" id="investAmountLimit" validate="q|weight" name="blInfo.interval"  value="${data.blInfo.interval}" class="yhgl_input w100" />&nbsp;克&nbsp;&nbsp;&nbsp;&nbsp;
                    	<span class="red">*&nbsp;</span>赠送金额：<input type="text" validate="q|amount" maxlength="10" name="blInfo.amount"  value="${data.blInfo.amount}" class="yhgl_input w100" />&nbsp;元&nbsp;&nbsp;&nbsp;&nbsp;
                    	<span class="red">*&nbsp;</span>有效期：<input maxlength="4" type="text" validate="q|z" name="blInfo.period"  value="${data.blInfo.period}" class="yhgl_input w100" />&nbsp;天&nbsp;&nbsp;&nbsp;&nbsp;
                    	<span class="red">*&nbsp;</span>收益期：<input maxlength="3" type="text" validate="q|z" name="blInfo.income"  value="${data.blInfo.income}" class="yhgl_input w100" />&nbsp;天&nbsp;&nbsp;&nbsp;
                    </div>                   
                </li>
                
                <li>
                    <div class="til"><span class="red">*&nbsp;</span>买金克数大于或等于：</div>
                    <div class="info">
                    	<input type="text" maxlength="10"  id="investAmountMax" readonly validate="q|weight"  name="bgInfo.interval"  value="${data.bgInfo.interval}" class="yhgl_input w100" />&nbsp;克&nbsp;&nbsp;&nbsp;&nbsp;
                    	<span class="red">*&nbsp;</span>赠送金额：<input type="text" validate="q|amount" maxlength="10" name="bgInfo.amount"  value="${data.bgInfo.amount}" class="yhgl_input w100" />&nbsp;元&nbsp;&nbsp;&nbsp;&nbsp;
                    	<span class="red">*&nbsp;</span>有效期：<input maxlength="4" type="text" validate="q|z" name="bgInfo.period"  value="${data.bgInfo.period}" class="yhgl_input w100" />&nbsp;天&nbsp;&nbsp;&nbsp;&nbsp;
                    	<span class="red">*&nbsp;</span>收益期：<input maxlength="3" type="text" validate="q|z" name="bgInfo.income"  value="${data.bgInfo.income}" class="yhgl_input w100" />&nbsp;天&nbsp;&nbsp;&nbsp;
                    </div>                   
                </li>
                 
            </ul>
            <br>
             <ul class="infor clearfix">
        		<li>
        			<div class="til"><input name="iSGiveDepositGold"  type="checkbox" value="Y" ${data.iSGiveDepositGold eq "Y" ? "checked" : "" } />首次存金赠送体验金</div> 
        		</li>
        	</ul>
            <ul class="infor clearfix" >
                <li>
                    <div class="til"><span class="red">*&nbsp;</span>存金克数小于：</div>
                    <div class="info">
                    	<input type="text" maxlength="10" id="investAmountLimit1" validate="q|weight" name="dlInfo.interval"  value="${data.dlInfo.interval}" class="yhgl_input w100" />&nbsp;克&nbsp;&nbsp;&nbsp;&nbsp;
                    	<span class="red">*&nbsp;</span>赠送金额：<input type="text" validate="q|amount" maxlength="10" name="dlInfo.amount"  value="${data.dlInfo.amount}" class="yhgl_input w100" />&nbsp;元&nbsp;&nbsp;&nbsp;&nbsp;
                    	<span class="red">*&nbsp;</span>有效期：<input maxlength="4" type="text" validate="q|z" name="dlInfo.period"  value="${data.dlInfo.period}" class="yhgl_input w100" />&nbsp;天&nbsp;&nbsp;&nbsp;&nbsp;
                    	<span class="red">*&nbsp;</span>收益期：<input maxlength="3" type="text" validate="q|z" name="dlInfo.income"  value="${data.dlInfo.income}" class="yhgl_input w100" />&nbsp;天&nbsp;&nbsp;&nbsp;
                    </div>                   
                </li>
                
                <li>
                    <div class="til"><span class="red">*&nbsp;</span>存金克数大于或等于：</div>
                    <div class="info">
                    	<input type="text" maxlength="10"  id="investAmountMax1" readonly validate="q|weight"  name="dgInfo.interval"  value="${data.dgInfo.interval}" class="yhgl_input w100" />&nbsp;克&nbsp;&nbsp;&nbsp;&nbsp;
                    	<span class="red">*&nbsp;</span>赠送金额：<input type="text" validate="q|amount" maxlength="10" name="dgInfo.amount"  value="${data.dgInfo.amount}" class="yhgl_input w100" />&nbsp;元&nbsp;&nbsp;&nbsp;&nbsp;
                    	<span class="red">*&nbsp;</span>有效期：<input maxlength="4" type="text" validate="q|z" name="dgInfo.period"  value="${data.dgInfo.period}" class="yhgl_input w100" />&nbsp;天&nbsp;&nbsp;&nbsp;&nbsp;
                    	<span class="red">*&nbsp;</span>收益期：<input maxlength="3" type="text" validate="q|z" name="dgInfo.income"  value="${data.dgInfo.income}" class="yhgl_input w100" />&nbsp;天&nbsp;&nbsp;&nbsp;
                    </div>                   
                </li>
                 
            </ul>
            <div class="btn w600">
            	<a id="subBtn" href="javascript:void(0)" class="btn_cs">提交</a>
            </div>
            </div>
            </div>
            </form>
		</div>
		<div style="display:none;">
		</div>
	<!-- 手动充值 -->
	<div class="menu_bd clearfix" style="display: none" id="manuPanel">
	  <!-- 搜索框 -->
		<form action="searchRecharge.do" method="post" id="form">
			<div class="main_con">
				<div class="admin_input clearfix">
				    <p>
						用户名： <input type="text" name="userName" class="yhgl_input"
							 maxlength="20" />
					</p>
					<p>
						金额范围： <input type="text" name="lowAmucount" class="yhgl_input"
							 maxlength="20" />
						至 <input type="text" name="greatAmucount" class="yhgl_input"
							 maxlength="20" />
					</p>
					<p>
						操作人： <input type="text" name="createBy" class="yhgl_input"
							 maxlength="20" />
					</p>
					<p>
						开始时间： <input type="text" name="gsTime"
							 class="yhgl_input date"
							class="Wdate" id="startDate"
							onclick="WdatePicker({readOnly:true,maxDate:'#F{$dp.$D(\'endDate\')}'})" />
						<span class="mr5">至</span> <input type="text" name="geTime"
							 class="yhgl_input date"
							class="Wdate" id="endDate"
							onclick="WdatePicker({readOnly:true,minDate:'#F{$dp.$D(\'startDate\')}'})" />
					</p>
					<p>
						失效时间： <input type="text" name="esTime"
							 class="yhgl_input date"
							class="Wdate" id="startDate"
							onclick="WdatePicker({readOnly:true,maxDate:'#F{$dp.$D(\'endDate\')}'})" />
						<span class="mr5">至</span> <input type="text" name="eeTime"
							 class="yhgl_input date"
							class="Wdate" id="endDate"
							onclick="WdatePicker({readOnly:true,minDate:'#F{$dp.$D(\'startDate\')}'})" />
					</p>
					<p class="lo_btn">
						<input type="button" class="search" onclick="search();" value="查询" /> 
						<shiro:hasPermission name="XTGL_YYSZ_TYJSZ_CZ">
						<a onclick="popDiv('exprMoneyTempaleteAdd.do')" href="javascript:void(0)" class="btn_cs ml10"><i class="newly"></i>充值</a>
						</shiro:hasPermission>
						<shiro:hasPermission name="XTGL_YYSZ_TYJSZ_DC">
						<input name="input" type="button" class="export ml10"
 							value="导出" onclick="exportData('form','exportRecharge.do');"/>
 						</shiro:hasPermission>
					</p>
				</div>
			</div>
		</form>
		<div class="main_con">
				<!-- 表格框 -->
				 <table   width="100%" border="0" cellspacing="0" cellpadding="3" class="main_table tc" >
						<thead>
							<tr class="title">
								<td>序号</td>
							    <td>用户名</td>
							    <td>姓名</td>
								<td>金额(元)</td>
								<td>收益期(天)</td>
								<td>开始时间</td>
								<td>失效时间</td>
								<td>操作人</td>
								<td>操作时间</td>
								<td>备注</td>
							</tr>
				        </thead>
					<tbody id="grid"></tbody>
				</table>
				<!-- 表格框 --END -->
				<!-- 分页组件-->
				<div id="expPageTag"></div>
				<!-- 分页组件 --END -->
		 </div>
		<!--搜索表框  --END-->
	</div>
</div>
<c:if test="${errMsg ne null}">
  <script type="text/javascript">
    dm.alert(decodeURIComponent('${errMsg}'));
  </script>
</c:if>	
<!---------------右边内容结束--------------->
<!-- 表格数据模板 -->
<script id="template" type="text/x-jquery-tmpl">
 {{each(index) list}}
       <tr {{if index %2 == 0}}class="grey" {{/if}}>
        <td>{{= index+1}}</td> 
	    <td>{{= userName}}</td>
	    <td>{{= realName}}</td>
        <td>{{= amount}}</td> 
	    <td>{{= incomeDay}}</td>
	    <td>{{= startTime}}</td>
        <td>{{= endTime}}</td> 
		<td>{{= createBy}}</td>
		<td>{{= createTime}}</td>
		<td>{{= remark}}</td>
       </tr>
  {{/each}}
 </script>
<script type="text/javascript">	
	dmCheck.init("#mForm");
	$(function(){
		//初始化事件
		eventInit();
	});
	//初始化Panel切换事件
	function eventInit(){
	  //提交时间
	  $("#subBtn").click(function(){
			$("#mForm").submit();
	  });
	  //填充值
	  $("#rechargeAdd").click(function(){
			$("#reIn").after($("#reCopy").html());
	  });
	  //显示autoPanel
	  $("#auto").click(function(){
  		  $(this).addClass("hover");
  		  $("#manu").removeClass("hover"); 
  		  $("#manuPanel").css("display","none");
  		  $("#autoPanel").css("display","block");
  	  });
	  //显示manuPanel
  	  $("#manu").click(function(){
  		  $(this).addClass("hover");
  		  $("#auto").removeClass("hover");
  		  $("#autoPanel").css("display","none");
  		  $("#manuPanel").css("display","block");
  		  loadData();
  	  });
  	  //自动设置大于值
  	  $("#investAmountLimit").blur(function(){
  		$("#investAmountMax").val($("#investAmountLimit").val());
  	  });
  	  //自动设置大于值
  	  $("#investAmountLimit1").blur(function(){
  		$("#investAmountMax1").val($("#investAmountLimit1").val());
  	  });
	}
	//初始加载数据
	function loadData(){
		DMGold.ajax({"formId":"form","serialize":true,"url":"searchExprAjax.do","success":backFunc1});
	}
	//回调函数
	function backFunc1(data){
		//初始化数据
		$("#grid").empty();
		$('#template').tmpl(data.pageResult).appendTo("#grid");
		//初始化分页标签
		DMGold.PageTag.init({"divId":"expPageTag","formId":"form","curPage":data.pageResult.pageIndex,"totalCount":data.pageResult.recordCount,
	          "pageCount":data.pageResult.pageTotal,"url":"searchExprAjax.do","toPageCallBack":backFunc1});
	}
	//表单查询事件
	function search(){
		loadData();
	}
	//弹出框
    function popDiv(url){
 	   $.tbox.popup(url);
    }
</script>
</body>
</html>
