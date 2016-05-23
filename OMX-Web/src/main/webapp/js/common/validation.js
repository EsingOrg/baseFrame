var flgs = true;
var phoneFlg = true;
$(function(){
		$submit =  $(".sumbitForme");
		$intext =$('input[type="text"]');
		$textarea =$('textarea');
		$select =$('select');
		
		$submit.click(function(){
			flgs = true;
			var cname = $(this).attr("fromname");
			$form_intext =$('.'+cname+' input[type="text"]');
			$form_textarea =$('.'+cname+' textarea');
			$form_select =$('.'+cname+' select');
			
			$form_intext.each(function(){
				return checkText($(this));
			});
			
			$form_textarea.each(function(){
				return checkTextarera($(this));
			});
			
			$form_select.each(function(){
				return checkSelect($(this));
			});
			
			
			if($(this).attr("savefromname") != undefined){
				//提交判定
				var $save = $('.'+cname+' input[name="save"]');
				if($save.size()>0){
					$save.val(1);
				}
			}
			
			if(!flgs || !phoneFlg){
				return false;
			}
		 });
		$intext.focus(function(){
			$(this).blur(function(){
				return checkText($(this));
			 });
		});
		
		$select.focus(function(){
			$(this).blur(function(){
				return checkSelect($(this));
			 });
		});
		
		$textarea.focus(function(){
			$(this).blur(function(){
				checkTextarera($(this));
			 });
		});
		
		
});

function checkPhoneExists(url,phone,id){
	$.ajax({
		type:"post",
		dataType:"html",
		async:false,
		url:url,
		data:{phone: $("#" + phone).val(),id: id},
		success:function(data){
			if ($.trim(data) == 'true') {
				$error = $("#errortip").html("手机号码已存在！");
				phoneFlg = false;
			}else{
				$error = $("#errortip").html("");
				phoneFlg = true;
			}
		}
	});
}

