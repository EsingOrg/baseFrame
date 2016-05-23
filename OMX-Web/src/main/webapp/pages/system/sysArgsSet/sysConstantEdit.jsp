<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ include file="/WEB-INF/include/common/popDivHeader.jsp" %>
<html>
  <head>
    <title>修改系统常量设置</title>
  </head>
  <script type="text/javascript">
  dmCheck.init("#publicForm");
  </script>
  <body>
	<div class="r_main clearfix">
	<div id="popCon" class="dialog" style="width:600px;margin: -260px 0 0 -400px">
		  <div class="clearfix"> 
		  <div class="title"><a id="closeBtn" href="javascript:;" onClick="$.tbox.close()" class="out"></a>编辑</div>
	<div class="me_con">
	<form id="publicForm" action="sysConstantListSave.do" method="post">
		<input type="hidden" name="token" value="${token}">
            <div class="part" id="con_one_1">
            <ul class="infor clearfix" >
                <li>
                <input type="hidden" name="key" value="${data.singleResult.key}">
                    <div class="til"><span style="color:red;">*&nbsp;</span>类型：</div>
                    <div class="info">${data.singleResult.type}</div>                   
                </li>
                <li>
                    <div class="til"><span style="color:red;">*&nbsp;</span>名称：</div>
                    <div class="info">${data.singleResult.desc}</div>
                </li> 
                <li>
                    <div class="til"><span style="color:red;">*&nbsp;</span>key：</div>
                    <div class="info">${data.singleResult.key}</div>
                </li>  
                <li>
                    <div class="til"><span style="color:red;">*&nbsp;</span>常量值：</div>
                    <div class="info">
                    <c:if test="${data.singleResult.key=='TEXT_GOLD_ASSET_MANAGE'}">
                    <textarea name="value" validate="q"  cols="60" rows="10" maxlength="900" class="border">${data.singleResult.value}</textarea>
                    </c:if>
                    <c:if test="${data.singleResult.key!='TEXT_GOLD_ASSET_MANAGE'}">
                    <textarea name="value" validate="q"  cols="60" rows="5" maxlength="900" class="border">${data.singleResult.value}</textarea>
                    </c:if>
                    </div>
                </li> 
            </ul>
            <div class="btn w600">
            <input name="input" type="button" class="btn_cs ml10" value="提交" onclick="save()"/>
            <input type="button" class="btn_cs ml10" value="取消" onclick="$.tbox.close();"/>
            </div>
            </div>
            </form>
	</div>
	</div>
	</div>
	</div>
  </body>
  <script type="text/javascript">
  function save(){
	  if(!dmCheck.check("#publicForm")){
			return false;
		}
	//提交数据
	  DMGold.ajax({"formId":"publicForm","serialize":true,"url":"sysConstantListSave.do",
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
