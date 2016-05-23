<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ include file="/WEB-INF/include/common/popDivHeader.jsp" %>
<html>
  <head>
    <title>按时间删除</title>
   <script type="text/javascript">
   dmCheck.init("#auditing");
  function suaud(){
	  if((obj = dmCheck.returnObj("#auditing")))	return obj.focus();
	  $.tbox.close();
	  dm.confirm("您确定要删除吗?",{
			title:"批量删除",				//标题
			okName:"确定",			//如同confirm确定按钮的value
			cancleName:"取消",		//如同confirm取消按钮的value
			callback:function(){	//按确定的执行的函数
				$.ajax({ 
					type: "POST", 
					url: "delRealTimeKingPriceByTime.do", 
					data: $("#auditing").serialize(),  
					success: function(result) { 
						if(result.flag.code == "000000"){
		            		dm.alert("操作成功！",{
		            			title:"提示",				//弹窗的标提
		            			okName:"确定",			//如同alert确定按钮的value
		            			picClass:"d_succeed",	//这里有三个值 "d_succeed" 显示成功图标,"d_error" 显示错误图标,"d_perfect" 显示信息提示图标,
		            			notHaveClose:"xxx",
		            			callback:function(){	//按确定后执行的函数
		            				window.location.href="getRealTimeKingPriceList.do";
		            			}
		            		});
		              	}else{
		              		dm.alert("操作失败！");
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
      <div class="title"><a href="javascript:;" onClick="$.tbox.close()" class="out"></a>按时间段删除</div>
      <div class="cotent clearfix">
      <form action="<%=basePath %>treasury/delRealTimeKingPriceByTime.do" method="post" id="auditing">
         <div class="conn">
             <p class="tl f16 mt10" style="text-align:center">
             			时间： <input type="text" name="startTime" style="width: 145px;"
								 class="yhgl_input date" class="Wdate" validate="q" id="startDate"
								onclick="WdatePicker({maxDate:'#F{$dp.$D(\'endDate\')}'})" />
							<span class="mr5">至</span> <input type="text" name="endTime" validate="q" style="  width: 145px;"
								class="yhgl_input date"	class="Wdate" id="endDate"
								onclick="WdatePicker({minDate:'#F{$dp.$D(\'startDate\')}'})" /></p>
         </div> 
         <div class="btn"><a href="javascript:suaud();" class="btn_cs" >确定</a><a href="#" class="btn_hs ml20" onClick="$.tbox.close()">取消</a></div>
       </form>
      </div>     
    </div>
</div>
  </body>
</html>

