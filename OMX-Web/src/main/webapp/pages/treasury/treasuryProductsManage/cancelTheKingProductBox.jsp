<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ include file="/WEB-INF/include/common/popDivHeader.jsp" %>
<html>
  <head>
    <title>作废黄金制品</title>
   <script type="text/javascript">
  function suaud(){
	  $.ajax({ 
          type : "POST", 
          url : "updateTheKingProduct.do", 
          data : $("#auditing").serialize(), 
          success : function(result) { 
        	  $.tbox.close()
          	if(result.flag.code == "000000"){
          		dm.alert("作废成功！",{
          			title:"提示",				//弹窗的标提
          			okName:"确定",			//如同alert确定按钮的value
          			picClass:"d_succeed",	//这里有三个值 "d_succeed" 显示成功图标,"d_error" 显示错误图标,"d_perfect" 显示信息提示图标,
          			notHaveClose:"xxx",
          			callback:function(){	//按确定后执行的函数
          				window.location.href="getTreasuryKingProductList.do";
          			}
          		});
            	}else{
            		dm.alert(result.flag.description);
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
      <div class="title"><a href="javascript:;" onClick="$.tbox.close()" class="out"></a>作废</div>
      <div class="cotent clearfix">
      <form action="<%=basePath %>treasury/updateTheKingProduct.do" method="post" id="auditing">
         <div class="conn">
         	<input type="hidden" value="${productNo }" name="productNo"/>
         	<input type="hidden" value="2" name="type"/>
             <p class="tl f16 mt10" style="text-align:center">您确认要作废吗？</p>
         </div> 
         <div class="btn"><a href="javascript:suaud();" class="btn_cs" >确定</a><a href="#" class="btn_hs ml20" onClick="$.tbox.close()">取消</a></div>
       </form>
      </div>     
    </div>
</div>
  </body>
</html>

