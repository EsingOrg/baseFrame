<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/WEB-INF/include/common/commHeader.jsp" %>
<title>推广设置</title>
</head>
<body>
<!---------------右边内容开始--------------->
      <div class="r_main clearfix">
        <!--搜索表框  -->
        <form id="mForm"   action="promotionTempaleteSave.do" method="post">
        <div class="me_con">
        <div class="part" id="con_one_1">
            <ul class="infor clearfix" >
            	<li>
            	<div class="til">
            	<input type="checkbox" name="rechargeFlag"   value="Y" ${data.firstRechargeFlag eq "Y" ? "checked" : "" } >&nbsp;推广首次充值用户 
               </div>
            	</li>
            	</ul>
            <ul class="infor clearfix" >	
                <li>
                	<div class="til"><span class="red">*&nbsp;</span>推广有效充值基数大于：</div>
            		<div class="info">
	                	 <div class="info"> <input type="text" validate="q|z" maxlength="10" name="recVilidAmount" value="${data.recVilidAmount}" class="yhgl_input w100" />元  <span class="setting_info_div">推广人获取推广用户奖励</span></div>
	                </div>
	            </li>
                <li>
                    <div class="til"><span class="red">*&nbsp;</span>成功推广1个用户奖励：</div>
                    <div class="info"> <input type="text" maxlength="10"  validate="q|z" name="recRewardAmount" value="${data.recRewardAmount}" class="yhgl_input w100" />元</div>                   
                </li>
                <li style="margin-top:40px;">
            		<div class="til">
            		<input type="checkbox" name="buyGoldFlag"  value="Y" ${data.buyGoldFlag eq "Y" ? "checked" : "" } >&nbsp;推广用户买金奖励
            		</div>
            	</li>
            	<li>
                	<div class="til"><span class="red">*&nbsp;</span>每笔买金克重大于：</div>
            		<div class="info">
	                	 <div class="info" style="width=900px;"> <input type="text" maxlength="10" validate="q|z" name="buyGoldLowAmount" value="${data.buyGoldLowAmount}" class="yhgl_input w100" />克       <span class="setting_info_div">推广人获取推广用户买金奖励</span></div>
	                </div>
	            </li>
                <li>
                    <div class="til"><span class="red">*&nbsp;</span>每笔买金有效奖金：</div>
                    <div class="info"> <input type="text" maxlength="10" validate="q|amount" name="buyGoldRewardAmount" value="${data.buyGoldRewardAmount}" class="yhgl_input w100" />
                        <select class="yhgl_sel" name="buyGoldRewardUnit">
                    		<option value="y" ${"y" eq data.buyGoldRewardUnit ? "selected" : ""}>元</option>
                    		<option value="b" ${"b" eq data.buyGoldRewardUnit ? "selected" : ""}>%</option>
                    	</select>
                    </div>                   
                </li>
                </ul>
                <ul class="infor clearfix" >
                <li style="margin-top:40px;">
            		<div class="til"><input type="checkbox" name="saveGoldFlag"  value="Y" ${data.saveGoldFlag eq "Y" ? "checked" : "" } >&nbsp;推广用户存金奖励</div>
            	</li>
            	<li>
                	<div class="til"><span class="red">*&nbsp;</span>每笔存金克重大于：</div>
            		<div class="info">
	                	 <div class="info" style="width=900px;"> <input type="text" maxlength="10" validate="q|z" name="depositGoldLowAmount" value="${data.depositGoldLowAmount}" class="yhgl_input w100" />克       <span class="setting_info_div">推广人获取推广用户存金奖励</span></div>
	                </div>
	            </li>
                <li>	
                    <div class="til"><span class="red">*&nbsp;</span>每笔存金有效奖金：</div>
                    <div class="info"> <input type="text" maxlength="10" validate="q|amount" name="depositGoldRewardAmount" value="${data.depositGoldRewardAmount}" class="yhgl_input w100" />元
                    </div>                   
                </li>
            </ul>
            <div class="btn">
            		<a id="subBtn"  class="btn_cs">提交</a>
            </div>
            </div>
            </div>
            </form>
		</div>
		</body>
<!---------------右边内容结束--------------->
<c:if test="${errMsg ne null}">
		<script type="text/javascript">
		   //错误提示
           dm.alert(decodeURIComponent('${errMsg}'));
  		</script>
</c:if>
<script type="text/javascript">
	dmCheck.init("#mForm");
	$("#subBtn").click(function(){
		$("#mForm").submit();
	});
	var message="${message}";
	if(message != ""){
		dm.alert(message);
	}
</script>
</html>
