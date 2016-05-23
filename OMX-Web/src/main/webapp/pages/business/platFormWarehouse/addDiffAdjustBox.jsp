<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ include file="/WEB-INF/include/common/popDivHeader.jsp" %>
<html>
  <head>
    <title>新增称差</title>
  </head>
  <body>

<div class="popup_bg"></div>
<div class="dialog" style="width: 550px;">
  <div class="clearfix"> 
      <div class="title"><a href="javascript:;" onClick="$.tbox.close()" class="out"></a>新建称差</div>
      <div class="cotent">
       <form id="publicForm" action="<%=basePath %>business/platFormWarehouse/addDiffAdjustBoxDeatil.do" method="post" >
         <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table">
          <tr>
            <td valign="top" width="30%" align="right"><span class="red">*</span>店铺名称：</td>
            <td><input name="shopName" id = "shopName" type="text" class="yhgl_input" validate="q" onblur="showId()" onfocus="$('#returnIdTr').hide();"/>
            <input name="input" type="button" class="btn_cs ml10" value="查询" onclick="search()"/></td>
          </tr>
          <tr style="display: none;" id="returnIdTr" >
          	<td valign="top" width="30%" align="right"><span class="red">*</span>用户名：</td>
            <td><input name="shopId" id="shopId" type="hidden" />
            	<span id="username"></span>
            </td>
          </tr> 
          <tr>
            <td valign="top" align="right"><span class="red">*</span>调整克重：</td>
            <td><input name="weight" id = "weight" type="text" validate="q"   class="yhgl_input" />克</td>
          </tr>
          <tr>
            <td valign="top" align="right">备注：</td>
            <td><textarea rows="3" cols="30" name = "remark" validate="leng"  leng="0,30" maxlength="30" id="remark"></textarea></td>
          </tr>      
        </table>
	        	<div class="btn" id="showButton">
		      		<input name="input" type="button" class="btn_cs ml10" value="确认" onclick="save()"/>
		      		<input type="button" class="btn_cs ml10" value="取消" onclick="javascript:$.tbox.close();"/>
	      		</div>
        </form>
      </div>
    </div>
</div>
<div class="r_main clearfix" id="userBox" style="display:none;">
  	<div id="popCon" class="dialog" style="width:1000px;margin: -260px 0 0 -400px">
		<div class="clearfix"> 
			<div class="title"><a id="closeBtn" href="javascript:;" onClick="$('#userBox').hide();" class="out"></a>选择店铺</div>
			<div class="me_con">
			  	<form id="userForm" method="post">
				   <!--搜索框  -->
			      <div class="main_border clearfix">
			        <div class="admin_input clearfix">
			          <p>用户名：<input type="text" name="userName" class="yhgl_input"  maxlength="20"/></p>
			          <!-- <p>店铺名称：<input type="text" name="shopFullName" class="yhgl_input" maxlength="40"/></p> -->
			          <p>
			            	所在省份： 
			            <select name="provinces" id="provinces" class="yhgl_sel" onchange="changeProvince(this.value)">
					            </select>
			          </p>
			          <p>
					  	所在市区： 
					  	<select name="city" id="city" class="yhgl_sel">
						<option value="">全部</option>
			            </select>
					  </p>
			          <p class="lo_btn">
			               <input type="button" onclick="findUser();" class="search" value="搜索" /> 
			 		  </p>
			        </div>
			       </div> 
			              <!--搜索表框  --END-->  
				 
				 <div class="main_con">
				 <!-- 表格框 -->
				 <table   width="100%" border="0" cellspacing="0" cellpadding="3" class="main_table tc" >
						<thead>
							<tr class="title">
								<td>   </td>
								<td>序号</td>
							    <td>用户名</td>
							    <td>店铺名称</td>
							    <td>所在省份</td>
							    <td>所在市区</td>
								<td>状态</td>
							</tr>
				        </thead>
					<tbody id="sysUserListGrid"></tbody>
				</table>
				
				<!-- 表格框 --END -->
				<!-- 分页组件-->
				<div id="shopDiv"></div>
				<!-- 分页组件 --END -->
				<p style="text-align: center;margin-top: 10px;">
			       <input type="button" onclick="confirm();" class="btn_cs ml10"  value="确认" /> &nbsp&nbsp&nbsp
			       <input type="button" onclick="exit();"  class="btn_cs ml10" value="退出" /> 
			 	</p>
				</div>
				</form>
			</div>
		</div>
	</div>
</div>
  <script id="allData" type="text/x-jquery-tmpl">
{{each(index) list}}
       <tr {{if index %2 == 0}}class="grey" {{/if}}>
		<td><input type="radio" name="shopidRadio" value="{{= shopUserId}}" id="{{= shopId}}" shopName="{{= name}}"/></td>
		<td>{{= index+1}}</td>
        <td>{{= shopUserId }}</td>
	    <td>{{= name}}</td>
 		<td>{{= provinces}}</td>
 		<td>{{= city}}</td>
	    <td>{{if lockFlag == 'Y'}}
					锁定
			{{else}}
					正常
			{{/if}}
		</td>
      </tr>
 {{/each}}
