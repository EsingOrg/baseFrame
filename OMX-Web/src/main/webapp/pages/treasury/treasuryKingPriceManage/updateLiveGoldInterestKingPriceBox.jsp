<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ include file="/WEB-INF/include/common/popDivHeader.jsp"%>
<html>
<head>
<title>新建金价</title>
<script type="text/javascript">
dmCheck.init("#auditing");
function suaud(){
	  if((obj = dmCheck.returnObj("#auditing")))	return obj.focus();
	  //关闭当前弹出编辑框
	  $.tbox.close();
	  //提示操作状态
	  dm.confirm("当前平台活金结息金价：${nowPrice} 元/克" + "<br/>是否确认将最新交易金价修改为：<span class='red'>"+$("#amount").val()+"</span>元/克",{
		title:"确认修改信息",				//标题
		okName:"确定",			//如同confirm确定按钮的value
		cancleName:"取消",		//如同confirm取消按钮的value
		callback:function(){	//按确定的执行的函数
        	$.ajax({
      		  type: "POST",
      		  url:"updateGoldPriceByNo.do",	//请求路径
      		  data:$('#auditing').serialize(),	//要发送的是ajaxFrm表单中的数据
      		  success: function(result) {//result参数{msg:"",success:boolean,data:{}}
      			  //判断后台执行操作是否成功，如果成功：提示操作成功，并刷新页面。否则提示操作失败，不刷新页面
      			  if(result.flag.code=='000000'){
      				  //关闭当前弹出编辑框
      				  $.tbox.close();
      				  //提示操作状态
      				  dm.alert("修改成功",{
      			        title:"提示",				//弹窗的标提
      			        okName:"确定",			//如同alert确定按钮的value
      			        picClass:"d_succeed",		//这里有三个值 "d_succeed" 显示成功图标,"d_error" 显示错误图标,"d_perfect" 显示信息提示图标,
      			        notHaveClose:"xxx",     //不定义此属性则有“x”关闭按钮
      			        callback:function(){	//按确定后执行的函数
      			        	 window.location.href='<%=basePath%>treasury/getLiveGoldInterestKingPrice.do';
      			     
      			        }
      		           });
      				  
      			  }else{
      				  dm.alert(result.flag.description);
      			  }
      		  }
      		});			     
        }
          });
  }
  </script>
</head>
<body>

	<div class="popup_bg"></div>
	<div class="dialog">
		<div class="clearfix">
			<div class="title">
				<a href="javascript:;" onClick="$.tbox.close()" class="out"></a>修改活金日息金价
			</div>
			<div class="cotent">
				<form action="<%=basePath%>treasury/updateLiveGoldInterestKingPrice.do" method="post" id="auditing">
					<input type="hidden" value="${no }" name="no"/>
					<input type="hidden" value="${price }" name="price"/>
					<input type="hidden" value="${time }" name="time"/>
					<input type="hidden" name="token" value="${token}"/><!--  重复提交Token-->
					<div style="text-align: center;">
						当前平台活金日息金价：<span class="red">${nowPrice}</span>元/克
					</div>
					<table width="100%" border="0" cellspacing="0" cellpadding="0"
						class="table">
						<tr>
							<td valign="top" width="30%" align="right">修改金价：</td>
							<td><input name="updatePrice" type="text"  id="amount" class="yhgl_input" validate="q|amount" maxlength="10"/>元/克</td>
						</tr>
					</table>
				</form>
			</div>
			<div class="btn">
				<a href="javascript:suaud();" class="btn_cs">确定</a><a href="#"
					class="btn_hs ml20" onClick="$.tbox.close()">取消</a>
			</div>
		</div>
	</div>
</body>
</html>
