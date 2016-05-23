function goBalanceAccount(orderId,type){
	
	if(!type){
		dm.alert("参数错误");
		return;
	}
	$.ajax({
		type:"post",
		async: false,
		dataType:"json",
		url:basePath+"fin/goBalanceAccount.do?type="+type,//在url添加type,是为了解决相同url权限问题
		data:{"orderId":orderId},
		success:function(data){
			if(data && data.result){
				if(data.result.code=="0001"){
					dm.alert(data.result.msg,{
						title:"提示",				
						okName:"确定",			
						picClass:"d_perfect",		
						notHaveClose:"notHaveClose", 	
						callback:function(){	
							window.location.href=basePath+baseUrl;
							return;
						}
					});
					return;
				}
				dm.alert(data.result.msg);
			}
			
		},
		error:function(data){
			dm.alert("系统繁忙，请稍后重试");
		}
	});
}