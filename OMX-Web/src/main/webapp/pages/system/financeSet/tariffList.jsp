<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/WEB-INF/include/common/commHeader.jsp" %>
<title>费率设置</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/admin.css"/>
</head>
<body>
<!---------------右边内容开始--------------->
      <div class="r_main clearfix">
        <!--搜索表框  -->
        <form id="mForm" action="tariffListSave.do" method="post">
        <input type="hidden" name="token" value="${token}">
        <input type="hidden" name="id" value="${sac.id}" />
        <div class="me_con">
        <div class="form_title">个人费率设置</div>
        <div class="part" id="con_one_1">
        	<ul class="infor clearfix">
        		<li>
        			<div class="til"><b>充值手续费：</b></div><div class="info"> <span class="setting_info_div">0表示不收取手续费，单位为元则按固定金额收取，单位为百分比则按充值金额百分比收取</span></div> 
        		</li>
        	</ul>
            <ul class="infor clearfix" >
             <c:forEach items="${data.reSrbList}" var="srb" varStatus="vs">
                <li>
                    <div class="til"><span class="red">*&nbsp;</span>充值小于或等于：</div>
                    <div class="info">
                    	<input type="text" validate="q|z" maxlength="10"  name="recharge[${vs.index}].interval"   value="${srb.interval}" class="yhgl_input w100 rechargeLt" />&nbsp;元&nbsp;&nbsp;&nbsp;&nbsp;
                    	<span class="red">*&nbsp;</span>收取：<input type="text" maxlength="10" validate="q|amount" name="recharge[${vs.index}].charges"   value="${srb.charges}" class="yhgl_input w100 " />
                    	<select class="yhgl_sel" name="recharge[${vs.index}].unit" >
                    		<option ${srb.unit eq "y" ? "selected" : ""} value="y">元</option>
                    		<option ${srb.unit eq "b" ? "selected" : ""} value="b">%</option>
                    	</select>
                    	<c:if test="${vs.count ne 1}"><a name="delBtnRe" class="ico_delete">删除</a></c:if>
                    </div>   
                </li>
            </c:forEach>
                <li id="reIn"></li>
                <li>
                    <div class="til">充值大于：</div>
                    <div class="info">
                    	<input type="text" readonly name="reSrbLast.interval" id='reSrbLastInterval'  value="${data.reSrbLast.interval}" class="yhgl_input w100" />&nbsp;元&nbsp;&nbsp;&nbsp;&nbsp;
                    	<span class="red">*&nbsp;</span>收取：<input type="text" maxlength="10" validate="amount" name="reSrbLast.charges"  value="${data.reSrbLast.charges}" class="yhgl_input w100" />
                    	<select class="yhgl_sel" name="reSrbLast.unit">
                    		<option value="y" ${data.reSrbLast.unit eq "y" ? "selected" : ""}>元</option>
                    		<option value="b" ${data.reSrbLast.unit eq "b" ? "selected" : ""}>%</option>
                    	</select>
                    	<a id="rechargeAdd" class="ico_add"></a>
                    </div>                   
                </li>
                <li>
                    <div class="til">扣取方式：</div>
                    <div class="info">
                    <dim:radio name="rechargeWay" enumType="FinanceDeductWay" value="${data.rechargeDeductWay}"/>
                    </div>
                </li>  
            </ul>
            <br>
            <ul class="infor clearfix">
        		<li>
        			<div class="til"><b>提现手续费：</b></div>
        			<div class="info">
                      	  <span class="setting_info_div">0表示不收取手续费，单位为元则按固定金额收取，单位为百分比则按提现金额百分比收取</span>
        			</div>
        		</li>
        	</ul>
            <ul class="infor clearfix" >
             <li>
            <div class="til"><span class="red">*&nbsp;</span>最小提现金额：</div>
            <div class="info">
            <input type="text" maxlength="10" validate="q|amount" class="yhgl_input w100" id="minAmount" name="minAmount" value="${data.minAmount}" /> &nbsp;元&nbsp;&nbsp;&nbsp;&nbsp;
            </div>
            </li>
            <c:forEach items="${data.wiSrbList}" var="srb" varStatus="vs">
                <li>
                    <div class="til"><span class="red">*&nbsp;</span>提现小于或等于：</div>
                    <div class="info">
                    	<input type="text" ${vs.count eq 1 ? "id='firstWith'" : ""} maxlength="10" validate="q|z"  name="withdraw[${vs.index}].interval"   value="${srb.interval}" class="yhgl_input w100 withdrawLt" />&nbsp;元&nbsp;&nbsp;&nbsp;&nbsp;    
                    	<span class="red">*&nbsp;</span>收取：<input type="text" maxlength="10" validate="q|amount" name="withdraw[${vs.index}].charges"   value="${srb.charges}" class="yhgl_input w100" />
                    	<select class="yhgl_sel" name="withdraw[${vs.index}].unit">
                    		<option ${srb.unit eq "y" ? "selected" : ""} value="y">元</option>
                    		<option ${srb.unit eq "b" ? "selected" : ""} value="b">%</option>
                    	</select>
                    	<c:if test="${vs.count ne 1}"> <a name="delBtnWi" class="ico_delete" >删除</a> </c:if>
                    </div>                   
                </li>
            </c:forEach> 
                <li id="wiIn"></li>
                <li>
                    <div class="til">一次提现最大金额：</div>
                    <div class="info">
                      <input type="text" validate="q|amount" readonly id="maxAmount" name="maxAmount"  value="${data.maxAmount}" class="yhgl_input w100" />&nbsp;元&nbsp;&nbsp;&nbsp;&nbsp;
                      <a id="withdrawAdd"  class="ico_add"></a>
                    </div>
                </li>
                            
                <li>
                    <div class="til">扣取方式：</div>
                    <div class="info">
                    <dim:radio name="withdrawWay" enumType="FinanceDeductWay" value="${data.withdrawDustWay}"/>
                    </div>
                </li>  
            </ul>
            <ul class="infor clearfix">
        		<li>
        			<div class="til">
        				<b>活金利息按年计算天数：</b>
        			</div>
        			<div class="info">
        			<input type="radio" ${data.yearDays eq "360" ? "checked" : ""} name="repaymentDays" value="360" />360天&nbsp;&nbsp;
        			<input type="radio" value="365" ${data.yearDays eq "365" ? "checked" : "" } name="repaymentDays" />365天 &nbsp;  
        			 <span class="setting_info_div">表示计算年化收率的天数</span>    
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
	<ul id="reCopy">
		<li>
			<div class="til"><span class="red">*&nbsp;</span>充值小于或等于：</div>
			<div class="info">
				<input type="text" validate="q|amount" name="interval" id="rcInterval" value="" class="yhgl_input w100 rechargeLt" />&nbsp;元&nbsp;&nbsp;&nbsp;&nbsp;
				<span class="red">*&nbsp;</span>收取：<input type="text" validate="q|amount" id="rcCharges" name="charges"  value="" class="yhgl_input w100" />
				<select class="yhgl_sel" name="unit" id="rcUnit">
					<option value="y">元</option>
					<option value="b">%</option>
				</select>
				<a name="delBtnRe" class="ico_delete"></a>
			</div>                   
		</li>
	</ul>
	
	<ul id="wiCopy">
		<li>
			<div class="til"><span class="red">*&nbsp;</span>提现小于或等于：</div>
			<div class="info">
				<input type="text" validate="q|amount"id="wcInterval" name="interval"  value="" class="yhgl_input w100 withdrawLt" />&nbsp;元&nbsp;&nbsp;&nbsp;&nbsp;
				<span class="red">*&nbsp;</span>收取：<input type="text" validate="q|amount" id="wcCharges" name="charges"  value="" class="yhgl_input w100" />
					<select class="yhgl_sel" id="wcUnit" name="unit">
						<option value="y">元</option>
						<option value="b">%</option>
					</select>
					<a name="delBtnWi" class="ico_delete"></a>
			</div>                   
		</li>
	</ul>
	</div>
