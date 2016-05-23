<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp"%>
<html>
<head>
<title>平台待发货-个人快递到家发货</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1" >
</head>
<body>
<!---------------右边内容开始--------------->
      <div class="r_main clearfix">
		<!--内容 -->
        <div class="main_title">个人快递到家批量发货</div>
		<form action="expressSendCommit.do" method="post" id="publicForm">
		<input type="hidden" name="token" value="${token}">
		<div class="main_con">
        	<div class="pat_title clearfix">填写发货信息 </div>
            <ul class="mentioning clearfix" >
                <li>
                    <div class="til">用户名：</div>
                    <div class="infl">${order.singleResult.userName}</span></div>
                    <div class="tir">提金克重：</div>
                    <div class="infr">${order.singleResult.takeWeight} 克</div>   
                    <input type="hidden" name="orderWeight" value="${order.singleResult.takeWeight}">      
                </li>
                <li>
                	<div class="tir">总加工费：</div>
                    <div class="infr">${order.singleResult.fee} 元</div> 
                    <div class="tir">总邮保费：</div>
                    <div class="infr">${order.singleResult.postFee} 元</div>  
                </li>
                <li> 
                    <div class="til">收货地址：</div>
                    <div style="width: 600px;margin-left: 200px;">${order.singleResult.addr}</div>
                    <input type="hidden" name="addr" value="${order.singleResult.addr}">
                </li>  
                <li>
                	<div class="til"><span style="color:red;">*&nbsp;</span>实发净重：</div>
                	<div class="infl"><input type="text" name="netWeight" id="netWeight" validate="q|gram" value="${order.singleResult.takeWeight}" class="yhgl_input w100" />&nbsp;克</div>
                    <div class="tir logiType"><span style="color:red;">*&nbsp;</span>物流方：</div>
                    <div class="infr logiType" ><span class="info">
                      <!-- <input type="text" name="logisticCompany" id="logisticCompany" validate="q" class="yhgl_input w100" /> -->
                        <select name="logisticCompany" class="yhgl_sel">
			                 <c:forEach items="${logsReq}" var="item">
			                 <option value="${item }">${item }</option>
			                 </c:forEach>
			                 </select>
                    </span></div>
                </li> 
                <li>
                    <div class="til"><span style="color:red;">*&nbsp;</span>毛重：</div>
                    <div class="infl">
                      <input type="text" name="grossWeight" id="grossWeight" validate="q|weight" maxlength="10" class="yhgl_input w100" />&nbsp;克</div>                    
                    <div class="tir logiType"><span style="color:red;">*&nbsp;</span>物流号：</div>
                    <div class="infr logiType"><span class="infl">
                      <input type="text" name="logisticNo" id="logisticNo" validate="q" maxlength="20" class="yhgl_input w100" />
                    </span></div>
                </li> 
                <li>
                    <div class="til"><span style="color:red;">*&nbsp;</span>包数：</div>
                    <div class="infl">
                      <input type="text" name="packageCount" id="packageCount" validate="q|z" maxlength="10" class="yhgl_input w100" />&nbsp;包</div>                    
                </li> 
                <li>
                    <div class="til">备注：</div>
                    <div class="info"><textarea name="remark" cols="80" maxlength="150" rows="5" class="border"></textarea></div>
                </li>                                 
            </ul>
       		<div class="btn mt30 mb30"><input name="input"class="btn_cs ml10" type="button" onclick="confirm();" value="确认发货">
       		<a href="waitDispatch.do?tabIndex=express" class="btn_cs ml20">返回</a></div>
		</div>
        </form>
        <form id="searchForm">
		<div class="main_con">
            <div class="til">
              <span style="color:red;">*&nbsp;</span>订单号：
              <input type="text" class="yhgl_input w100" id="orderIdSearReq"/>
              <!-- <span style="color:red;">*&nbsp;</span>制品： -->
              <input type="hidden" name="productName"class="yhgl_input w100" />
       		  <input name="input"class="btn_cs ml10" type="button" onclick="search();" value="查询">
       		  <input name="input"class="btn_cs ml10" type="button" onclick="exportData('searchForm','<%=basePath%>business/logisticsMgt/wdExpressExport.do');" value="导出">
       		</div>
		</div>
        </form>
        <div class="main_con">
        <table width="100%" border="0" cellspacing="0" cellpadding="3" class="main_table tc">
              <thead>
              <tr class="title">
                <td align="center">订单号</td> 
                <td align="center">姓名</td> 
                <td align="center">手机号</td> 
                <td align="center">订单类型</td> 
                <td align="center">提金克重（克）</td> 
                <td align="center">加工费（元）</td>
                <td align="center">邮保费（元）</td> 
                <td align="center">制品</td> 
                <td align="center">数量（件）</td> 
                <td align="center">最后操作时间</td> 
                <td align="center">操作</td>              
              </tr>
             </thead>
              <tbody id="expressGrid"></tbody>          
            </table>
            <div id="pageTag"></div>
        </div>
		<!--内容  --END-->
