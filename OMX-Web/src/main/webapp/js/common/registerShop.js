function uploadCheckFile(){
	var _self=this;
	//选择图片弹出框
	$("#showuUnload").show();
	//给上传按钮绑定点击事件
    $("#uploadBtn").bind("click",function(){
    	  var pic =$("#uploadFile").val();
    	  if(pic == ""||pic==undefined){
    		  $("#picMsg").text("请选择要上传的图片!");
    		  return false;
    	  }
    	  var reg = /.+\.(jpg|png|jpeg)$/i;
    	  if(!reg.test(pic)){
    		  $("#picMsg").text("图片格式不正确!");
    		  return false;
    	  }
    	_self.uploadCertImg();
    });
}
//取消
function cancel() {
	$("#showuUnload").hide(); //隐藏上传图片弹出框
	$("#uploadFile").val("");  //清空图片名称
	$("#picMsg").text(""); //清空提示信息
}

//上传图片
function uploadCertImg() {
		$("#loading").ajaxStart(function() {
			$(this).show();
		}).ajaxComplete(function() {
			$(this).hide();
		});
		$.ajaxFileUpload({
			url : basePath + "upload/uploadPic.do",
			secureuri : false,
			fileElementId : "uploadFile",
			dataType : "json",
			success : function(data) {
				$("#showuUnload").hide();
				if(data.status == "ok"){
						var url=basePath+"upload/readWritePic.do?name="+data.newFileName;
						$("#"+butIdImg).css('background','none');
						$("#butIdImg").attr("src",url);
						$("#saveUrlPic").val(data.batchNumber);
				}else{
					dm.confirm("你当前的会话已失效，请重新登录。",{
						picClass:"error",
						showCancel:false,
						callBack:function(){
							window.location.href = basePath + "user/logout.do";
						}
					 });
				}
			},
			error : function(data) {
				$("#showuUnload").hide();
				$("#picMsg").text(""); //清空提示信息
				dm.confirm("你当前的会话已失效，请重新登录。",{
						picClass:"error"
				});
			}
		});
}