</script>
<script type="text/javascript">
	dmCheck.init("#publicForm");
	//确定按钮 
	function save(){
	  if(!dmCheck.check("#publicForm")){
			return false;
		}
	  changeStatus($("#shopName").val(),$("input[name='shopId']").attr("value"),$("input[name='weight']").attr("value"),
			      $("#remark").val());
	}
	//弹出查询店铺框
	function search(){
		document.getElementById("userForm").reset();
		for(var index in DMGold.PageTag){
			page[index] = DMGold.PageTag[index];
		}
		findUser();
		getAllProvince();
		$("#userBox").show();
	}
	//查询店铺列表
	function findUser(){
		$.ajax({
			cache: true,
            type: "POST",
            url:"shopPerList.do",
            data:$('#userForm').serialize(),// 提交的form表单对象 
            async: false,
            success: function(data) {
            	shopList(data);   	 		
            }
		});
	}
	 var page = new Object();
	//将店铺数据放入表格
 	function shopList(data){
  	  	//清空表格数据
		$("#sysUserListGrid").empty();
		//填充数据
		$('#allData').tmpl(data.pageList.data.pageResult).appendTo("#sysUserListGrid");
  	 	//初始化分页标签
  		DMGold.PageTag.init({"divId":"shopDiv","formId":"userForm","curPage":data.pageList.data.pageResult.pageIndex,"totalCount":data.pageList.data.pageResult.recordCount,
  				         "pageCount":data.pageList.data.pageResult.pageTotal,"url":"shopPerList.do","toPageCallBack":shopList});
  	  	}
	
	//提示是否处理
	  function changeStatus(shopName,shopId,weight,remark){
			
		     $("#shopNameMsg").append(shopName);
		     $("#adjWeight").append(parseFloat(weight).toFixed(3));
		     //提交数据
		     $("#subShopId").val(shopId);
		     $("#subRemark").val(remark);
		     $("#subWeight").val(weight);
			 $.tbox.showDiv($("#msgT").html());
	  } 
	
	function confirm(){
		var val=$('input:radio[name="shopidRadio"]:checked').val();
		var id=$('input:radio[name="shopidRadio"]:checked').attr("id");
		var shopName=$('input:radio[name="shopidRadio"]:checked').attr("shopName");
		if(val!=null){
			$("#shopName").val(shopName);
			$("#shopId").val(id);
    		$("#username").text(val);
    		$('#returnIdTr').show();
    		exit();
		}else{
			dm.alert("请选择店铺！");
		}
	}
 	//店铺id的返回 
 	function showId()
 	{
 		if($("#shopName").val() != "")
 		{
 			$.ajax({
				cache: true,
	            type: "POST",
	            url:"getIdByShopName.do",
	            data:$('#publicForm').serialize(),// 提交的form表单对象 
	            async: false,
	            success: function(data) {
	            	if(data != null)
	            	{
	            		$('#returnIdTr').show();
	            		$("#shopId").val(data.shopId);
	            		$("#username").text(data.shopUserId);
	            	}
	            	else
	            	{
	            		$("#shopName").focus();
	            		$("#shopName").before('<span class="pop-con"><div class="fl pop-pic"></div><div class="pop-info">店铺名不存在或者有误 </div></span>');
	            	}
	     	 		
	            }
			});
 		}
 	}
 	function thSubmit(){
 		$("#outForm").submit();
 	};
 	function exit(){
 		$('#userBox').hide();
 		//刷新分页
 		  for(var index in DMGold.PageTag){
 			  DMGold.PageTag[index] = page[index];
 			}
 	}
 	
	//获取所有省
	function getAllProvince(){
		$.ajax({
			type:"POST",
			url:"<%=basePath%>audit/getProvince.do",
			data:{"subRegionId":0},
			success:function(msg){
				var list=msg.data.data.list;
				$("#provinces").empty();
				$("#provinces").append("<option value=''>全部</option>");
				for(var i=0;i<list.length;i++){
					
					$("#provinces").append("<option value='"+list[i].id+"'>"+list[i].name+"</option>");
					
				}
			}
		});
	}
	//获取省下的市
	function changeProvince(pid){
		if(pid =='' || pid == null){
			$("#city").empty();
			$("#city").append("<option value=''>全部</option>");
		}else{
			$.ajax({
				type:"POST",
				url:"<%=basePath%>audit/getProvince.do",
				data:{"subRegionId":pid},
				success:function(msg){
					var list=msg.data.data.list;
					$("#city").empty();
					$("#city").append("<option value=''>全部</option>");
					for(var i=0;i<list.length;i++){
						$("#city").append("<option value='"+list[i].id+"'>"+list[i].name+"</option>");
						
					}
				}
			});
		}
	}
 </script>
<div id="msgT" style="display:none;">
<div class="popup_bg"></div>
<div class="dialog">
  <div class="clearfix"> 
      <div class="title"><a href="javascript:void(0)" class="out" onclick="$.tbox.close();"></a>确认称差</div>
      <div class="cotent clearfix">
         <div class="conn">
         <form id="outForm" action="addDiffAdjustBoxDeatil.do" method="post">
             <input type="hidden" name="token" value="${token}">
             <input type="hidden" name="shopId" id="subShopId">
             <p class="tl f16 mt10">店铺名称：<input name="remark" id="subRemark" type="hidden"/><span  class="green f24" id="shopNameMsg"></span><span class="green"></span></p>
             <p class="f16 tl mt10">调整克重：<input name="weight" id="subWeight" type="hidden"/><span class="yellow f24" id="adjWeight"></span><span class="yellow">克</span></p>
        	</form>
         </div> 
         <div class="btn"><a href="javascript:void(0)" onclick="thSubmit();"  class="btn_cs">确定</a><a href="javascript:void(0)" class="btn_hs ml20" onclick="$.tbox.close();">取消</a></div>
      </div>     
    </div>
</div>
</div>
  </body>
</html>
