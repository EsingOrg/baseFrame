<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ include file="/WEB-INF/include/common/popDivHeader.jsp" %>
<html>
  <head>
    <title>新增卖金处理</title>
  </head>
  <body>
	<div class="r_main clearfix">
	<div id="popCon" class="dialog" style="width:600px;margin: -260px 0 0 -400px">
		  <div class="clearfix"> 
		  <div class="title"><a id="closeBtn" href="javascript:;" onClick="$.tbox.close()" class="out"></a>新增卖金处理</div>
	<div class="me_con">
	<form id="publicForm" action="saleGoldDealSave.do" method="post" style="margin-top: 30px;">
            <div class="part" id="con_one_1">
            <ul class="infor clearfix" >
                <li>
                    <div class="til" >待处理克重：</div>
                    <div class="info">${stat.lastWaitWeight.total} 克</div>                   
                </li>
                
                <li>
                    <input type="hidden" name="waitingWeight" value="${stat.lastWaitWeight.total}"/>
                    <input type="hidden" name="type" value="SALE"/>
                    <div class="til"><span style="color:red;">*&nbsp;</span>本次处理克重：</div>
                    <div class="info"><input type="text" name="handleWeight" class="yhgl_input w300" maxlength="10" validate="q|gram"/></div>克
                </li>  
            </ul>
            <div class="btn w600">
            <input name="input" type="button" class="btn_cs ml10" value="确认" onclick="save()"/>
            <input type="button" class="btn_cs ml10" value="取消" onclick="javascript:$.tbox.close();"/>
            </div>
            </div>
            </form>
	</div>
	</div>
	</div>
	</div>
  </body>
  <script type="text/javascript">
  dmCheck.init("#publicForm");
  function save(){
	  if(!dmCheck.check("#publicForm")){
			return false;
		}
	  
	  changeStatus($("input[name='handleWeight']").attr("value"),$("input[name='waitingWeight']").attr("value")-$("input[name='handleWeight']").attr("value"));
  }
  //提示是否处理
  function changeStatus(deal,undeal){
  		 dm.confirm("确定处理卖金:<label style=\"color: red;\"> "+deal+"</label> 克"+
  		 "<p>剩余未处理:<label style=\"color: red;\"> "+Number(undeal).toFixed(3)+"</label> 克</p>",{
  				title:"确认",				//标题
  				okName:"确定",			//如同confirm确定按钮的value
  				cancleName:"取消",		//如同confirm取消按钮的value
  				callback:function(){	//按确定的执行的函数
  					$("#publicForm").submit();
  				}
  			});
  }
  </script>
</html>
