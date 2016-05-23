<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ include file="/WEB-INF/include/common/popDivHeader.jsp" %>
<html>
  <head>
    <title>修改活金利率</title>
<script type="text/javascript">
dmCheck.init("#auditing");
  function suaud(){
	  if((obj = dmCheck.returnObj("#auditing")))	return;
	  $.tbox.close();
	  //异步发送求情，弹出显示是否操作成功
	  $.ajax({
		  cache: false,
		  type: "POST",
		  url:"<%=basePath %>treasury/updateLiveGoldRate.do",	//请求路径
		  data:$('#auditing').serialize(),	//要发送的是ajaxFrm表单中的数据
		  success: function(result) {
			  //判断后台执行操作是否成功，如果成功：提示操作成功，并刷新页面。否则提示操作失败，不刷新页面
			  if(result.flag.code=='000000'){
				  //提示操作状态
				  dm.alert("修改活金利率成功！",{
			        title:"提示信息",				//弹窗的标提
			        okName:"确定",			//如同alert确定按钮的value
			        picClass:"d_succeed",		//这里有三个值 "d_succeed" 显示成功图标,"d_error" 显示错误图标,"d_perfect" 显示信息提示图标,
			        notHaveClose:"xxx",     //不定义此属性则有“x”关闭按钮
			        callback:function(){	//按确定后执行的函数
			        	//刷新List
						 window.location.href='<%=basePath %>treasury/getTreasuryLiveGoldRateList.do';
			        }
		           });
				  
			  }else{
				  dm.alert("操作不成功");
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
      <div class="title"><a href="javascript:;" onClick="$.tbox.close()" class="out"></a>修改活金利率</div>
      <div class="cotent">
       <form action="<%=basePath %>treasury/updateLiveGoldRate.do" method="post" id="auditing">
       <input type="hidden" name="token" value="${token}"/><!--  重复提交Token-->
         <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table">
          <tr>
            <td valign="top" width="30%" align="right">活金利率：</td>
            <td><input name="yearRate" type="text" class="yhgl_input" validate="q|rate"/>%
            </td>
          </tr>     
        </table>
        </form>
      </div>
      <div class="btn"><a href="javascript:suaud();" class="btn_cs">确定</a><a href="#" class="btn_hs ml20" onClick="$.tbox.close()" >取消</a></div> 
    </div>
</div>


  </body>
   <script type="text/javascript">
    //弹出框
    function popDiv(url){
 	   $.tbox.popup(url);
    }
 	function openDivPwd(id,loginName){
 		loginNames = encodeURIComponent(encodeURIComponent(loginName));
 		popDiv('<%=basePath %>system/sysuser_modify_pwd.jsp?id='+id+'&ln='+loginNames+'&t=<%=Math.random() %>');
 	}
 </script>
</html>
