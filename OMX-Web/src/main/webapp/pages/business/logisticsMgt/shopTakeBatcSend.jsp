<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp"%>
<html>
<head>
<title>平台待发货-店铺提金发货(批量发货)</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1" >
</head>
<body>
<!---------------右边内容开始--------------->
      <div class="r_main clearfix">
		<!--内容 -->
        <div class="main_title">店铺提金发货批量发货</div>
		<form action="shopTakeSendCommit.do" method="post" id="publicForm">
		<input type="hidden" name="token" value="${token}">
		<div class="main_con">
        	<div class="pat_title clearfix">填写发货信息 </div>
            <ul class="view clearfix" >
                <li>
                    <div class="til">店铺名：</div>
                    <div class="infl">${order.singleResult.shopName}</span></div>
                    <div class="til">店铺名称：</div>
                    <div class="infl">${order.singleResult.shopFullName}</span></div>
                    <div class="tir">提金克重：</div>
                    <div class="infr">${order.singleResult.takeWeight} 克</div>
                    <input type="hidden" name="orderWeight" value="${order.singleResult.takeWeight}">       
                    <div class="tir">总手续费：</div>
                    <div class="infr">${order.singleResult.fee} 元</div>              
                </li>
                <li>
                    <div class="til">店铺地址：</div>
                    <div class="info">${order.singleResult.addr}</div>
                    <input type="hidden" name="addr" value="${order.singleResult.addr}">
                </li>  
                <li>
                	<div class="til"><span style="color:red;">*&nbsp;</span>实发净重：</div>
                	<div class="infl"><input type="text" name="netWeight" id="netWeight" validate="q|weight" value="${order.singleResult.takeWeight}" class="yhgl_input w100" />&nbsp;克</div>
                    <div class="tir">发货方式：</div>
                    <div class="infr">
                    <dim:radio name="type" enumType="LogisticType" defaultValue="POST" exclude="SELF_TO" onclick="filter(this);"/>
                    </div>
                </li> 
                <li>
                    <div class="til"><span style="color:red;">*&nbsp;</span>毛重：</div>
                    <div class="infl">
                      <input type="text" name="grossWeight" id="grossWeight"maxlength="10"  validate="q|weight" class="yhgl_input w100" />&nbsp;克</div>                    
                    <div class="tir logiType"><span style="color:red;">*&nbsp;</span>物流方：</div>
                    <div class="infr logiType" id="logisticCompany"><span class="info">
                      <!-- <input type="text" name="logisticCompany" id="logisticCompany" validate="q" class="yhgl_input w100" /> -->
                      <select name="logisticCompany" class="yhgl_sel">
			                 <c:forEach items="${logsReq}" var="item">
			                 <option value="${item }">${item }</option>
			                 </c:forEach>
			                 </select>
                    </span></div>
                </li> 
                <li>
                    <div class="til"><span style="color:red;">*&nbsp;</span>包数：</div>
                    <div class="infl">
                      <input type="text" name="packageCount"maxlength="10"  id="packageCount" validate="q|z" class="yhgl_input w100" />&nbsp;包</div>                    
                    <div class="tir logiType"><span style="color:red;">*&nbsp;</span>物流号：</div>
                    <div class="infr logiType"><span class="infl">
                      <input type="text" name="logisticNo" id="logisticNo" maxlength="20" validate="q" class="yhgl_input w100" />
                    </span></div>
                </li> 
                <li>
                    <div class="til">备注：</div>
                    <div class="info"><textarea name="remark"maxlength="150"  cols="80" rows="5" class="border"></textarea></div>
                </li>                                 
            </ul>
       		<div class="btn mt30 mb30"><input name="input"class="btn_cs ml10" type="button" onclick="confirm();" value="确认发货">
       		<a href="waitDispatch.do?tabIndex=storeGet" class="btn_cs ml20">返回</a></div>
                       
		</div>
        </form>
        <form id="searchForm">
		<div class="main_con">
            <div class="til"><span style="color:red;">*&nbsp;</span>订单号：
              <input type="text" class="yhgl_input w100" id="orderIdSearReq"/>
       		  <input name="input"class="btn_cs ml10" type="button" onclick="search();" value="查询">
       		  <input name="input"class="btn_cs ml10" type="button" onclick=" exportData('searchForm','<%=basePath%>business/logisticsMgt/wdStoreGetExport.do');" value="导出">
       		</div>
		</div>
        </form>
        <div class="main_con">
        <table width="100%" border="0" cellspacing="0" cellpadding="3" class="main_table tc">
              <thead>
              <tr class="title">
                <td align="center">订单号</td> 
                <td align="center">用户名</td> 
                <td align="center">订单类型</td> 
                <td align="center">提金克重（克）</td> 
                <td align="center">手续费（元）</td>
                <td align="center">最后操作时间</td> 
                <td align="center">操作</td>              
              </tr>
             </thead>
              <tbody id="shopTakeGrid"></tbody>          
            </table>
            <div id='pageTag'></div>
        </div>
		<!--内容  --END-->