<!---------------右边内容结束--------------->
<c:if test="${errMsg ne null}">
<script type="text/javascript">
//错误提示
dm.alert(decodeURIComponent('${errMsg}'));
  		</script>
</c:if>
<script type="text/javascript">	
	dmCheck.init("#mForm");
	
	$(function(){
		$("#subBtn").click(function(){
			if(!beforeSubmit()){
				dm.alert("配置信息填写错误!");
				return null;
			}
			$("#mForm").submit();
		});
		var reSrbList = ${data.reSrbList};
		var wiSrbList = ${data.wiSrbList};
		var reSrbListCount = reSrbList.length;
		var wiSrbListCount = wiSrbList.length;
		$("#rechargeAdd").click(function(){
			var rcInterval = $("#rcInterval"),rcCharges = $("#rcCharges"),rcUnit = $("#rcUnit");
			rcInterval.attr("id","");
			rcCharges.attr("id","");
			rcUnit.attr("id","");
			rcInterval.attr("name","recharge["+reSrbListCount+"].interval");
			rcCharges.attr("name","recharge["+reSrbListCount+"].charges");
			rcUnit.attr("name","recharge["+reSrbListCount+"].unit");
			$("#reIn").before($("#reCopy").html());
			rcInterval.attr("id","rcInterval");
			rcCharges.attr("id","rcCharges");
			rcUnit.attr("id","rcUnit");
			rcInterval.attr("name","");
			rcCharges.attr("name","");
			rcUnit.attr("name","");
			reSrbListCount++;
		});
		
		$("[name=delBtnRe]").live("click",function(){
			reSrbListCount--;
			$(this).closest("li").remove();
			$("#reSrbLastInterval").val($("#mForm .rechargeLt").last().val());
		});
		
		$("[name=delBtnWi]").live("click",function(){
			wiSrbListCount--;
			$(this).closest("li").remove();
			$("#maxAmount").val($("#mForm .withdrawLt").last().val());
		});
		
		$("#withdrawAdd").click(function(){
			var wcInterval = $("#wcInterval"),wcCharges = $("#wcCharges"),wcUnit = $("#wcUnit");
			wcInterval.attr("id","");
			wcCharges.attr("id","");
			wcUnit.attr("id","");
			wcInterval.attr("name","withdraw["+wiSrbListCount+"].interval");
			wcCharges.attr("name","withdraw["+wiSrbListCount+"].charges");
			wcUnit.attr("name","withdraw["+wiSrbListCount+"].unit");
			$("#wiIn").before($("#wiCopy").html());
			wcInterval.attr("id","wcInterval");
			wcCharges.attr("id","wcCharges");
			wcUnit.attr("id","wcUnit");
			wcInterval.attr("name","");
			wcCharges.attr("name","");
			wcUnit.attr("name","");
			wiSrbListCount++;
		});
			
		$(".rechargeLt").live("blur",function(){
			$("#reSrbLastInterval").val($("#mForm").find(".rechargeLt").last().val());
		});
		
		$(".withdrawLt").live("blur",function(){
			$("#maxAmount").val($("#mForm").find(".withdrawLt").last().val());
		});
		
		$(".rechargeLt").live("blur",function(){
			if($(this).closest("li")!=null){
				var top=$(this).closest("li").prev("li").find(".rechargeLt").val();
				if(parseFloat($(this).val())<parseFloat(top)){
					tip($(this),"此项的值不能比上面的小");
				}
			}
		});
		$(".withdrawLt").live("blur",function(){
			if($(this).closest("li")!=null){
				var top=$(this).closest("li").prev("li").find(".withdrawLt").val();
				if(parseFloat($(this).val())<parseFloat(top)){
					tip($(this),"此项的值不能比上面的小");
				}
			}
			
		});
		
		function beforeSubmit(){
			var objs=$("#mForm .withdrawLt");
			var objsRe=$("#mForm .rechargeLt");
			if(parseInt($("#mForm .withdrawLt").first().val())<parseInt($("#minAmount").val())){
            	tip($("#firstWith"),"此项的值不可以小于最小提现金额");
            	return false;
			}
			for(var i=1;i<objsRe.length;i++){
			      if(parseFloat($(objsRe[i]).val()) < parseFloat($(objsRe[i-1]).val())){
			    	  tip($(objsRe[i]),"此项的值不能比上面的小");
			    	  $(objsRe[i]).focus();
			    	  return false;
			      }
			}
			for(var i=1;i<objs.length;i++){
			      if(parseFloat($(objs[i]).val()) < parseFloat($(objs[i-1]).val())){
			    	  tip($(objs[i]),"此项的值不能比上面的小");
			    	  $(objs[i]).focus();
			    	  return false;
			      }
			}
			return true;
		}
		
	});
	
	var message="${message}";
	if(message != ""){
		dm.alert(message);
	}
</script>
</body>
</html>