//校验输入文本框
function checkText($eve){
	
	if($eve.is(":hidden")){
		return;
	} 
	
	flg = true;
	if($eve== undefined){
		return false;
	}
	if($eve.attr("class")== undefined){
		return false;
	}
	msg = $eve.attr("class").split(" ");
	var mtest = $eve.attr("mtest");
	value = $eve.val();
	$error = $eve.nextAll("p[errortip]");
	$tip = $eve.nextAll("p[tip]");

	for(var i=0;i<msg.length;i++){
		var temp = $.trim(msg[i]);
		if(temp.length>0){
			if(temp == "required"){
				if($.trim(value) == ""){
					$error.addClass("error_tip");
					$error.html("不能为空！");
					$tip.hide();
					$error.show();
					flg = false;
					flgs = false;
					return false;
				}
			}
			
			if(temp == "isint"){
				var myreg = /^[0-9]([0-9])*$/;
				if($.trim(value) == ""){
					return false;
				}
				if(!myreg.test(value))
				{
					$error.addClass("error_tip");
					$error.html("必须为整数！");
					$tip.hide();
					$error.show();
					flg = false;
					flgs = false;
					return false;
				}
			}
			
			if(temp.indexOf('is-number')!=-1){
				tsizearry = temp.split("-");
				if(tsizearry.length>=3){
					tsize = tsizearry[2];
					var myreg = /^[0-9]([0-9])*$/;
					if($.trim(value) == ""){
						return false;
					}
					if(!myreg.test(value))
					{
						$error.addClass("error_tip");
						$error.html("请输入"+tsize+"位数字！");
						$tip.hide();
						$error.show();
						flg = false;
						flgs = false;
						return false;
					}
				}
			}
			
			if(temp.indexOf('max-nesize')!=-1){
				tsizearry = temp.split("-");
				if(tsizearry.length>=3){
					tsize = tsizearry[2];
					if(parseInt(value) >= parseInt(tsize)){
						$error.addClass("error_tip");
						$error.html("不能超出或等于最大值" + tsize + "");
						flg = false;
						flgs = false;
						$tip.hide();
						$error.show();
						return false;
						
					}
				}
			}
			
			if(temp.indexOf('minf-size')!=-1){
				tsizearry = temp.split("-");
				if(tsizearry.length>=3){
					tsize = tsizearry[2];
					if(parseFloat(value) < parseFloat(tsize)){
						$error.addClass("error_tip");
						$error.html("小于最小范围值");
						flg = false;
						flgs = false;
						$tip.hide();
						$error.show();
						return false;
						
					}
				}
			}
			if(temp.indexOf('maxf-size')!=-1){
				tsizearry = temp.split("-");
				if(tsizearry.length>=3){
					tsize = tsizearry[2];
					if(parseFloat(value) > parseFloat(tsize)){
						$error.addClass("error_tip");
						$error.html("超出最大范围值");
						flg = false;
						flgs = false;
						$tip.hide();
						$error.show();
						return false;
						
					}
				}
			}
			if(temp.indexOf('mulriple')!=-1){
				tsizearry = temp.split("-");
				if(tsizearry.length>=2){
					tsize = tsizearry[1];
					if(parseInt(value) % parseInt(tsize) != 0){
						$error.addClass("error_tip");
						$error.html("必须是"+tsize+"的倍数");
						flg = false;
						flgs = false;
						$tip.hide();
						$error.show();
						return false;
						
					}
				}
			}
			if(temp.indexOf('min-length')!=-1){
				tsizearry = temp.split("-");
				if(tsizearry.length>=3){
					tsize = tsizearry[2];
					if(value.length < parseInt(tsize)){
						$error.addClass("error_tip");
						$error.html("小于输入限制"+tsize+"，当前长度为"+value.length);
						flg = false;
						flgs = false;
						$tip.hide();
						$error.show();
						return false;
						
					}
				}
			}
			if(temp.indexOf('max-length')!=-1){
				tsizearry = temp.split("-");
				if(tsizearry.length>=3){
					tsize = tsizearry[2];
					if(value.length>tsize){
						$error.addClass("error_tip");
						$error.html("超过输入限制"+tsize+"，当前长度为"+value.length);
						flg = false;
						flgs = false;
						$tip.hide();
						$error.show();
						return false;
						
					}
				}
			}
			
			if(temp.indexOf('max-age')!=-1){
				tsizearry = temp.split("-");
				if(tsizearry.length>=3){
					age = tsizearry[2];
					if(parseInt(value)> parseInt(age)){
						$error.addClass("error_tip");
						$error.html("年龄不能大于"+age+"岁");
						flg = false;
						flgs = false;
						$tip.hide();
						$error.show(); 
						return false;
						
					}
				}
			}
			
			if(temp.indexOf('max-precision')!=-1){
				tsizearry = temp.split("-");
				if(tsizearry.length>=3){
					tsize = tsizearry[2];
					var _d = value + '';
					var precision = (_d.substring(_d.indexOf('.') + 1)).length;
					if(precision > tsize){
						$error.addClass("error_tip");
						$error.html("超出数字精度" + tsize + "，当前精度为" + precision);
						flg = false;
						flgs = false;
						$tip.hide();
						$error.show();
						return false;
						
					}
				}
			}
			
			
		}
	}
	if(mtest != undefined){
		if(mtest.length>0){
			var myreg = eval(mtest);  
		   if(value !="")
		   {
			if(!myreg.test(value))
			{
				$error.addClass("error_tip");
				$error.html($eve.attr("mtestmsg"));
				$tip.hide();
				$error.show();
				flg = false;
				flgs = false;
				return false;
			}
		  }
		}
	}
	
	if(!flg){
		$tip.hide();
		$error.show();
		return false;
	}else{
		$error.removeClass("error_tip");
		$error.hide();
		$tip.show();
	}
}

//校验select框
function checkSelect($eve){
	if($eve.is(":hidden")){
		return;
	} 
	flg = true;
	if($eve== undefined){
		return false;
	}
	if($eve.attr("class")== undefined){
		return false;
	}
	msg = $eve.attr("class").split(" ");
	value = $eve.val();
	$error = $eve.nextAll("p[errortip]");
	$tip = $eve.nextAll("p[tip]");

	for(var i=0;i<msg.length;i++){
		var temp = $.trim(msg[i]);
		if(temp.length>0){
			if(temp == "required"){
				if($.trim(value) == ""){
					$error.addClass("error_tip");
					$error.html("请选择！");
					$tip.hide();
					$error.show();
					flg = false;
					flgs = false;
					return false;
				}
			}
		}
	}
	if(!flg){
		$tip.hide();
		$error.show();
		return false;
	}else{
		$error.removeClass("error_tip");
		$error.hide();
		$tip.show();
	}
}


