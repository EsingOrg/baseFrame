<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp" %>
<html>
  <head>
  <title>快递到家--个人提金(快递方式)</title>
  </head>
  <body>
	<div class="systemUser">				
			<div class="r_main clearfix ">
			   <div class="main_title">个人提金(快递方式)</div>
				<form id="form" action="getGoldFMS.do" method="post">
			     <!--搜索表框  -->
	          <div class="main_con">
	          <div class="admin_input clearfix">
	          <p>
	                                        订单号：
	                 <input type="text" name="orderNo" class="yhgl_input"  maxlength="23"/>
	           </p>
	            <p>
	                                        用户名：
	                 <input type="text" name="userName" class="yhgl_input"  maxlength="20"/>
	           </p>
	            <p>
	                                        姓名：
	                 <input type="text" name="allUserFullName" class="yhgl_input"  maxlength="20"/>
	           </p>
	           <p>提交时间：
					<input type="text" name="startCreateTime" class="yhgl_input date" id="createTime1" onclick="WdatePicker({maxDate: '#F{$dp.$D(\'createTime2\')}'})" />
				    <span class="mr5">至</span> 
				    <input type="text" name="endCreateTime" class="yhgl_input date" id="createTime2" onclick="WdatePicker({minDate: '#F{$dp.$D(\'createTime1\')}'})" />
				</p>
				<p>
		                                        状态：
		            	<dim:select name="status" enumType="TakeGoldStatus" headName="全部" headValue="" exclude="BOOK,PERSONAL_CANCEL,SCENE_CANCEL,PERSONAL_CONFIRM,SHOP_RECEIVE" cssClass="yhgl_sel"></dim:select>
		        </p>
	              <p class="lo_btn">
	              <input type="button" class="search" onclick="search();" value="搜索" /> 
	              <shiro:hasPermission name="YWGL_TJYW_KDDJ_DC">
	              <input name="input" type="button" class="export ml10" value="导出" onclick="exportData('form','exportExpressToHome.do');"/>
	              </shiro:hasPermission> 
	            </div>
	            </div> 
          <!--搜索表框  --END-->  
				
				<div class="main_con">
				<div class="all">
				 <table   width="100%" border="0" cellspacing="0" cellpadding="3" class="main_table tc" >
						<thead>
						<tr class="title">
							<td>序号</td>
						    <td>订单号</td>
						    <td>用户名</td>
							<td>姓名</td>
							<td>手机号</td>
							<td>提金克重(克)</td>
							<td>制品</td>
							<td>数量(件)</td>
							<td>实发净重(克)</td>
						    <td>扣除存源(克)</td>
						    <td>扣除买源(克)</td>
						    <td>邮保费(元)</td>
						    <td>加工费(元)</td>
						    <td>剩余存源(克)</td>
						    <td>剩余买源(克)</td>
						    <td>提交时间</td>
						    <td>最后操作时间</td>
						    <td>状态</td>
							<td>操作</td>
						</tr>
				        </thead>
					<tbody id="grid"></tbody>
				</table>
				
				<div class="mt10">
		          	<p class="stat fl">提金克重合计：<span class="yellow f24" id="totalTakeWeight"></span>克</p>
		          	<p class="stat fl">扣除存源合计：<span class="yellow f24" id="totalMinusSave"></span>克</p>
		          	<p class="stat fl">扣除买源合计：<span class="yellow f24" id="totalMinusBuy"></span>克</p>
		          	<p class="stat fl">剩余存源合计：<span class="yellow f24" id="totalRemainSave"></span>克</p>
		          	<p class="stat fl">剩余买源合计：<span class="yellow f24" id="totalRemainBuy"></span>克</p>
		          	<p class="stat fl">加工费合计：<span class="yellow f24" id="totalProcessFee"></span>元</p>
		          	<p class="stat fl">邮保费合计：<span class="yellow f24" id="totalPostFee"></span>元</p>
		          	<p class="stat fl">实发净重合计：<span class="yellow f24" id="totalNetWeight"></span>克</p>
		          	<p class="stat fl"></p><p class="stat fl"></p>
		        </div> 
				<div  class="paging" id="pageTag"></div>
				</div>
				</form>
			</div>
			<div class="pager"></div>
		</div>

 </body>
 
  <!-- 系统用户显示模板 -->
	<script id="temp" type="text/x-jquery-tmpl">
	{{each(index) list}}
       <tr {{if index %2 == 0}}class="grey" {{/if}}>
		<td>{{= index+1+((pageIndex-1)*pageSize)}}</td>
	    <td>{{= orderNo}}</td>
	    <td>{{= userName}}</td>
        <td>{{= userFullName}}</td>
        <td>{{= userPhone}}</td> 
	    <td>{{= takeWeight}}</td>
	    <td>{{= productName}}</td>
        <td>{{= productCount}}</td> 
  		<td>{{= netWeight}}</td>
	    <td>{{= minusSave}}</td>
        <td>{{= minusBuy}}</td> 
  		<td>{{= postFee}}</td>
	    <td>{{= processFee}}</td>
        <td>{{= remainSave}}</td>
		<td>{{= remainBuy}}</td>
		<td>{{= createTime}}</td>
		<td>{{= updateTime}}</td>
		<td>{{= statusName}}</td>
		<td>
			<a  href="goldFMSDetail.do?id={{= id}}" class="orange">订单详情</a>
			<shiro:hasPermission name="YWGL_TJYW_KDDJ_YHYSH">
			{{if status  == 'PERSONAL_RECEIVE'}}<a  href="javascript:void(0);" onclick='receveConfirm({{= id}});' class="orange">用户已收货</a>{{/if}}
			</shiro:hasPermission>
		 </td>
       </tr>
	{{/each}}
	</script>
    <script type="text/javascript">
      //页面加载时调用
      $(function(){
  	 search();
      });
    //弹出框
    function popDiv(url){
 	   $.tbox.popup(url);
    }
    //初始加载数据
	function search(){
		DMGold.ajax({"formId":"form","serialize":true,"url":"getGoldFMSAjax.do","success":pageTagCallBack});
	}
	function pageTagCallBack(data){
 		//清空表格数据
 		$("#grid").empty();
 		//填充数据
		 $('#temp').tmpl(data.pageResult).appendTo("#grid");
		//初始化分页标签
		DMGold.PageTag.init({"divId":"pageTag","formId":"form","curPage":data.pageResult.pageIndex,"totalCount":data.pageResult.recordCount,
			          "pageCount":data.pageResult.pageTotal,"url":"getGoldFMSAjax.do","toPageCallBack":pageTagCallBack});
		//统计字段
		DMGold.PageTag.initStat({"totalTakeWeight":null,"totalMinusSave":null,"totalMinusBuy":null,"totalRemainSave":null,
     		"totalRemainBuy":null,"totalNetWeight":null},data.statResult,'0.000');
    	DMGold.PageTag.initStat({"totalProcessFee":null,"totalPostFee":null},data.statResult,'0.00');
 	}
	/**
	用户已收货确认操作
	*/
	function receveConfirm(id){
		 dm.confirm("确定用户已收货？",{
			title:"确认",				//标题
			okName:"确定",			//如同confirm确定按钮的value
			cancleName:"取消",		//如同confirm取消按钮的value
			picClass:"d_perfect",
              callback:function(){	//按确定的执行的函数			
            	  DMGold.ajax({"data":{'id':id},"serialize":true,"url":"receveConfirm.do","success":function(data){
					//显示提示信息
					if("000000"==data.code){
						dm.alert(data.description,{"picClass":"d_succeed"});
					}else{
						dm.alert(data.description,{"picClass":"d_error"});
					}
					//刷新用户列表
					search();
				}});
			}
		});
}

 </script>
</html>
