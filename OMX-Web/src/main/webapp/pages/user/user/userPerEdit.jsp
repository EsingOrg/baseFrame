<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
	<title>个人信息修改</title> <%@ include
		file="/WEB-INF/include/common/commHeader.jsp"%>
</head>
<body>
	<!---------------右边内容开始--------------->
	<div class="r_main clearfix">

		<!--内容 -->
		<div class="main_con">

			<!--用户名-->
			<div class="upper clearfix">
				<div class="per_li clearfix">
					<div class="per_img">
						<img src="<%=basePath%>images/user_portrait.jpg" />
					</div>
					<ul>
						<li>用户名：<span title="${name}">${name}</span></li>
						<li>可用余额：<fmt:formatNumber pattern="##,####,###,##0.00"
								value="${uaib.data.singleResult.availableAmount}" />元
						</li>
						<li>冻结金额：<fmt:formatNumber pattern="##,####,###,##0.00"
								value="${uaib.data.singleResult.frozenAmount}" />元
						</li>
						<li>充值总额：<fmt:formatNumber pattern="##,####,###,##0.00"
								value="${uaib.data.singleResult.rechargeAmount}" />元
						</li>
						<li>提现总额：${uaib.data.singleResult.withdraw}元</li>
						<li>黄金总资产：<fmt:formatNumber pattern="##,####,###,##0.000"
								value="${uaib.data.singleResult.totalWeight}" />克
						</li>
						<li>活金：<fmt:formatNumber pattern="##,####,###,##0.000"
								value="${uaib.data.singleResult.availableWeight}" />克
						</li>
						<li>冻结活金：<fmt:formatNumber pattern="##,####,###,##0.000"
								value="${uaib.data.singleResult.frozenWeight}" />克
						</li>
						<li>定期金：${uaib.data.singleResult.termWeight}克</li>
						<li>累计利息：<fmt:formatNumber pattern="##,####,###,##0.00"
								value="${uaib.data.singleResult.totalInterest}" />元
						</li>
						<li>累计买金克重：<fmt:formatNumber pattern="##,####,###,##0.000"
								value="${uaib.data.singleResult.buyWeight}" />克
						</li>
						<li>累计卖金克重：${uaib.data.singleResult.saleWeight}克</li>
						<li>累计存金克重：${uaib.data.singleResult.saveWeight}克</li>
						<li>累计提金克重：<fmt:formatNumber pattern="##,####,###,##0.000"
								value="${uaib.data.singleResult.takeWeight}" />克
						</li>
						<li>累计换金克重：<fmt:formatNumber pattern="##,####,###,##0.000"
								value="${uaib.data.singleResult.changeWeight}" />克
						</li>
					</ul>
				</div>
			</div>
			<!--用户名--END-->

			<!-- TAB头 -->
			<div class="menubox clearfix">
				<ul>
					<li id="one1"
						onclick="window.location.href='userPerShow.do?key=${key}&name=${name}';"
						class="${tabIndex == '1' ? 'hover' : ''}">个人信息</li>
					<li id="one2"
						onclick="window.location.href='userPerShowBuylog.do?key=${key}&name=${name}';"
						class="${tabIndex == '2' ? 'hover' : ''}">买金记录</li>
					<li id="one3"
						onclick="window.location.href='userPerShowSalelog.do?key=${key}&name=${name}';"
						class="${tabIndex == '3' ? 'hover' : ''}">卖金记录</li>
					<li id="one4"
						onclick="window.location.href='userPerShowKeeplog.do?key=${key}&name=${name}';"
						class="${tabIndex == '4' ? 'hover' : ''}">存金记录</li>
					<li id="one3"
						onclick="window.location.href='userPerShowDiplog.do?key=${key}&name=${name}';"
						class="${tabIndex == '5' ? 'hover' : ''}">提金记录</li>
					<li id="one4"
						onclick="window.location.href='userPerShowExclog.do?key=${key}&name=${name}';"
						class="${tabIndex == '6' ? 'hover' : ''}">换金记录</li>
				</ul>
				<div class="clearfix">
					<a href="javascript:void(0);"
						onclick="window.location.href='userPerShow.do?key=${key}&name=${name}';"
						class="btn_cs fr mr20">返回</a>
				</div>
			</div>
			<!-- TAB--END -->

			<!-- TAB1 -->
			<div class="menu_bd clearfix" id="con_one_1"
				style="display:${tabIndex == '1' ? '' : 'none'};">

				<form action="userPerEdit.do" method="post" id="editForm"
					enctype="multipart/form-data">
					<input type="hidden" name="userId" value="${key}" /> <input
						type="hidden" name="token" value="${token}" />
					<!--  重复提交Token-->
					<div class="pat_title clearfix">注册信息</div>
					<ul class="part_center clearfix">
						<li><div class="til">姓名：</div>
							<div class="info">${u.data.singleResult.userFullName}</div></li>
						<li><div class="til">性别：</div>
							<div class="info">${u.data.singleResult.gender}</div></li>
						<li><div class="til">身份证号：</div>
							<div class="info">${u.data.singleResult.idcard}</div></li>
						<li><div class="til">出生日期：</div>
							<div class="info">${u.data.singleResult.birthday}</div></li>
						<li><div class="til">
								<span style="color: red;">*&nbsp;</span>手机号码：
							</div>
							<div class="info">
								<input name="phone" id="userPhone" type="text"
									class="yhgl_input w200"
									value="${u.data.singleResult.userPhone}" validate="q|m" />
							</div></li>
						<li><div class="til">
								<span style="color: red;">*&nbsp;</span>邮箱地址：
							</div>
							<div class="info">
								<input name="email" id="userEmail" type="text"
									class="yhgl_input w200" value="${u.data.singleResult.email}"
									validate="q|email|leng" leng="4,60" />
							</div></li>
					</ul>
					<div class="btn mt30 mb30">
						<a href="javascript:void(0);" onclick="modifyPerUserSubmit();"
							class="btn_cs">保存</a><a href="javascript:void(0);"
							onclick="window.location.href='userPerShow.do?key=${key}&name=${name}';"
							class="btn_cs ml20">取消</a>
					</div>
				</form>
			</div>
			<!-- TAB1--END -->

		</div>
		<!--内容  --END-->

	</div>
	<!---------------右边内容结束--------------->

	<div id="attachDialog" style="display: none">
		<div class="dia_img">
			<a href="javascript:void(0);" class="out"
				onclick="$('#attachDialog').hide();"><i class="d_error"></i></a> <img
				src="" />
		</div>
	</div>

	<script type="text/javascript">
  //查看图片
  function attachDialog(src){
	$("#attachDialog img").attr('src', src);
	$("#attachDialog").show();
  }
  
  //修改用户信息
  function modifyPerUserSubmit(){
  	if((obj = dmCheck.returnObj("#editForm")))	return obj.focus();
  	//$("#editForm").submit();
	if(isExistPhone($("#userPhone").val())){
		return;
	}
	if(isExistEmail($("#userEmail").val())){
		return;
	}
	$.ajax( { 
         type : "POST", 
         url : "userPerEdit.do", 
         data : $("#editForm").serialize(), 
         success : function(result) { 
         	if(result.result.code == "000000"){
         		dm.alert("修改成功！",{
        			title:"提示",				//弹窗的标提
        			okName:"确定",			//如同alert确定按钮的value
        			picClass:"d_succeed",	//这里有三个值 "d_succeed" 显示成功图标,"d_error" 显示错误图标,"d_perfect" 显示信息提示图标,
        			notHaveClose:"xxx",
        			callback:function(){	//按确定后执行的函数
        				window.location.href='userPerShow.do?key=${key}&name=${name}';
        			}
        		});
         	}else{
         		dm.alert(result.result.description,{
        			title:"提示",				//弹窗的标提
        			okName:"确定",			//如同alert确定按钮的value
        			picClass:"d_error",	//这里有三个值 "d_succeed" 显示成功图标,"d_error" 显示错误图标,"d_perfect" 显示信息提示图标,
        			notHaveClose:"xxx",
        			callback:function(){	//按确定后执行的函数
        				window.location.href='userPerShow.do?isEdit=true&key=${key}&name=${name}';
        			}
        		});
         	}
         } 
     	});
  }
  dmCheck.initForAjax("#editForm");
  