//校验文本域
function checkTextarera($eve){
	if($eve.is(":hidden")){
		return;
	} 
	flg = true;
	if($eve== undefined){
		return false;
	}
	if($eve.attr("class")== undefined){
		return false;
	}
	msg = $eve.attr("class").split(" ");
	value = $eve.val();
	$error = $eve.nextAll("p[errortip]");
	$tip = $eve.nextAll("p[tip]");
	flg = true;
	for(var i=0;i<msg.length;i++){
		var temp = $.trim(msg[i]);
		if(temp.length>0){
			if(temp == "required"){
				if($.trim(value) == ""){
					$error.addClass("error_tip");
					$error.html("不能为空！");
					$tip.hide();
					$error.show();
					flg = false;
					flgs = false;
					return false;
				}
			}
			if(temp == "forbidden-s"){
				if(value != null && $.trim(value) != ""){
					var myreg = /<script[^>]*>[\s\S]*<\/script>/;
					if(value.search(myreg) != -1)
					{
						$error.addClass("error_tip");
						$error.html("内容含非法脚本！");
						$tip.hide();
						$error.show();
						flg = false;
						flgs = false;
						return false;
					}
				}
			}
			if(temp.indexOf('max-length')!=-1){
				tsizearry = temp.split("-");
				if(tsizearry.length>=3){
					tsize = tsizearry[2];
					if(value.length>tsize){
						$error.addClass("error_tip");
						$error.html("超过输入限制"+tsize+"，当前长度为"+value.length);
						flg = false;
						flgs = false;
						$tip.hide();
						$error.show();
						return false;
					}
				}
			}
			if(temp.indexOf('min-length')!=-1){
				tsizearry = temp.split("-");
				if(tsizearry.length>=3){
					tsize = tsizearry[2];
					if(value.length < parseInt(tsize)){
						$error.addClass("error_tip");
						$error.html("小于输入限制"+tsize+"，当前长度为"+value.length);
						flg = false;
						flgs = false;
						$tip.hide();
						$error.show();
						return false;
						
					}
				}
			}
		}
	}
	if(!flg){
		$tip.hide();
		$error.show();
		return false;
	}else{
		$error.removeClass("error_tip");
		$error.hide();
		$tip.show();
	}
}


// 验证护照是否正确
function isHzNot(num,$error){
    var str=num;
   // var Expression=/(P\d{7})|(G\d{8})/;
    var Expression=/^(([A-Z]{1}\d{7,8})|((14|15)[0-9]{7}))$/;

    var objExp=new RegExp(Expression);
    if(objExp.test(str)){
    return true;
    }else{
	   $error.addClass("error_tip");
	   $error.html('输入的护照长度不对，或者号码不符合规定！');
	   return false;     
    } 
 }

//检查金额
function checkAmount($amount,minAmount,maxAmount){
	var amount = $amount.val();
	if(!amount){
		addTip($amount, "金额为空");
		return false;
	}
	amount = amount.trim();
	var amountTest = /^(([1-9]\d*)|\d)(\.\d{1,2})?$/;
	if(!amountTest.test(amount))
	{
		addTip($amount, "金额格式不正确");
		return false;
	}
	if(parseInt(amount)<=0){
		addTip($amount, "充值金额必须大于0");
		return false;
	}
	if(minAmount || maxAmount){
		try
		{
			if(parseInt(amount) < parseInt(minAmount)){
				addTip($amount, "充值金额最低"+minAmount+"起，请重新输入");
				return false;
			}
			if(parseInt(amount) > parseInt(maxAmount)){
				addTip($amount, "充值金额最大"+maxAmount+"，请重新输入");
				return false;
			}
		}
		catch (e)
		{
			addTip($amount, "请输入整数金额");
			return false;
		} 
	}
	return true;
}
