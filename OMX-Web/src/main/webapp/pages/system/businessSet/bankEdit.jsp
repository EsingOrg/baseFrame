<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ include file="/WEB-INF/include/common/popDivHeader.jsp" %>
<html>
  <head>
    <title>银行卡编辑</title>
  </head>
  <script type="text/javascript">
  dmCheck.init("#publicForm");
  </script>
  <body>
	<div class="r_main clearfix">
	 <div id="popCon" class="dialog" style="width:600px;margin: -260px 0 0 -400px">
		  <div class="clearfix"> 
		  <div class="title"><a id="closeBtn" href="javascript:;" onClick="$.tbox.close()" class="out"></a>${bank.singleResult.id == null ? '添加': '修改'}银行卡</div>
	<div class="me_con">
	<form id="publicForm" >
		<input type="hidden" name="token" value="${token}">
		<input name="id" value="${bank.singleResult.id}" type="hidden">
            <div class="part" id="con_one_1">
            <ul class="infor clearfix" style="margin-top: 30px;">
                <li>
                    <div class="til"><span style="color:red;">*&nbsp;</span>银行名称：</div>
                    <div class="info"><input type="text" name="name" value="${bank.singleResult.name}" class="yhgl_input w300" validate="q" maxlength="30"/></div>                   
                </li>
                <li>
                    <div class="til"><span style="color:red;">*&nbsp;</span>银行代码：</div>
                    <div class="info"><input type="text" name="code" value="${bank.singleResult.code}" class="yhgl_input w300" maxlength="20" validate="q"/></div>
                </li>  
                <li>
                    <div class="til"><span style="color:red;">*&nbsp;</span>排序值：</div>
                    <div class="info"><input type="text" name="sort" value="${bank.singleResult.sort}" class="yhgl_input w300" maxlength="20" validate="q|z"/></div>
                </li>
            </ul>
            <div class="btn w600">
            <input name="button" type="button" class="btn_cs ml10" value="提交" onclick="confirmSub()"/>
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
  //校验参数
  dmCheck.init("#publicForm");
  //提交事件
  function confirmSub(){
	  
	  if(!dmCheck.check("#publicForm")){
			return false;
		}
	  var isAdd = ${isAdd};
	  var url;
	  if(!isAdd){
		  //修改
		  url = "updateBank.do";
	  }else{
		  //新增
		  url ="addBank.do";
	  }
	  DMGold.ajax({"formId":"publicForm","serialize":true,"url":url,
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