</div>
</body>
<!-- 个人店铺自提  GridList数据 -->
<script id="shopTakeTemp" type="text/x-jquery-tmpl">
{{each(index) list}}
       <tr {{if index %2 == 0}}class="grey" {{/if}}>
        <td>{{= orderNo}}</td> 
	    <td>{{= shopName}}</td>
        <td>{{= orderTypeName}}</td> 
		<td>{{= bookWeight}}</td>
		<td>{{= fee}}</td>
		<td>{{= updateTime}}</td>
        <td>
			<a  href="#" onclick="openDetail('{{= id}}','{{= orderType}}');" class="orange">订单详情</a>
		</td>
       </tr>
{{/each}}
</script>
<script type="text/javascript">
dmCheck.init("#publicForm");
//确认事件
function confirm(){
	  if(!dmCheck.check("#publicForm")){
			return false;
		}
	  $("#publicForm").submit();
}
//初始化加载
$(function(){
	var data = ${sku}
	//清空表格数据
	$("#shopTakeGrid").empty();
	//填充数据
    $('#shopTakeTemp').tmpl(data.pageResult).appendTo("#shopTakeGrid");
});
function openDetail(id,orderType){
	var url = "orderDetailShopTak.do?id="+id+"&url=waitDispatch.do&tableId=storeGet"+"&orderType="+orderType+"&showonly=show&t=<%=Math.random() %>"
	$.tbox.popup(url);
}
function filter(data){
	var val = data.defaultValue;
	if(val=='SELF_FROM'){
		$(".logiType").hide();
		$("#logisticCompany").removeAttr("validate");
		$("#logisticNo").removeAttr("validate");
	}else{
		$(".logiType").show();
		$("#logisticCompany").attr("validate","q");
		$("#logisticNo").attr("validate","q");
	}
}
//-------------TTTTT----------------------------------------------

//本次发送的订单Id集
var orderIds = new Array();
//初始化加载
$(function(){
	var data = ${sku}
	//清空表格数据
	$("#shopTakeGrid").empty();
	//填充数据
    $('#shopTakeTemp').tmpl(data.pageResult).appendTo("#shopTakeGrid");
  //将订单id插入到form
	var orderIdList = ${orderIdList};
	$.each(orderIdList,function(index,node){
		var input = document.createElement("input");
		input.name="orderIdList";
		input.value=node;
		input.type="hidden";
		$("#searchForm").append(input);//用于下方列表查询
		$("#publicForm").append($(input).clone(true));//用于发货确认提交
	});
	DMGold.ajax({"formId":'searchForm',"serialize":true,"url":"getShopOrderInfo.do","success":function(data){
		$.each(data.pageResult.list,function(index,node){
			//初始化本地对象--id集合
			orderIds[orderIds.length] = {"id":node.id,"orderNo":node.orderNo};
		});
	}});
	//初始分页标签
	DMGold.PageTag.init({"divId":"pageTag","formId":"searchForm","curPage":data.pageResult.pageIndex,"totalCount":data.pageResult.recordCount,
          "pageCount":data.pageResult.pageTotal,"url":"wdStoreGetAjax.do","toPageCallBack":pageTagCallBack});
});
function pageTagCallBack(data){
	//清空表格数据
	$("#shopTakeGrid").empty();
	//填充数据
    $('#shopTakeTemp').tmpl(data.pageResult).appendTo("#shopTakeGrid");
  //初始分页标签
	DMGold.PageTag.init({"divId":"pageTag","formId":"searchForm","curPage":data.pageResult.pageIndex,"totalCount":data.pageResult.recordCount,
          "pageCount":data.pageResult.pageTotal,"url":"wdStoreGetAjax.do","toPageCallBack":pageTagCallBack});
}
//查看订单详情
function openDetail(orderNo){
	var url = "orderDetailOp.do?orderNo="+orderNo+"&showonly=show&t=<%=Math.random() %>"
	$.tbox.popup(url);
}
//订单列表查询
function search(){
	debugger;
	//条件值
	var idReq = $("#orderIdSearReq").val();
	if(idReq!=""){
		//删除查询框中的条件
		$("#searchForm").find("input[name=orderIdList]").remove();
		//模糊查询
		var index = 0;
		//如果匹配不到订单号则清空列表
		var isEmp;
		for(var i=0;i<orderIds.length;i++){
			if(findVag(idReq,orderIds[i].orderNo) >= 0){
				//插入新的条件：id
				isEmp = true;
				var input = document.createElement("input");
				input.name="orderIdList";
				input.value=orderIds[i].id;
				input.type="hidden";
				$("#searchForm").append(input);//用于下方列表查询
			}
		}
		if(!isEmp){
			$("#shopTakeGrid").empty();
			$("#pageTag").empty();
			return false;
		}
		 DMGold.ajax({"formId":"searchForm","serialize":true,"url":"wdStoreGetAjax.do","success":pageTagCallBack});
	}else{
		//查询全部
		//刷新查询条件	
		$("#searchForm").find("input[name=orderIdList]").remove();
		for(var i=0;i<orderIds.length;i++){
			//插入新的条件：id
			var input = document.createElement("input");
			input.name="orderIdList";
			input.value=orderIds[i].id;
			input.type="hidden";
			$("#searchForm").append(input);//用于下方列表查询
		}
		DMGold.ajax({"formId":"searchForm","serialize":true,"url":"wdStoreGetAjax.do","success":pageTagCallBack});
	}
}
//模糊查询，从左开始匹配,exp匹配值，targ目标匹配值
function findVag(exp,targ){
	var expL = exp.length;   
    var targL = targ.length;    
    var sCompare;   
    if(expL <= targL ){   
        for(var i = 0; i <= targL - expL + 1; i++){   
            sCompare = targ.substring(i, i + expL);   
            if(sCompare == exp){   
                return i;   
            }   
        }   
    }   
    return -1;  
}
var logisticCompany;
function filter(data){
	var val = data.defaultValue;
	if(val=='SELF_FROM'){
		$(".logiType").hide();
		$("#logisticNo").removeAttr("validate");
		$("#logisticNo").val("");
		logisticCompany = $("select[name='logisticCompany']");
		$("#logisticCompany").empty();
	}else{
		$(".logiType").show();
		$("#logisticNo").attr("validate","q");
		
		$("#logisticCompany").append(logisticCompany);
	}
}
</script>
</html>