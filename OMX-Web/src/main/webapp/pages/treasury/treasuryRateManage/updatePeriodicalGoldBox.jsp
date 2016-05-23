<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp"%>
<html>
<head>
<script type="text/javascript">
dmCheck.init("#auditing");
  function suaud(){
	  if((obj = dmCheck.returnObj("#auditing"))){
		  return obj.focus();  
	  }	
	  document.getElementById('auditing').submit();
  }
  </script>
<title>活金利率管理</title>
</head>
<body>

	<div class="systemUser">
		<div class="r_main clearfix ">
			<div class="main_con">
				<form action="<%=basePath %>treasury/updatePeriodicalGold.do" method="post" id="auditing">
					<input name="no" type="hidden" value="${pageList.data.singleResult.no }"/>
					<input name="id" type="hidden" value="${pageList.data.singleResult.id }"/>
					<input type="hidden" name="token" value="${token}"/><!--  重复提交Token-->
					<input type="hidden" name="flag" value="${pageList.data.singleResult.stepRateFlag == 'N' ? 'INSERT' : 'UPDATE'}"/><!--用于判断是新增利率还是修改-->
					<c:forEach items="${pageList.data.singleResult.rateList}" var="rate" varStatus="st">
	                	<input type="hidden" value="${rate.id }" name="rateId"/> 
	                </c:forEach>
		         <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table">
		          <tr>
		            <td valign="top" width="30%" align="right">产品ID：</td>
		            <td>${pageList.data.singleResult.no }</td>
		          </tr>
		          <tr>
		            <td valign="top" align="right"style="padding-top: 20px;"><span style="color:red;">*&nbsp;</span>产品名称：</td>
		            <td style="padding-top: 20px;"><input name="name"  value="${pageList.data.singleResult.name }" validate="q" type="text" class="yhgl_input" /></td>
		          </tr>
		          <tr>
		            <td style="padding-top: 20px;" valign="top" align="right"><span style="color:red;">*&nbsp;</span>期限：</td>
		            <td style="padding-top: 20px;"><input name="dueTime" type="text"  value="${pageList.data.singleResult.dueTime }" validate="q|z" class="yhgl_input" />天</td>
		          </tr>
		          <tr>
		            <td style="padding-top: 20px;" valign="top" align="right"><span style="color:red;">*&nbsp;</span>年利率：</td>
		            <td style="padding-top: 20px;"><input name="yearRate" type="text" validate="q|rate" id="yearRate" value="${fn:substring(pageList.data.singleResult.yearRate*100,0,fn:indexOf(pageList.data.singleResult.yearRate*100,'.')+3)}"  ${pageList.data.singleResult.stepRateFlag == 'Y' ? 'disabled':''} class="yhgl_input" />%&nbsp;&nbsp;<input name="stepRateFlag" value="Y" type="checkbox" onclick="changeFlag(this)" class="ml20" ${pageList.data.singleResult.stepRateFlag == 'Y' ? 'checked':''}/>阶梯</td>
		          </tr>
		          
		          <tbody id = "rateTable">
		          	<c:if test="${pageList.data.singleResult.stepRateFlag == 'Y'}">
		          	<tr>
				    	<td style="padding-top: 20px;" valign="top" align="right"><span style="color:red;">*&nbsp;</span>转入克重：</td>
				        <td style="padding-top: 20px;"><input type="text" name="minWeight" id="weight1" validate="q|weight" readonly="readonly" class="yhgl_input"  value="${pageList.data.singleResult.rateList[0].minWeight }"/>克-<input type="text" validate="q|weight"  name="maxWeight" class="yhgl_input" value="${pageList.data.singleResult.rateList[0].maxWeight }" onblur="setValue(this,'weight2','weight1')"/>克&nbsp;&nbsp;&nbsp;&nbsp;年利率&nbsp;<input type="text" class="yhgl_input" name="yRate" validate="q|rate" value="${fn:substring(pageList.data.singleResult.rateList[0].yearRate*100,0,fn:indexOf(pageList.data.singleResult.rateList[0].yearRate*100,'.')+3)}"/>%</td>
				    </tr>
				    <tr>
				    	<td style="padding-top: 20px;" valign="top" align="right"><span style="color:red;">*&nbsp;</span>转入克重：</td>
				        <td style="padding-top: 20px;"><input type="text" id="weight2" readonly="readonly" name="minWeight" validate="q|weight"  class="yhgl_input" value="${pageList.data.singleResult.rateList[1].minWeight }"/>克-<input type="text"  validate="q|weight"  name="maxWeight" class="yhgl_input" value="${pageList.data.singleResult.rateList[1].maxWeight }" onblur="setValue(this,'weight3','weight2')"/>克&nbsp;&nbsp;&nbsp;&nbsp;年利率&nbsp;<input type="text" class="yhgl_input" name="yRate" validate="q|rate" value="${fn:substring(pageList.data.singleResult.rateList[1].yearRate*100,0,fn:indexOf(pageList.data.singleResult.rateList[1].yearRate*100,'.')+3)}"/>%</td>
				    </tr>
				    <tr>
				    	<td style="padding-top: 20px;" valign="top" align="right"><span style="color:red;">*&nbsp;</span>转入克重大于：</td>
				        <td style="padding-top: 20px;"><input type="text" id="weight3"  readonly="readonly" name="minWeight" validate="q|weight"  class="yhgl_input"  value="${pageList.data.singleResult.rateList[2].minWeight }"/>克&nbsp;&nbsp;&nbsp;&nbsp;年利率&nbsp;<input type="text" class="yhgl_input" name="yRate" validate="q|rate" value="${fn:substring(pageList.data.singleResult.rateList[2].yearRate*100,0,fn:indexOf(pageList.data.singleResult.rateList[2].yearRate*100,'.')+3)}"/>%</td>
				    </tr>
		          </c:if>
                </tbody>
		          <tr>
		            <td style="padding-top: 20px;" valign="top" align="right"><span style="color:red;">*&nbsp;</span>投资管理费率：</td>
		            <td style="padding-top: 20px;"><input name="manageRate" type="text" value="${fn:substring(pageList.data.singleResult.manageRate*100,0,fn:indexOf(pageList.data.singleResult.manageRate*100,'.')+3)}" validate="q|rate" class="yhgl_input" />%</td>
		          </tr>
		          <tr>
		            <td style="padding-top: 20px;" valign="top" align="right"><span style="color:red;">*&nbsp;</span>最少持有天数：</td>
		            <td style="padding-top: 20px;"><input name="minDay" type="text" value="${pageList.data.singleResult.minDay }"  validate="q|z|minNum" minNum="4" class="yhgl_input" />天</td>
		          </tr>
		          <tr>
		            <td style="padding-top: 20px;" valign="top" align="right"><span style="color:red;">*&nbsp;</span>还款方式：</td>
		            <td style="padding-top: 20px;">
		            	<dim:select name="repaymentType" enumType="RepaymentType"  exclude="" cssClass="yhgl_sel"></dim:select>
                     </td>
		          </tr>
		          <tr>
		            <td style="padding-top: 20px;" valign="top" align="right"><span style="color:red;">*&nbsp;</span>起息日：</td>
		            <td style="padding-top: 20px;">
		            	<select name="valueDate" class="yhgl_sel">
                          <option value="1" ${pageList.data.singleResult.valueDate == 1 ? 'selected' : ''}>T+1</option>
                          <option value="2" ${pageList.data.singleResult.valueDate == 2 ? 'selected' : ''}>T+2</option>
                          <option value="3" ${pageList.data.singleResult.valueDate == 3 ? 'selected' : ''}>T+3</option>
                        </select>
                    </td>
		          </tr>
		          <tr>
		            <td style="padding-top: 20px;" valign="top" align="right"><span style="color:red;">*&nbsp;</span>提前转出年利率：</td>
		            <td style="padding-top: 20px;"><input name="preOutRate" type="text"  value="${fn:substring(pageList.data.singleResult.preOutRate*100,0,fn:indexOf(pageList.data.singleResult.preOutRate*100,'.')+3)}" validate="q|rate" class="yhgl_input" />%</td>
		          </tr>
		          <tr>
		            <td style="padding-top: 20px;" valign="top" align="right"><span style="color:red;">*&nbsp;</span>排序：</td>
		            <td style="padding-top: 20px;"><input name="sort" type="text" value="${pageList.data.singleResult.sort}" validate="q|z" class="yhgl_input" /></td>
		          </tr>
		          <tr>
		            <td style="padding-top: 20px;" valign="top" align="right">描述：</td>
		            <td style="padding-top: 20px;"><textarea name="termDesc"  cols="40" rows="5" validate="leng" leng="0,100" maxlength="100" class="border">${pageList.data.singleResult.termDesc }</textarea></td>
		          </tr>
		          <tr>
		            <td style="padding-top: 20px;" valign="top" align="right"><span style="color:red;">*&nbsp;</span>是否在前台展示：</td>
		            <td style="padding-top: 20px;"><input name="showFlag" ${pageList.data.singleResult.showFlag==null ? 'checked':pageList.data.singleResult.showFlag == 'Y' ? 'checked':''} type="radio" value="Y"/>&nbsp;是<input name="showFlag" type="radio" value="N" ${pageList.data.singleResult.showFlag == 'N' ? 'checked':''} class="ml20" value="N"/>&nbsp;否</td>
		          </tr>
		          <tr>
		            <td style="padding-top: 20px;" valign="top" align="right">累计成交总重：</td>
		            <td style="padding-top: 20px;">${pageList.data.columnStatResult == null ? '0.000' : pageList.data.columnStatResult.weight == null ? '0.000' : pageList.data.columnStatResult.weight}克</td>
		          </tr>
		          <tr>
		            <td style="padding-top: 20px;" valign="top" align="right">累计成交价值：</td>
		            <td style="padding-top: 20px;">${pageList.data.columnStatResult == null ? '0.000' : pageList.data.columnStatResult.amount == null ? '0.000' : pageList.data.columnStatResult.amount }元</td>
		          </tr>
		          <tr>
		            <td style="padding-top: 20px;" valign="top" align="right">累计赚取利息：</td>
		            <td style="padding-top: 20px;">${pageList.data.columnStatResult == null ? '0.000' : pageList.data.columnStatResult.finishAmount == null ? '0.000' : pageList.data.columnStatResult.finishAmount }元</td>
		          </tr>         
		        </table>
        </form>
        <div style="margin-left: 370px; margin-top:10px;"><a href="javascript:suaud();"  class="btn_cs">保存</a><a href="<%=basePath %>treasury/getTreasuryPeriodicalGoldManageList.do" style="margin-left: 170px;" class="btn_hs ml20" >取消</a></div> 
			</div>

		</div>
	</div>