</div>
</body>
<!-- 个人店铺自提  GridList数据 -->
<script id="expressTemp" type="text/x-jquery-tmpl">
{{each(index) list}}
       <tr {{if index %2 == 0}}class="grey" {{/if}}>
        <td>{{= orderNo}}</td> 
	    <td>{{= userName}}</td>
	    <td>{{= userPhone}}</td>
        <td>{{= orderTypeName}}</td> 
	    <td>{{= takeWeight}}</td>
	    <td>{{= fee}}</td>
		<td>{{= postFee}}</td>
        <td>{{= productName}}</td> 
		<td>{{= productCount}}</td>
		<td>{{= updateTime}}</td>
        <td>
			<a  href="#" onclick="openDetail('{{= id}}','{{= orderType}}');" class="orange">订单详情</a>
		</td>
       </tr>
{{/each}}
</script>
<script type="text/javascript">
dmCheck.init("#publicForm");

//发货确认
function confirm(){
	  if(!dmCheck.check("#publicForm")){
			return false;
		}
	  $("#publicForm").submit();
}
//本次发送的订单Id集
var orderIds = new Array();
//初始化加载
$(function(){
	var data = ${sku}
	//清空表格数据
	$("#expressGrid").empty();
	//填充数据
    $('#expressTemp').tmpl(data.pageResult).appendTo("#expressGrid");
	//将订单id插入到form
	$.each(data.pageResult.list,function(index,node){
		var input = document.createElement("input");
		input.name="orderIdList";
		input.value=node.id;
		input.type="hidden";
		
		$("#searchForm").append(input);//用于下方列表查询
		$("#publicForm").append($(input).clone(true));//用于发货确认提交
		//初始化本地对象--id集合
		orderIds[orderIds.length] = {"id":node.id,"orderNo":node.orderNo};
	});
	//初始分页标签
	DMGold.PageTag.init({"divId":"pageTag","formId":"searchForm","curPage":data.pageResult.pageIndex,"totalCount":data.pageResult.recordCount,
          "pageCount":data.pageResult.pageTotal,"url":"wdExpressAjax.do","toPageCallBack":pageTagCallBack});
});
function pageTagCallBack(data){
	//清空表格数据
	$("#expressGrid").empty();
	//填充数据
    $('#expressTemp').tmpl(data.pageResult).appendTo("#expressGrid");
  //初始分页标签
	DMGold.PageTag.init({"divId":"pageTag","formId":"searchForm","curPage":data.pageResult.pageIndex,"totalCount":data.pageResult.recordCount,
          "pageCount":data.pageResult.pageTotal,"url":"wdExpressAjax.do","toPageCallBack":pageTagCallBack});
}
//查看订单详情
function openDetail(id,orderType){
	var url = "orderDetailExprTak.do?id="+id+"&url=waitDispatch.do&tableId=express"+"&orderType="+orderType+"&showonly=show&t=<%=Math.random() %>"
	$.tbox.popup(url);
}
//订单列表查询
function search(){
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
			$("#expressGrid").empty();
			$("#pageTag").empty();
			return false;
		}
		 DMGold.ajax({"formId":"searchForm","serialize":true,"url":"wdExpressAjax.do","success":pageTagCallBack});
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
		DMGold.ajax({"formId":"searchForm","serialize":true,"url":"wdExpressAjax.do","success":pageTagCallBack});
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
</script>
</html>