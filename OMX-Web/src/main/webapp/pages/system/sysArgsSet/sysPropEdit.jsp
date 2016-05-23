<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ include file="/WEB-INF/include/common/popDivHeader.jsp" %>
<html>
  <head>
    <title>新增系统用户</title>
  </head>
  <script type="text/javascript">
  dmCheck.init("#publicForm");
  function addUser(){
	  if((obj = dmCheck.returnObj("#publicForm")))	return obj.focus();
	  $.ajax({ 
          type : "POST", 
          url : "editProp.do", 
          data : $("#publicForm").serialize(), 
          success : function(result) { 
        	  $.tbox.close();
          	if(result.statu.code == "000000"){
          		dm.alert("修改成功！",{
          			title:"提示",				//弹窗的标提
          			okName:"确定",			//如同alert确定按钮的value
          			picClass:"d_succeed",	//这里有三个值 "d_succeed" 显示成功图标,"d_error" 显示错误图标,"d_perfect" 显示信息提示图标,
          			callback:function(){	//按确定后执行的函数
          				window.location.href="sysPropList.do";
          			}
          		});
            	}else{
            		dm.alert("保存失败！");
            	}
          } 
      });
  }
  
  </script>
  <body>
	<div class="r_main clearfix">
	<div id="popCon" class="dialog" style="width:600px;margin: -260px 0 0 -400px">
		  <div class="clearfix"> 
		  <div class="title"><a id="closeBtn" href="javascript:;" onClick="$.tbox.close()" class="out"></a>编辑</div>
	<div class="me_con">
	<form id="publicForm" action="<%=basePath %>system/businessSet/addBankSave.do" method="post">
		<input type="hidden" name="key" value="${pageList.data.singleResult.key  }">
            <div class="part" id="con_one_1">
            <ul class="infor clearfix" >
                <li>
                    <div class="til"><span style="color:red;">*&nbsp;</span>类型：</div>
                    <div class="info">${pageList.data.singleResult.type }</div>                   
                </li>
                <li>
                    <div class="til"><span style="color:red;">*&nbsp;</span>属性key：</div>
                    <div class="info">${pageList.data.singleResult.key }</div>
                </li> 
                <li>
                    <div class="til"><span style="color:red;">*&nbsp;</span>属性value：</div>
                    <div class="info"><input type="text" name="value" value="${pageList.data.singleResult.value }" class="yhgl_input w300" maxlength="200" validate="q"/></div>
                </li>  
                <li>
                    <div class="til"><span style="color:red;">*&nbsp;</span>描述：</div>
                    <div class="info"><input type="text" name="desc" value="${pageList.data.singleResult.desc }"  class="yhgl_input w300" maxlength="200" validate="q"/></div>
                </li>
            </ul>
            <div class="btn w600">
            <input name="input" type="button" class="btn_cs ml10" value="提交" onclick="addUser()"/>
            <input type="button" class="btn_cs ml10" value="取消" onclick="$.tbox.close()"/>
            </div>
            </div>
            </form>
	</div>
	</div>
  </body>
</html>