//判断手机号是否存在
  function isExistPhone(phone){
	  var isExist=false;
	  if(phone != ''){
		  $.ajax({
			  async:false,
				type:"POST",
				url:"<%=basePath%>shop/isExistPhone.do",
				data:{"phone":phone,"userId":'${key}'},
				success:function(msg){
					if(msg.flag.code == '000000'){
						if(msg.flag.data == 'Y'){
							$("#userPhone").focus();
		            		$("#userPhone").before('<span class="pop-con"><div class="fl pop-pic"></div><div class="pop-info">手机号已存在</div></span>');
		            		isExist=true;
						}
					}else{
						dm.alert(msg.flag.description);
						isExist=true;
					}
				}
			});
	  }
	  return isExist;
  }
//判断邮箱是否存在
  function isExistEmail(email){
	  var isExist=false;
	  if(email != ''){
		  $.ajax({
			  async:false,
				type:"POST",
				url:"<%=basePath%>shop/isExistEmail.do",
							data : {
								"email" : email,
								"userId" : '${key}'
							},
							success : function(msg) {
								if (msg.flag.code == '000000') {
									if (msg.flag.data == 'Y') {
										$("#userEmail").focus();
										$("#userEmail")
												.before(
														'<span class="pop-con"><div class="fl pop-pic"></div><div class="pop-info">邮箱已存在</div></span>');
										isExist = true;
									}
								} else {
									dm.alert(msg.flag.description);
									isExist = true;
								}
							}
						});
			}
			return isExist;
		}
	</script>

</body>
</html>