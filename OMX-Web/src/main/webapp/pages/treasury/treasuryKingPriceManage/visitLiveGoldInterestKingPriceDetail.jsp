<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp"%>
<html>
<head>
<title>查看</title>

<!-- 系统用户显示模板 -->
<script id="sysUserListTemplate" type="text/x-jquery-tmpl">
      <tr class="title" style="line-height: 30px;">
        <td align="left">改后金价</td> 
	    <td align="left">{{= updatePrice}}</td>
	    <td align="left">修改人</td>
        <td align="left">{{= updateBy}}</td> 
	    <td align="left">修改时间</td>
	    <td align="left">{{= updateTime}}</td>
       </tr>
	</script>
<script type="text/javascript">
        //页面加载时调用
        $(function(){
    	  sysUserListLoad();//jquery 模板demo
        });
        var sysUserListLoad = function(){
        	//造的测试数据，实际应用时，将ajax返回的json数据替换这里的data即可
       	 var data = ${pageList.data.pageResult.list};
       	 $('#sysUserListTemplate').tmpl(data).appendTo("#priceTable");
       }
    
    </script>

</head>
<body>

	<div class="systemUser">
		<div class="r_main clearfix ">
			<!--文本框 -->
			<div class="main_title">查看</div>
			<!--文本框 --END-->
				<div class="main_con">
					<div class="admin_input clearfix">
						<p style="float: right;"><a href="<%=basePath %>treasury/getLiveGoldInterestKingPrice.do" class="btn_cs" >返回</a></p>
					</div>
				</div>
			<form action="liveGoldDetail.do" id="dataForm">
			<input type="hidden" name="no" value="${priceReq.no }"/>
			<input type="hidden" name="priceDate" value="${priceDate }"/>
			<input type="hidden" name="price" value="${price }"/>
			<input type="hidden" name="updatePrice" value="${updatePrice }"/>
			<div class="main_con">
				<div class="menu_bd clearfix" id="todaytCont">
					<table width="100%" border="0" cellspacing="0" cellpadding="3" id="priceTable">
						<tr class="title" style="line-height: 30px;">
							<td align="left" width="170px;">日期</td>
							<td align="left" width="276px;">${priceDate }</td>
							<td align="left">&nbsp;&nbsp;</td>
							<td align="left">&nbsp;&nbsp;</td>
							<td align="left">&nbsp;&nbsp;</td>
							<td align="left">&nbsp;&nbsp;</td>
						</tr>
						<tr class="title" style="line-height: 30px;">
							<td align="left">活息金价（元/克）</td>
							<td align="left">${updatePrice }</td>
							<td align="left">&nbsp;&nbsp;</td>
							<td align="left">&nbsp;&nbsp;</td>
							<td align="left">&nbsp;&nbsp;</td>
							<td align="left">&nbsp;&nbsp;</td>
						</tr>
						<tr class="title" style="line-height: 30px;">
							<td align="left">刷新时间</td>
							<td align="left">${updateTime }</td>
							<td align="left">&nbsp;&nbsp;</td>
							<td align="left">&nbsp;&nbsp;</td>
							<td align="left">&nbsp;&nbsp;</td>
							<td align="left">&nbsp;&nbsp;</td>
						</tr>
						<tr class="title" style="line-height: 30px;">
							<td align="left">初始活息金价（元/克）</td>
							<td align="left">${price}</td>
							<td align="left">&nbsp;&nbsp;</td>
							<td align="left">&nbsp;&nbsp;</td>
							<td align="left">&nbsp;&nbsp;</td>
							<td align="left">&nbsp;&nbsp;</td>
						</tr>
					</table>
				</div>
				<div style="margin-top: 25px;" id="pageId">
					<dim:page url="liveGoldDetail.do" totalCount="${pageList.data.pageResult.recordCount }" formId="dataForm" showPages="${pageList.data.pageResult.pageSize }"
								curPage="${pageList.data.pageResult.pageIndex }" totalPages="${pageList.data.pageResult.pageTotal }" />
				</div>
			</div>
			</form>
		</div>
	</div>
	
</body>
</html>