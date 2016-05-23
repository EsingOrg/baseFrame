<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ include file="/WEB-INF/include/common/popDivHeader.jsp" %>
<html>
  <head>
    <title>新增系统用户</title>
  </head>
  <body>
	<div class="r_main clearfix">
	<div id="popCon" class="dialog" style="width:650px;margin: -260px 0 0 -400px">
		  <div class="clearfix"> 
		  <div class="title"><a id="closeBtn" href="javascript:;" onClick="$.tbox.close()" class="out"></a>APP版本管理</div>
	<div class="me_con">
	<form id="publicForm" action="update.do" method="post" enctype="multipart/form-data">
            <div class="part" id="con_one_1">
            <input type="hidden" name="token" value="${token}">
            <ul class="infor clearfix" >
                <li>
                <input type="hidden" name="id" value="${result.singleResult.id }"/>
                    <div class="til"><span style="color:red;">*&nbsp;</span>客户端类型：</div>
                    <div class="info">
					  <dim:radio name="type" enumType="AppType" value="${result.singleResult.type}" defaultValue="AD"/>
                    </div>                   
                </li>
                <li>
                    <div class="til"><span style="color:red;">*&nbsp;</span>版本号：</div>
                    <div class="info"><input  type="text" name="no" value="${result.singleResult.no }" class="yhgl_input w300" maxlength="20" validate="q|z" /> <span class="setting_info_div">版本号格式为整数</span></div>
                </li>  
                <li>
                    <div class="til"><span style="color:red;">*&nbsp;</span>版本名称：</div>
                    <div class="info"><input  type="text" name="versionName" value="${result.singleResult.versionName }" class="yhgl_input w300" maxlength="20" validate="q|sion" /> <span class="setting_info_div">版本名称格式为1.1.1</span></div>
                </li>
                <li>
                    <div class="til"><span style="color:red;">*&nbsp;</span>网络路径：</div>
                    <div class="info"><input type="text" validate="q"  name="netUrl" value="${result.singleResult.netUrl }" class="yhgl_input w300" /> 
                    <span class="setting_info_div">为了保证取到最新的包，优先取网络路径</span></div>
                </li>
                <li>
                    <div class="til">安装包：</div>
                    <div class="info">
                    <div id="ui-upload-holder" class=" fl mr10"> 
                     <div id="ui-upload-txt">上传</div> 
                      <input type="file" id="files" name="files" class="ui-upload-input"/> 
                    </div>
                    <span class="setting_info_div">网络路径为空时，直接取服务器保存路径</span></div>
                    
                </li> 
                <li>
                    <div class="til">是否强制更新：</div>
                    <div class="info">
                       <dim:radio name="updateFlag" enumType="YesNoType" value="${result.singleResult.updateFlag}" defaultValue="Y"/>
                    </div>
                </li>  
                <li>
                    <div class="til"><span style="color:red;">*&nbsp;</span>升级描述：</div>
                    <div class="info"><textarea name="desc" validate="q"  cols="40" rows="5" class="border">${result.singleResult.desc}</textarea>
                    </div>
                </li>     
                <li>
                    <div class="til">是否启用：</div>
                    <div class="info">
                      <dim:radio name="userFlag" enumType="YesNoType" value="${result.singleResult.userFlag}" defaultValue="Y"/>
					</div>
                </li>  
            </ul>
            <div class="btn w600">
            <input name="input" type="button" class="btn_cs ml10 readOnly" value="返回" onclick="cancel()" style="display: none;margin-left: 300px;"/>
            <input type="button" value="提交" onclick="submitForm();" class="btn_cs notReadOnly" >
            <input type="button" class="btn_cs ml10 notReadOnly" value="取消" onclick="cancel();"/>
            </div>
            </div>
            </form>
            </div>
            </div>
	</div>
	</div>
  </body>
  <c:if test="${readOnly ne null}">
   <script type="text/javascript">
      //禁用编辑框
      $("input,textarea").attr("readonly","readonly");
	  //查看模式下显示返回按钮
	  $(".readOnly").css("display","block");
	  $(".notReadOnly").css("display","none");
	  $("input[name='files']").attr('disabled','disabled');
   </script>
  </c:if>
  <script type="text/javascript">
  dmCheck.init("#publicForm");
  //取消
  function cancel(){
	  
	  $.tbox.close();
  };
  function submitForm(){
  	if('${result.singleResult.id }' == ''){
  		if($("#files").val()=="")
  		{
  			dm.alert('上传文件不能为空!',{"picClass":"d_error"});
  			return false;
  		}
  	};
  	$("#publicForm").submit();
  	
  };
  </script>
</html>
