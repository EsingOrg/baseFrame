<%-- <%@page import="com.dimeng.entity.ext.common.KindEditorEntity"%> --%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@ include file="/WEB-INF/include/common/commHeader.jsp" %>
	<%@ include file="/WEB-INF/include/common/popDivHeader.jsp" %>
<!-- 用于黄金学堂、媒体报道的查看、修改、新增 -->
	<link rel="stylesheet" href="/console/js/kindeditor-4.1.10/themes/default/default.css" />
	<link rel="stylesheet" href="/console/js/kindeditor-4.1.10/plugins/code/prettify.css" />
	<script charset="utf-8" src="/console/js/kindeditor-4.1.10/kindeditor.js"></script>
	<script charset="utf-8" src="/console/js/kindeditor-4.1.10/lang/zh_CN.js"></script>
	<script charset="utf-8" src="/console/js/kindeditor-4.1.10/plugins/code/prettify.js"></script>
<title>editorNews</title>
</head>
<body>
    <div class="r_main clearfix">
    	<form id="mForm" action="../operation/handleNews.do" method="post" enctype="multipart/form-data" commandName="loanType2">
    	<!-- 隐藏开始 -->
	    	<c:if test="${type=='add'}">
	    		<input type="hidden" name="id" value='${id }' style="visibility: hidden;"/><!-- 用来确认操作对象 -->
	    	</c:if>
	    	<c:if test="${type=='modify'}">
	    		<input type="hidden" name="id" value='${pageList.data.id }' style="visibility: hidden;"/><!-- 用来确认操作对象 -->
	    	</c:if>
	    	<input type="hidden" name="operatoinType" value='${operationType}' style="visibility: hidden;"/><!-- 用来确认操作类型(黄金学堂、媒体报道) -->
	    <!-- 隐藏结束 -->
	    <!-- 编辑部分开始 -->
		    <div class="main_con">
		    	<div class="me_con">
		        	<div class="form_title">${title}</div>
		        	<div class="part" id="con_one_1">
		            	<ul class="infor clearfix" >
		                	<li>
		                    	<div class="til"><span class="red">*</span>标题：</div>
		                    	<div class="info"><input maxlength="20" validate="q" name="title" value="${pageList.data.title}"  type="text" name="formTitle" id="textfield"  class="yhgl_input w300" /></div>                   
		                	</li>
		                    <c:if test="${type=='check' && operationType =='mediaReport'}"><!-- 查看，只显示数据库中的图片 -->
			                    <li><!-- 判断(新增、修改、删除)--> 
			                    	<div class="til"><span class="red">*</span>封面图片：</div>
			                    	<div class="info">
			                    		<img src="/platform/ReadPic/pic/url?url=${pageList.data.picUrl}"  style="width:200px; height: 80px;">
			                    	</div>
			                    </li>
		                    </c:if>
		                    <c:if test="${type=='modify'&& operationType =='mediaReport'}"><!-- 修改，显示数据库中的图片，提供上传按钮-->
			                    <li><!-- 判断(新增、修改、删除) -->
			                    	<div class="til"><span class="red">*</span>封面图片：</div>
			                    	<div class="info">
			                    		<img src="/platform/ReadPic/pic/url?url=${pageList.data.picUrl}" style="width:200px; height: 80px;">
			                    	</div>
			                    </li>
			                    <li ><!-- 判断(新增、修改、删除) -->
			                    	<div class="til" style="margin-top: 20px;"><span class="red">*</span>新封面图片：</div>
			                    	<div id="modifyDiv" style="float: left;position: relative;">
	                     				<div style="float:left;" id="modifyDiv" ><img src="${data.front}"  validate="q"  id="showMPic" style="width:200px; height: 80px;" /></div>
	                   				</div>
			                    </li>
			                    <li >
				                    <div class="til"><span class="red">*</span>新封面图片：</div>
		                   			<div class="info">
	                    			<div id="ui-upload-holder" class=" fl mr10"> 
	                     			<div id="ui-upload-txt">上传</div> 
	                      			<input type="file" id="picture" name="picture"  onchange="javascript:DMGold.setImagePreview('picture','modifyDiv','showMPic');" class="ui-upload-input"/> 
	                    			</div>
	                    			<span class="setting_info_div">建议尺寸：200px*80*，支持jpg、png、格式</span>
	                    			</div>
			                    </li>
		                    </c:if>
		                    <c:if test="${type=='add' && operationType =='mediaReport'}"><!-- 新增，只提供上传按钮 -->
			                    <li ><!-- 判断(新增、修改、删除) -->
			                    	<div class="til"><span class="red">*</span>新封面图片：</div>
			                    	<div id="modifyDiv" style="float: left;position: relative;">
	                     				<div style="float:left;" id="modifyDiv" ><img src="${data.front}" id="showMPic" style="width:200px; height: 80px;" /></div>
	                   				</div>
			                    </li>
				            	<li >
				                    <div class="til"><span class="red">*</span>新封面图片：</div>
		                   			<div class="info">
	                    			<div id="ui-upload-holder" class=" fl mr10"> 
	                     			<div id="ui-upload-txt">上传</div> 
	                      			<input type="file" id="picture" name="picture" onchange="javascript:DMGold.setImagePreview('picture','modifyDiv','showMPic');" class="ui-upload-input"/> 
	                    			</div>
	                    			<span class="setting_info_div">建议尺寸：200px*80*，支持jpg、png、格式</span>
	                    			</div>
			                    </li>
		                    </c:if>
		                	<li style="margin-top: 10px;">
		                    	<div class="til"><span class="red">*</span>来源：</div>
		                    	<div class="info"><input name="source" maxlength="80" validate="q" value="${pageList.data.source}" type="text" name="source" id="source"  class="yhgl_input w300" /></div>                   
		                	</li>
		                	<!-- <li>
		                    	<div class="til"><span class="red">*</span>显示时间：</div>
		                    	<div class="info">
		                    	<input type="text" name="publishDate"   validate="q" value="${pageList.data.publishDate}" 
								class="yhgl_input date"
								class="Wdate" id="endTime"
								onclick="WdatePicker({readOnly:true})" />
		                    	</div>                   
		                	</li>  
		                	 -->
		                	<li>
		                    	<div class="til"><span class="red">*</span>浏览次数：</div>
		                    	<div class="info"><input name="viewCount" maxlength="6" validate="q|z"  value="${pageList.data.viewCount}" type="text"  id="viewCount"  class="yhgl_input w300" /></div>                   
		                	</li> 
		                	<li>
		                  		<div class="til"><span class="red">*</span>内容：</div>
		                  		<div class="info">
			               			<textarea name="content" id="content" validate="q"  cols="100" rows="16" >
			               				${pageList.data.content}</textarea> 
		                    	</div>
		               		</li>              
		            	</ul>
			            <div class="infor clearfix" style="margin-top: 20px;">
		                	<div class="til" ><span class="red">*</span>是否发布:</div>
				                <select name='publishFlag' class='yhgl_sel'  >
				                	<option value='Y' selected='selected' >是</option>
									<option value='N'>否</option>
								</select>
						</div>
					<c:if test="${type=='add'}">
		            <div class="btn">
		            	<input name="input" type="button" onclick="submitRegulation()" class="btn_cs ml20"  value="提交" />
		            	<c:if test="${operationType=='goldSchool'}">
		            		<a href="<%=basePath %>helpCenter/getGoldSchool.do"><input class="btn_cs ml20 "  type="button" value="取消"/></a>
		            	</c:if>
		            	<c:if test="${operationType=='mediaReport'}">
		            		<a href="<%=basePath %>aboutUs/getMediaReport.do"><input class="btn_cs ml20 "  type="button" value="取消"/></a>
		            	</c:if>
		            </div>
		            </c:if>
		            <c:if test="${type=='modify'}">
		            <div class="btn">
		            	<input name="input" type="button" onclick="submitRegulation()" class="btn_cs ml20"  value="提交" />
		            	<c:if test="${operationType=='goldSchool'}">
		            		<a href="<%=basePath %>helpCenter/getGoldSchool.do"><input class="btn_cs ml20 "  type="button" value="取消"/></a>
		            	</c:if>
		            	<c:if test="${operationType=='mediaReport'}">
		            		<a href="<%=basePath %>aboutUs/getMediaReport.do"><input class="btn_cs ml20 "  type="button" value="取消"/></a>
		            	</c:if>
		            </div>
		            </c:if>
		            <c:if test="${type=='check'}">
		            	<div class="btn">
		            	<c:if test="${operationType=='goldSchool'}">
		            		<a href="<%=basePath %>helpCenter/getGoldSchool.do"><input class="btn_cs ml20 "  type="button" value="返回"/></a>
		            	</c:if>
		            	<c:if test="${operationType=='mediaReport'}">
		            		<a href="<%=basePath %>aboutUs/getMediaReport.do"><input class="btn_cs ml20 "  type="button" value="返回"/></a>
		            	</c:if>
		            </div>
		            </c:if>
	            </div>
	             <!--上传图片弹出框-->
						<div id="showuUnload" style="display: none;">
						<div class='popup_bg' ></div>
							<div class='popup_con'>
							<div class='bd'>
								 <div class='prompt'>
								<div id='loading' style='display:none;'>上传中...</div>
										<div> 请选择文件：<input type='file' id='uploadFile' name="upFile" />
											<p class="prompt" id="picMsg"></p>
										</div>
										</div>
									<div class='button'  style="margin-left: 60px; border: 0px solid;">
										<a href='javascript:void(0)' class='btn01' id='uploadBtn'>上传</a>&nbsp;&nbsp;&nbsp;
										<a href='javascript:void(0)' class='btn01' id="cancel" onclick="cancel()">取消</a>
									</div>
								</div>
						 </div>
					</div>
	          </div>
	         </div>
	    <!-- 编辑部分结束 -->
	        
       </form>
