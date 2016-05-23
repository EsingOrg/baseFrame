<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1" >
  <title>店铺信息新增</title>
  <%@ include file="/WEB-INF/include/common/commHeader.jsp" %>
</head>
<body>
  <!---------------右边内容开始--------------->
  <div class="r_main clearfix">
         
    <!--内容 -->
    <div class="main_con"> 
    
	  <div class="menubox clearfix">
		<ul>
		  <li id="one1">店铺信息</li>		  		  
		</ul>
		<div class="clearfix"><a href="javascript:void(0);" onclick="window.location.href='shopPerList.do';" class="btn_cs fr mr20">返回</a></div>
	  </div>
	  <!-- TAB--END -->
	  
	  <!-- TAB1 -->
	  <div class="menu_bd clearfix" id="con_one_1">
	  
		<form action="<%=basePath %>shop/saveShop.do" method="post" id="addForm" enctype="multipart/form-data">
		<input type="hidden" name="shopUserId" value="${shop.shopUserId}"/>
		<input type="hidden" name="password" value="${shop.password}"/>
		<input type="hidden" name="flag" value="${shop.flag}"/>
		<input type="hidden" name="token" value="${token}"/><!--  重复提交Token-->
		<div class="pat_title clearfix">注册信息</div>
		<ul class="part_center clearfix">
		  <li><div class="til"><span class="red">*</span>店铺名称：</div><div class="info"><input type="text" name='name' onblur="isExistShopName(this.value)" id="shopName" validate="q|leng" leng="1,18" class="yhgl_input w200"  value="${tempdata.data.singleResult.name }"/></div></li>
		  <c:if test="${shop.flag == 'N'}">
		  	  <li><div class="til"><span class="red">*</span>营业执照登记注册号：</div><div class="info"><input type="text" name="licenceNo" id="textfield" validate="q|leng" leng="1,15" maxlength="15" reg="/^[a-zA-Z0-9]{1,15}$/" warning="格式不正确" class="yhgl_input w200" value="${tempdata.data.singleResult.licenceNo}"/></div></li>
			  <li><div class="til"><span class="red">*</span>店铺纳税号：</div><div class="info"><input type="text" name="taxNo" id="textfield" validate="q|leng" leng="1,20" maxlength="20" reg="/^[a-zA-Z0-9]{1,20}$/" warning="格式不正确" class="yhgl_input w200" value="${tempdata.data.singleResult.taxNo}"/></div></li>
			  <li><div class="til"><span class="red">*</span>组织机构代码：</div><div class="info"><input type="text" name="orgCode" id="textfield" validate="q|leng" leng="1,10" maxlength="10" reg="/^[a-zA-Z0-9\-]{1,10}$/" warning="格式不正确"  class="yhgl_input w200" value="${tempdata.data.singleResult.orgCode}"/></div></li>
		  </c:if>
		  <c:if test="${shop.flag == 'Y'}">
		  	  <li><div class="til"><span class="red">*</span>社会信用代码：</div><div class="info"><input type="text" name="creditCode" id="textfield" validate="q|leng" leng="1,18" maxlength="18" reg="/^[a-zA-Z0-9]{1,18}$/" warning="格式不正确" class="yhgl_input w200" value="${tempdata.data.singleResult.creditCode}"/></div></li>
		  </c:if>
		  <li><div class="til"><span class="red">*</span>法人：</div><div class="info"><input type="text" name="corporation" id="textfield" validate="q|zh|leng" leng="2,20" class="yhgl_input w200" value="${tempdata.data.singleResult.corporation}"/></div></li>
		  <li><div class="til"><span class="red">*</span>法人身份证：</div><div class="info"><input type="text" name="corporateIdcard" id="shopIdCard" validate="q|idCard" class="yhgl_input w200" value="${tempdata.data.singleResult.corporateIdcard}"/></div></li>   
		  <li><div class="til"><span class="red">*</span>手机号：</div><div class="info"><input type="text" name="corporatePhone" validate="q|m" id="shopPhone" class="yhgl_input w200" value="${tempdata.data.singleResult.corporatePhone}"/></div></li>
		  <li><div class="til"><span class="red">*</span>邮箱：</div><div class="info"><input type="text" name="email" id="shopEmail" validate="q|email"  class="yhgl_input w200" value="${tempdata.data.singleResult.email}"/></div></li>              
		</ul>  
		<div class="pat_title clearfix">基本信息</div>
		<ul class="part_center clearfix">
		  
		  <li><div class="til"><span class="red">*</span>店铺地址：</div><div class="info"><input type="text" name="address" validate="q|leng" leng="2,100" id="textfield" class="yhgl_input w200" value="${tempdata.data.singleResult.address}"/></div></li>
		  <li><div class="til"><span class="red">*</span>营业时间：</div><div class="info"><input type="text" name="startTime" validate="q|leng" leng="0,5"  warning="格式不正确" id="textfield" class="yhgl_input w100" value="${tempdata.data.singleResult.startTime}"/>&nbsp;到&nbsp;<input type="text" name="endTime" id="textfield" validate="q|leng" leng="0,5" warning="格式不正确" class="yhgl_input w100" value="${tempdata.data.singleResult.endTime}"/></div></li>
		  <li><div class="til"><span class="red">*</span>座机：</div><div class="info"><input type="text" name="tel" id="textfield" validate="q|leng" leng="0,15" reg="/0\d{2,4}-\d{5,9}|0\d{2,4}-\d{5,9}/" warning="格式不正确" class="yhgl_input" value="${tempdata.data.singleResult.tel}"/></div></li>
		  <li><div class="til">加工费用说明：</div><div class="info"><textarea name="desc" cols="40" rows="5" validate="leng" leng="0,200" maxlength="200" class="border">${tempdata.data.singleResult.desc}</textarea></div></li>              
		  <li><div class="til"><span class="red">*</span>所在城市：</div><div class="info">
		  	<select name="provinces" id="provinces" class="yhgl_sel" validate="q" onchange="changeProvince(this.value)"></select>&nbsp;&nbsp;&nbsp;&nbsp;
		  	<select name="regionId"  id="city" class="yhgl_sel" validate="q"><option value="">全部</option></select></div>
		  </li>
		  <li><div class="til"><span class="red">*</span>公司名称：</div><div class="info"><input type="text" name="companyName" validate="q|leng" leng="2,100" class="yhgl_input w200" value="${tempdata.data.singleResult.companyName}"/></div></li>
		  <li><div class="til">备注：</div><div class="info"><textarea name="remark" cols="40" rows="5" validate="leng" leng="0,500" maxlength="200" class="border"></textarea></div></li>
		</ul>
		
		<div class="pat_title clearfix">联系人</div>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="main_table mb20">
			<thead>
       		<tr class="title">
                <td align="center">序号</td>
                <td align="center">店铺联系人</td>
                <td align="center">联系人电话</td>
                <td align="center">备注</td>
                <td align="center">操作</td>                         
             </tr>
             </thead>
             <tbody id="tbodyId">
             
             <c:forEach items="${cotman.data.list}" var="user" varStatus="st">
             	<tr>
                    <td align="center">${st.count}</td>
                    <td align="center">${user.name }</td>
                    <td align="center">${user.phone }</td>
                    <td align="center">${user.remark }</td>
                    <td align="center"><a href="javascript:void(0);" onclick="openUpdateLinkman(${user.id},${id},'${user.name }','${user.phone }','${user.remark }')" class="yellow">修改</a><a href="javascript:void(0);" onclick="delLinkMan(${user.id},${id})" class="yellow">删除</a></td>
               </tr>
             </c:forEach>
             </tbody>
           </table>
		  
		  <div class="pat_title clearfix">店铺附件</div>
          <ul class="part_annex clearfix">

          <li style="display: ${shop.flag == 'N' ? '' : 'none'}">
          		<div>营业执照</div><div class="mt10">
          			<img src="/platform/ReadPic/pic/url?url=${tempdata.data.imgListResult.licencePic[0]}"  id="showMPic1" onclick="attachDialog(this.src)"/>

	         	</div>
	         	<div class="btn mt20">
	         		<div id="ui-upload-holder" class=" fl mr10" style="margin: 10px 40px"> 
	         			<div id="ui-upload-txt">上传文件</div> 
	              		<input type="file" name="busPic" id="picture1" class="ui-upload-input"/>
	              		<input type="hidden" name="licencePicNumber" value="${tempdata.data.singleResult.licencePicNumber}"/>
               		</div>
	         	</div>
          </li>
          <li style="display: ${shop.flag == 'N' ? '' : 'none'}">
	         	<div>税务登记证</div><div class="mt10">
	         		<img src="/platform/ReadPic/pic/url?url=${tempdata.data.imgListResult.taxPic[0]}"  id="showMPic2" onclick="attachDialog(this.src)"/>

	         	</div>
	         	<div class="btn mt20">
	         		<div id="ui-upload-holder" class=" fl mr10" style="margin: 10px 40px"> 
	         			<div id="ui-upload-txt">上传文件</div> 
	              		<input type="file" name="faxPic" id="picture2" class="ui-upload-input"/>
	              		<input type="hidden" name="taxPicNumber" value="${tempdata.data.singleResult.taxPicNumber}"/>
               		</div>
	         	</div>
          </li>
          <li style="display: ${shop.flag == 'N' ? '' : 'none'}">
          		<div>组织机构代码证</div><div class="mt10">
          			<img src="/platform/ReadPic/pic/url?url=${tempdata.data.imgListResult.orgPic[0]}"  id="showMPic3" onclick="attachDialog(this.src)"/>

	         	</div>
	         	<div class="btn mt20">
	         		<div id="ui-upload-holder" class=" fl mr10" style="margin: 10px 40px"> 
	         			<div id="ui-upload-txt">上传文件</div> 
	              		<input type="file" name="orgPic" id="picture3"  class="ui-upload-input"/>
	              		<input type="hidden" name="orgPicNumber" value="${tempdata.data.singleResult.orgPicNumber}"/>
               		</div>
	         	</div>
          </li>

         	<li style="display: ${shop.flag == 'Y' ? '' : 'none'}">
          		<div>社会信用证</div><div class="mt10">
          			<img src="/platform/ReadPic/pic/url?url=${tempdata.data.imgListResult.creditPic[0]}"  id="showMPic6" onclick="attachDialog(this.src)"/>

	         	</div>
	         	<div class="btn mt20">
	         		<div id="ui-upload-holder" class=" fl mr10" style="margin: 10px 40px"> 
	         			<div id="ui-upload-txt">上传文件</div> 
	              		<input type="file" name="creditPic" id="picture6"  class="ui-upload-input"/>
	              		<input type="hidden" name="creditPicNumber" value="${tempdata.data.singleResult.creditPicNumber}"/>
               		</div>
	         	</div>
          </li>

          <li>
          		<div>身份证正面</div><div class="mt10">
          			<img src="/platform/ReadPic/pic/url?url=${tempdata.data.imgListResult.frontPic[0]}"  id="showMPic4" onclick="attachDialog(this.src)"/>

	         	</div>
	         	<div class="btn mt20">
	         		<div id="ui-upload-holder" class=" fl mr10" style="margin: 10px 40px"> 
	         			<div id="ui-upload-txt">上传文件</div> 
	              		<input type="file" name="icPicF" id="picture4"  class="ui-upload-input"/>
	              		<input type="hidden" name="frontPicNumber" value="${tempdata.data.singleResult.frontPicNumber}"/>
               		</div>
	         	</div>
          </li> 
          <li>
          		<div>身份证反面</div><div class="mt10">
          			<img src="/platform/ReadPic/pic/url?url=${tempdata.data.imgListResult.backPic[0]}"  id="showMPic5" onclick="attachDialog(this.src)"/>

	         	</div>
	         	<div class="btn mt20">
	         		<div id="ui-upload-holder" class=" fl mr10" style="margin: 10px 40px"> 
	         			<div id="ui-upload-txt">上传文件</div> 
	              		<input type="file" name="icPicB" id="picture5" class="ui-upload-input"/>
	              		<input type="hidden" name="backPicNumber" value="${tempdata.data.singleResult.backPicNumber}"/>
               		</div>
	         	</div>
          </li> 
          </ul>
        <div class="btn mt30 mb30"><a href="javascript:void(0);" onclick="modifyPerUserSubmit();" class="btn_cs">保存</a>
        <c:if test="${way == 1}">
        <a href="javascript:void(0);" onclick="window.location.href='<%=basePath %>shop/shopPerList.do';"class="btn_cs ml20">取消</a>
        </c:if>
        <c:if test="${way == 2}">
        <a href="javascript:void(0);" onclick="window.location.href='<%=basePath %>audit/auditList.do?type=1';"class="btn_cs ml20">取消</a>
        </c:if>
        </div>        
        
         </form> 
      </div>
      <!-- TAB1--END -->
          
	</div>          
	<!--内容  --END-->
          
  </div>
  <!---------------右边内容结束--------------->
  
   <!-- 修改联系人信息弹出框start -->
		<div id="updateDialog" style="display: none">
		<div class="popup_bg"></div>
		  <div class="dialog">
		    <div class="clearfix"> 
			  <div class="title"><a href="javascript:void(0);" class="out" onclick="$('#updateDialog').hide();"></a>修改联系人</div>
		      <div class="cotent">
		      	<form id="updateForm" action="updateLinkman.do">
		      	<input type="hidden" name="contactId" id="manid"/>
		      	<input type="hidden" name="shopId" id="link_shopid"/>
			    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table">
		          <tr>
		            <td valign="top" width="30%"  align="right"><span style="color:red;">*&nbsp;</span>店铺联系人：</td>
		            <td id="contactMan"></td>
		          </tr>
		          <tr>
		            <td valign="top" align="right"><span style="color:red;">*&nbsp;</span>联系人电话：</td>
		            <td id="contactTel"></td>
		          </tr>
		          <tr>
		            <td valign="top" align="right">备注：</td>
		            <td id="remark"></td>
		          </tr>   
		          <tr><td colspan="2" id="msgTD" style="display: none; text-align: center; color: red;"></td></tr>
		        </table>
		        </form>
		      </div>
		      <div class="btn"><a href="javascript:void(0);" class="btn_cs" onclick="updateLinkmanSubmit();">提交</a><a href="javascript:void(0);" class="btn_cs ml20" onclick="$('#updateDialog').hide();">取消</a></div> 
		    </div>
		  </div>
		 </div>
  <!--修改联系人信息弹出框end -->  
   <!--查看弹出图片 -->
  <div id="attachDialog" style="display: none">
	  <div class="popup_bg"></div>
		<div class="dialog" style='left:30%;width:1000px;top:30%;'>
		  <div class="clearfix">
		      <div class="title"><a href="#" class="out" onclick="$('#attachDialog').hide();"></a>查看</div>
		      <div class="cotent" style='max-height:600px;'>
		         <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table"> 
		          <tr>            
		            <td align="center"><img src="" style='height:580px;' class="see_img02"/></td>
		          </tr>
		        </table>
		      </div>
		      <div class="btn"><a href="#" class="btn_cs" onclick="$('#attachDialog').hide();">确认</a></div> 
		    </div>
		</div>
	</div>
	<!--查看弹出图片 -->
    <script id="tableTemplate" type="text/x-jquery-tmpl">
		
		{{each(i,user) users}}
			<tr>
				<td align="center">{{= i+1}}</td>
                <td align="center">{{= user.name }}</td>
                <td align="center">{{= user.phone }}</td>
                <td align="center">{{= user.remark }}</td>
                <td align="center"><a href="javascript:void(0);" onclick="openUpdateLinkman({{= user.id}},${id},'{{= user.name}}','{{= user.phone}}','{{= user.remark}}')" class="yellow">修改</a><a href="javascript:void(0);" onclick="delLinkMan({{= user.id}},${id})" class="yellow">删除</a></td>
			</tr>
		{{/each}}
  </script> 
  <script type="text/javascript">
  dmCheck.init("#addForm");
  dmCheck.init("#updateForm");
  $(function(){
	 
		getAllProvince();//获取所有省
		$("#picture1").uploadPreview({ Img: "showMPic1" });//图片预览
		$("#picture2").uploadPreview({ Img: "showMPic2" });//图片预览
		$("#picture3").uploadPreview({ Img: "showMPic3" });//图片预览
		$("#picture4").uploadPreview({ Img: "showMPic4" });//图片预览
		$("#picture5").uploadPreview({ Img: "showMPic5" });//图片预览
		$("#picture6").uploadPreview({ Img: "showMPic6" });//图片预览
	});
	 
  //查看图片
  function attachDialog(src){
	$("#attachDialog img").attr('src', src);
	$("#attachDialog").show();
  }

  //店铺信息修改
  function modifyPerUserSubmit(){
	  
  	if((obj = dmCheck.returnObj("#addForm")))	return obj.focus();//校验输入数据格式是否正确
  //店铺名称是否存在
  	if(isExistShopName($("#shopName").val())){
  		return;
  	}
  	//是否三证合一
  	var flag='${shop.flag}';
  	if("Y"==flag){
  		if($("#showMPic6").attr("src") == '/platform/ReadPic/pic/url?url=' || $("#showMPic6").attr("src") == ''){
  	   		dm.alert("请上社会信用证");
  	   		return;
  	   	 }
  	}else{
  		if($("#showMPic1").attr("src") == '/platform/ReadPic/pic/url?url=' || $("#showMPic1").attr("src") == ''){
  	   		dm.alert("请上传营业执照");
  	   		return;
  	   	 }
  	   	 if($("#showMPic2").attr("src") == '/platform/ReadPic/pic/url?url=' || $("#showMPic2").attr("src") == ''){
  	   		dm.alert("请上传税务登记证");
  	   		return;
  	   	 }
  	   	if($("#showMPic3").attr("src") == '/platform/ReadPic/pic/url?url=' || $("#showMPic3").attr("src") == ''){
  	   		dm.alert("请上传组织机构代码证");
  	   		return;
  	  	 }
  	}
 	 
   	if($("#showMPic4").attr("src") == '/platform/ReadPic/pic/url?url=' || $("#showMPic4").attr("src") == ''){
   		dm.alert("请上传身份证正面");
   		return;
  	 }
   	if($("#showMPic5").attr("src") == '/platform/ReadPic/pic/url?url=' || $("#showMPic5").attr("src") == ''){
   		dm.alert("请上传身份证反面");
   		return;
  	 }
  	$("#addForm").submit();	
  }


  dmCheck.initForAjax("#addForm");
  //获取所有省
  function getAllProvince(){
	  var pro = '${tempdata.data.singleResult.provinces}';
		$.ajax({
			type:"POST",
			url:"<%=basePath %>audit/getProvince.do",
			data:{"subRegionId":0},
			success:function(msg){
				var list=msg.data.data.list;
				$("#provinces").empty();
				$("#provinces").append("<option value=''>全部</option>");
				for(var i=0;i<list.length;i++){
					if(list[i].name==pro){
						$("#provinces").append("<option value='"+list[i].id+"' selected>"+list[i].name+"</option>");
						changeProvince(list[i].id);
					}else{
						$("#provinces").append("<option value='"+list[i].id+"'>"+list[i].name+"</option>");
					}
				}
			}
		});
	}
	//获取市
	function changeProvince(pid){
		var pro = '${tempdata.data.singleResult.city}';
		if(pid =='' || pid == null){
			$("#city").empty();
			$("#city").append("<option value=''>全部</option>");
		}else{
			$.ajax({
				type:"POST",
				url:"<%=basePath %>audit/getProvince.do",
				data:{"subRegionId":pid},
				success:function(msg){
					var list=msg.data.data.list;
					$("#city").empty();
					$("#city").append("<option value=''>全部</option>");
					for(var i=0;i<list.length;i++){
						if(list[i].name==pro){
							$("#city").append("<option value='"+list[i].id+"' selected>"+list[i].name+"</option>");
						}else{
							$("#city").append("<option value='"+list[i].id+"'>"+list[i].name+"</option>");
						}
					}
				}
			});
		}
	}
	
	  //店铺联系人弹出框
	  function openUpdateLinkman(id,shopid,name,tel,remark){
		  
		  $("#contactMan").html("<input type='text' name='name' class='yhgl_input' validate='q|zh|leng' leng='2,5' value='"+name+"'/>");//店铺联系人
		  $("#contactTel").html("<input type='text' name='phone' class='yhgl_input' validate='q|m' value='"+tel+"'/>");//电话
		  $("#remark").html("<input type='text' name='remark' class='yhgl_input w200' value='"+remark+"'/>");//备注
		  $("#manid").val(id);//联系人id
		  $("#link_shopid").val(shopid);//店铺id
		  $("#updateDialog").show();
	  }
	 //修改店铺联系人
	  function updateLinkmanSubmit(){
		  if((obj = dmCheck.returnObj("#updateForm")))	return obj.focus();//校验输入数据格式是否正确
		  //发送修改请求
		  $.ajax({ 
		         type:"POST",
		         url:"<%=basePath %>shop/updateLinkman.do",
		         data:$("#updateForm").serialize(),
		         success:function(result){
		        	 $('#updateDialog').hide();
		         	if(result.flag.code == "000000"){
		         		dm.alert("修改成功！",{
	            			title:"提示",				//弹窗的标提
	            			okName:"确定",			//如同alert确定按钮的value
	            			picClass:"d_succeed",	//这里有三个值 "d_succeed" 显示成功图标,"d_error" 显示错误图标,"d_perfect" 显示信息提示图标,
	            			callback:function(){	//按确定后执行的函数
	            				$.ajax({ 
	            			         type:"POST",
	            			         url:"<%=basePath %>shop/shopPerShowLinkman.do",
	            			         data:{"key":'${id}'},
	            			         success:function(result){
	            			        	 var data = result.cotman.data.list;
	            			         	//清空模板类容
	            			         	$('#tbodyId').empty();
	            			     		$('#tableTemplate').tmpl({users:data}).appendTo("#tbodyId");
	            			         }
	            				});
	            			}
		         		});
		         	}else{
		         		dm.alert(result.flag.description);
		         	}
		         }
		  });
	  }
	  //删除联系人
	  function delLinkMan(id,shopId){
		  	dm.confirm("是否删除联系人？",{
				title:"确认",				//标题
				okName:"确定",			//如同confirm确定按钮的value
				cancleName:"取消",		//如同confirm取消按钮的value
				callback:function(){	//按确定的执行的函数
					//发送删除请求
					  $.ajax({ 
					         type:"POST",
					         url:"<%=basePath %>shop/delLinkman.do",
					         data:{"contactId":id,"shopId":shopId},
					         success:function(result){
					        	 $('#updateDialog').hide();
					         	if(result.flag.code == "000000"){
					         		dm.alert("删除成功！",{
				            			title:"提示",				//弹窗的标提
				            			okName:"确定",			//如同alert确定按钮的value
				            			picClass:"d_succeed",	//这里有三个值 "d_succeed" 显示成功图标,"d_error" 显示错误图标,"d_perfect" 显示信息提示图标,
				            			callback:function(){	//按确定后执行的函数
				            				$.ajax({ 
				            			         type:"POST",
				            			         url:"<%=basePath %>shop/shopPerShowLinkman.do",
				            			         data:{"key":'${id}'},
				            			         success:function(result){
				            			        	 var data = result.cotman.data.list;
				            			         	//清空模板类容
				            			         	$('#tbodyId').empty();
				            			     		$('#tableTemplate').tmpl({users:data}).appendTo("#tbodyId");
				            			         }
				            				});
				            			}
					         		});
					         	}else{
					         		dm.alert(result.flag.description);
					         	}
					         }
					  });
				}
			});

	  }
	//判断店铺名称是否存在
	  function isExistShopName(shopName){
			var isExist=false;
		  if(shopName != ''){
			  $.ajax({
				  	async:false,
					type:"POST",
					url:"<%=basePath %>shop/isExistShopName.do",
					data:{"shopFullName":shopName,"shopId":''},
					success:function(msg){
						if(msg.flag.code == '000000'){
							if(msg.flag.data.singleResult == true){
								$("#shopName").focus();
			            		$("#shopName").before('<span class="pop-con"><div class="fl pop-pic"></div><div class="pop-info">店铺名称已存在</div></span>');
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
  </script>
  
</body>
</html>