</body>
  <script id="tableTemplate" type="text/x-jquery-tmpl">
	<tr>
    	<td style="padding-top: 20px;" valign="top" align="right">转入克重：</td>
        <td style="padding-top: 20px;"><input type="text" name="minWeight" validate="q|weight" id="weight1" readonly="readonly" value="0.000" class="yhgl_input"/>克-<input type="text"  validate="q|weight"  name="maxWeight" class="yhgl_input" onblur="setValue(this,'weight2','weight1')"/>克&nbsp;&nbsp;&nbsp;&nbsp;年利率&nbsp;<input type="text" class="yhgl_input" validate="q|rate" name="yRate"/>%</td>
    </tr>
    <tr>
    	<td style="padding-top: 20px;" valign="top" align="right">转入克重：</td>
        <td style="padding-top: 20px;"><input type="text" name="minWeight" validate="q|weight" id="weight2" readonly="readonly" class="yhgl_input"/>克-<input type="text" validate="q|weight"   name="maxWeight" class="yhgl_input"  onblur="setValue(this,'weight3','weight2')"/>克&nbsp;&nbsp;&nbsp;&nbsp;年利率&nbsp;<input type="text" class="yhgl_input" validate="q|rate" name="yRate"/>%</td>
    </tr>
    <tr>
    	<td style="padding-top: 20px;" valign="top" align="right">转入克重大于：</td>
        <td style="padding-top: 20px;"><input type="text" name="minWeight" validate="q|weight" id="weight3" readonly="readonly" class="yhgl_input"/>克&nbsp;&nbsp;&nbsp;&nbsp;年利率&nbsp;<input type="text" class="yhgl_input" validate="q|rate" name="yRate"/>%</td>
    </tr>
  </script> 
<script>
	//选中阶梯利率时，显示利率输入框
	function changeFlag(_this){
		if(_this.checked == true){
			$("#rateTable").empty();
			$('#tableTemplate').tmpl().appendTo("#rateTable");
			$("#yearRate").attr("disabled","disabled");
		}else{
			$("#rateTable").empty();
			$("#yearRate").removeAttr("disabled");
		}
	}
	
	//阶梯利率规则限制
	function  setValue(_this,setId,getId){
		//判断格式否正确
		if(dmCheck.checkOne($(_this))){
			//当前输入的值
			var value=$(_this).val();
			//需要赋值的值
			var getValue=$("#"+getId).val();
			//判断数据是否正确
			if(value - getValue > 0){
				$("#"+setId).val(value);
			}else{
				$(_this).focus();
				$("span.pop-con").remove();
				$(_this).before('<span class="pop-con"><div class="fl pop-pic"></div><div class="pop-info">数值应该大于'+getValue+'</div></span>');
				//定时清除校验提示
				setTimeout(function() {
					$("span.pop-con").fadeOut("slow");
				}, 1000);
				
			}
			
		};
		
	}
</script>
</html>
							

