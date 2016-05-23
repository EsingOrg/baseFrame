<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ include file="/WEB-INF/include/common/popDivHeader.jsp" %>
<%@ include file="/WEB-INF/include/common/commHeader.jsp"%>
<html>
  <head>
    <title>确认称差</title>
<script type="text/javascript">
  function suaud(){
	  $.ajax({
  		  cache: false,
  		  type: "POST",
  		  url:"<%=basePath %>business/platFormWarehouse/addDiffAdjustBoxSure.do",	//请求路径
  		  data:$('#auditing').serialize(),	//要发送的是ajaxFrm表单中的数据
  		  contentType : "application/json",
  		  dataType : "json",
  		  async: false,
  		  error: function(request) {
  		      alert("发送请求失败！");
  		  },
  		  success: function(result) {//result参数{msg:"",success:boolean,data:{}}
  			  //判断后台执行操作是否成功，如果成功：提示操作成功，并刷新页面。否则提示操作失败，不刷新页面
  			  if(result.success){
  				  //关闭当前弹出编辑框
  				  $.tbox.close();
  				  //提示操作状态
  				  dm.alert("调整成功",{
  			        title:"调整成功",				//弹窗的标提
  			        okName:"确定",			//如同alert确定按钮的value
  			        picClass:"d_succeed",		//这里有三个值 "d_succeed" 显示成功图标,"d_error" 显示错误图标,"d_perfect" 显示信息提示图标,
  			        notHaveClose:"xxx",     //不定义此属性则有“x”关闭按钮
  			        callback:function(){	//按确定后执行的函数
  			        	 window.location.href='<%=basePath %>business/platFormWarehouse/diffAdjust.do';
  			     
  			        }
  		           });
  				  
  			  }else{
  				  dm.alert(result.msg);
  				  //关闭当前弹出编辑框
  				  $.tbox.close();
  			  }
  		  }
  		});
	  
	
  }
  </script>
  </head>
  <body>

<div class="popup_bg"></div>
<div class="dialog">
  <div class="clearfix"> 
      <div class="title"><a href="javascript:;" onClick="$.tbox.close()" class="out"></a>确认称差</div>
      <div class='cotent'>
	      <table width='100%' border='0' cellspacing='0' cellpadding='0'class='table' style="text-align: center;">
		       
		  <tr>
            <td valign="top" width="30%" align="right">店铺名称：</td>
            <td>深圳金六福
           <!--  <p class="gray9">输入6个字符，只支持字母、数字</p> -->
            </td>
          </tr> 
          <tr>
            <td valign="top" align="right">调整克重：</td>
            <td>12克</td>
          </tr>
	       </table>
	       <div class="red" style="text-align: center;font-size: 16px;">是否确定调整称差</div>
	</div>
      <div class="btn"><a href="javascript:suaud();" class="btn_cs">确定</a><a href="#" class="btn_hs ml20" onClick="$.tbox.close()" >取消</a></div> 
    </div>
</div>


  </body>
</html>
