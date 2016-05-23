<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ include file="/WEB-INF/include/common/popDivHeader.jsp" %>
<%@ include file="/WEB-INF/include/common/commHeader.jsp"%>
<html>
  <head>
    <title>新增入库</title>
  </head>
  <body>
<div class="popup_bg"></div>
<div class="dialog">
  <div class="clearfix"> 
      <div class="title"><a href="javascript:;" onClick="$.tbox.close()" class="out"></a>新建入库</div>
      <div class="cotent">
       <form id="publicForm"  method="post" id="auditing" action="<%=basePath %>business/platFormWarehouse/addInboundBoxDeatil.do">
         <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table">
          <tr>
            <td valign="top" width="30%" align="right"><span class="red">*</span>采购入库克重：</td>
            <td><input name="weight" value="${insertReq.weight}" type="text" class="yhgl_input" onblur="cacuAmoutn();" validate="q|weight"/>克
            </td>
          </tr> 
          <tr>
            <td valign="top" align="right"><span class="red">*</span>入库单价：</td>
            <td><input name="price" value="${insertReq.price}" type="text" class="yhgl_input" onblur="cacuAmoutn();" validate="q|amount"/>元/克</td>
          </tr>
          <tr>
            <td valign="top" align="right"><span class="red">*</span>总额：</td>
            <td><input name="amount" value="${insertReq.amount}" type="text" class="yhgl_input" readonly="readonly" validate="q|amount"/>元</td>
          </tr>
          <tr>
            <td valign="top" align="right"><span class="red">*</span>入库类型：</td>
            <td>
            	<input name="type" value="正常入库" type="radio" checked="checked"  />正常入库
            	<input name="type" type="radio" value="调整入库" />调整入库
            </td>
          </tr>
          <tr>
            <td valign="top" align="right">备注：</td>
            <td><textarea rows="3" cols="30" id="remark" name="remark" validate="leng" leng="0,30" maxlength="30"> </textarea>
            </td>
          </tr>
        </table>
        	<div class="btn">
	      		<input name="input" type="button" class="btn_cs ml10" value="确认" onclick="save()"/>
	      		<input type="button" class="btn_cs ml10" value="取消" onclick="javascript:$.tbox.close();"/>
      		</div>
        </form>
      </div>
      
       <!-- <div class="btn"><a href="javascript:suaud();" class="btn_cs">确定</a><a href="#" class="btn_hs ml20" onClick="$.tbox.close()" >取消</a></div> -->
         
    </div>
    </div>
 <script type="text/javascript">
 dmCheck.init("#publicForm");
 function save(){
	  if(!dmCheck.check("#publicForm")){
			return false;
		}
	  changeStatus($("input[name='weight']").attr("value"),$("input[name='price']").attr("value"),
			      $("input[name='amount']").attr("value"),$("input:checked").attr("value"),
			      $("#remark").val());
 }
 //提示是否处理
  function changeStatus(weight,price,amount,type,remark){
	 	$("#diaweight").text(parseFloat(weight).toFixed(3));
	 	$("#diaprice").text(parseFloat(price).toFixed(2));
	 	$("#diaamount").text(amount);
	 	$("#diatype").text(type);
	 	$("#diaremark").text(remark);
 		$("#msgT").css("display","block");
  }
 //计算总额
 function cacuAmoutn(){
	 
	 $("input[name='amount']").val(muli($("input[name='weight']").val(),$("input[name='price']").val()).toFixed(2));
 }
 function muli(arg1,arg2){
		var m=0,s1=arg1.toString(),s2=arg2.toString();
		try{m+=s1.split(".")[1].length;}catch(e){}
		try{m+=s2.split(".")[1].length;}catch(e){}
		return Number(s1.replace(".",""))*Number(s2.replace(".",""))/Math.pow(10,m); 
	}
 function thSubmit(){
	 $('#msgT').css('display','none');
	 $("#publicForm").submit();
	 $.tbox.close();
 }
  </script>
<div id="msgT" style="display:none;">
<div class="popup_bg"></div>
<div class="dialog">
  <div class="clearfix"> 
      <div class="title"><a href="javascript:void(0)" class="out" onclick="$('#msgT').css('display','none');"></a>确认提交?</div>
      <div class="cotent clearfix">
         <div class="conn">
         <form id="outForm" action="addDiffAdjustBoxDeatil.do" method="post">
             <input type="hidden" name="shopId" id="subShopId">
             <p class="tl f16 mt10">采购入库克重：<span id="diaweight" class="green f24"></span><span> 克</span></p>
             <p class="f16 tl mt10">入库单价：<span id="diaprice" class="yellow f24" ></span><span > 元/克</span></p>
             <p class="f16 tl mt10">总额：<span id="diaamount" class="yellow f24" ></span><span> 元</span></p>
             <p class="f16 tl mt10">入库类型：<span id="diatype" class="yellow f24" ></span></p>
             <p class="f16 tl mt10">备注：<span id="diaremark" class="yellow f24" ></span></p>
        	</form>
         </div> 
         <div class="btn"><a href="javascript:void(0)" onclick="thSubmit();"  class="btn_cs">确定</a><a href="javascript:void(0)" class="btn_hs ml20" onclick="$('#msgT').css('display','none');">取消</a></div>
      </div>     
    </div>
</div>
</div>
  </body>
</html>
