<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ include file="/WEB-INF/include/common/popDivHeader.jsp" %>
<html>
  <head>
    <title>新增手机提醒</title>
  </head>
  <body>
	<div class="r_main clearfix">
	<div id="popCon" class="dialog" style="width:600px;margin: -260px 0 0 -400px">
		  <div class="clearfix"> 
		  <div class="title"><a id="closeBtn" href="javascript:;" onClick="$.tbox.close()" class="out"></a>新增</div>
	<div class="me_con">
	<form id="publicForm" >
	<input type="hidden" name="token" value="${token}">
            <div class="part" id="con_one_1">
            <ul class="infor clearfix" >
                <li>
                    <div class="til"><span style="color:red;">*&nbsp;</span>姓名：</div>
                    <div class="info"><input type="text" name="name" class="yhgl_input w300" validate="q" maxlength="30"/></div>                   
                </li>
                <li>
                    <div class="til"><span style="color:red;">*&nbsp;</span>手机号：</div>
                    <div class="info"><input type="text" name="phone" class="yhgl_input w300" maxlength="20" validate="q|m"/></div>
                </li>
                <li>
                    <div class="til"><span style="color:red;">*&nbsp;</span>提醒类型：</div>
                    <div class="info"><input type="radio" checked="checked" id="ck" name="type" value="BUY">&nbsp买金&nbsp<input id="ck" type="radio" name="type" value="SALE">&nbsp卖金&nbsp </div>
                </li>   
                <li>
                    <div class="til"><span style="color:red;">*&nbsp;</span>备注：</div>
                    <div class="info"><textarea name="remark" class="input w300" style="resize:none;height:100px;" validate="q|leng" leng="1,200"></textarea></div>
                </li>
                   
            </ul>
            <div class="btn w600">
            <input name="input" type="button" class="btn_cs ml10" value="确定" onclick="addUser()"/>
            <input type="button" class="btn_cs ml10" value="取消" onclick="$.tbox.close(); "/>
            </div>
            </div>
            </form>
	</div>
	</div>
	</div>
	</div>
  </body>
  <script type="text/javascript">
  //参数校验
  dmCheck.init("#publicForm");
  function addUser(){
	  if(!dmCheck.check("#publicForm")){
			return false;
		}
	  DMGold.ajax({"formId":"publicForm","serialize":true,"url":"mobileRemindAddAjax.do",
	  		"success":function(data){
					//显示提示信息
					if("000000"==data.code){
						dm.alert(data.description,{"picClass":"d_succeed"});
					}else{
						dm.alert(data.description,{"picClass":"d_error"});
					}
					//操作完成后刷新用户列表
					search();
					//关闭弹出框
					$.tbox.close();
	  	}});

  }
  
  
  
  </script>
</html>