</div>
  <c:if test="${errMsg ne null}">
  <script type="text/javascript">
  dm.alert(decodeURIComponent('${errMsg}'));
  </script>
  </c:if>
<script type="text/javascript">
var editor1;
	KindEditor.ready(function(K) {
		editor1 = K.create('textarea[name="content"]', {
			uploadJson : '/console/common/kindeditorPicUpload.do',
			allowFileManager : false,
			formatUploadUrl : false,
			afterBlur : function() {
				this.sync();
				$("#content").text(this.html());
			},
			afterFocus : function() {
				$("#errContent").html("&nbsp;");
			},
			afterChange : function() {
				//限制字数
				var limitNum = 10000;  //设定限制字数
				var pattern = '还可以输入' + limitNum + '字';
				//$('#contentInfo').html(pattern).show(); //输入显示
				if(this.count('text') > limitNum) {
			       pattern = ('最大允许输入1万字');
			       $('#contentInfo').html(pattern).show(); //输入显示
			       //超过字数限制自动截取
			       var strValue = this.text();
			       strValue = strValue.substring(0,limitNum);
			       this.text(strValue);      
				} else {
				   if(this.count('text') < limitNum) $('#contentInfo').hide();
			       //计算剩余字数
			       var result = limitNum - this.count('text'); 
			       pattern = '还可以输入' +  result + '字'; 
				}
			}
		});
		prettyPrint();
	});
	function viewArticle(){
			var url =$("#preurl").val(); //预览的路径 
			$("#mForm").attr("action", url).attr("target","_blank").submit();
		}
	function submitRegulation(){
		  if(!dmCheck.check("#mForm")){
				return false;
			};

		  if('${type}' == 'add' && '${operationType}'== 'mediaReport'){
		      if($("#picture").val()=="")
		    	{
		    		dm.alert('上传文件不能为空!',{"picClass":"d_error"});
		    		return false;
		    	}
		  };
		  if('${operationType}'== 'goldSchool'){
			  $('#mForm').attr('action',"../operation/handleGoldSchool.do");
		  }
		 dm.confirm("你确定提交这条消息吗？",{
				title:"确认",				//标题
				okName:"确定",			//如同confirm确定按钮的value
				cancleName:"取消",		//如同confirm取消按钮的value
				callback:function submitForm(){ 
						$("#mForm").submit();
				}	
			});
	};
	//删除消息
 	function delNews(userId){
    		 dm.confirm("确定删除吗？",{
    				title:"确认",				//标题
    				okName:"确定",			//如同confirm确定按钮的value
    				cancleName:"取消",		//如同confirm取消按钮的value
    				callback:function(){	//按确定的执行的函数
    					location.href = "changeBankStatus.do?id="+userId;
    				}
    			});
    };
</script>
            
  </body>
</html>
