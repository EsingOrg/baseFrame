<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp"%>
<html>
<head>
<title>交易所实时金价</title>

<!-- 系统用户显示模板 -->
<script id="sysUserListTemplate" type="text/x-jquery-tmpl">
	{{each(i,pc) msg}}
      <tr>
        <td><input type="checkbox" name="onecheckbox" value="{{= pc.no}}"/></td> 
	    <td>{{= i+1}}</td>
	    <td>{{= pc.no}}</td>
        <td>{{= pc.time}}</td> 
	    <td>{{= pc.price}}</td>
       </tr>
	{{/each}}
	</script>
<script type="text/javascript">
        //页面加载时调用
        $(function(){
    	  document.getElementById("")
    	  sysUserListLoad();//jquery 模板demo
        });
        var sysUserListLoad = function(){
        	//造的测试数据，实际应用时，将ajax返回的json数据替换这里的data即可
       	 var data = ${pageList.data.pageResult.list};
       	 $('#sysUserListTemplate').tmpl({msg:data}).appendTo("#priceTable");
       	 
       	 //点击全选或全不选
       	 $("[name='allcheckbox']").click(function(){
       		var flag = $(this).attr("checked");
	       	if(!flag)
	       	$("[name = onecheckbox]:checkbox").attr("checked",false);
	       	else
	       	$("[name =onecheckbox]:checkbox").attr("checked",true);
	       	});
       	 
       //全选后，全选的checkbox选中状态,取消某个选中后，全选的checkbox取消选中状态
       	$("[name=onecheckbox]:checkbox").click(function(){
            var flag = true;
            $("[name=onecheckbox]:checkbox").each(function(){
            if(!this.checked)
             {
                flag = false;
             }
            });
              $("[name='allcheckbox']").attr("checked",flag);
           });
       	
       	<!--点击批量删除事件-->
       	$("#batchDel").click(function(){
       		var boxArray = $("[name=onecheckbox]:checkbox");
       		var checkedList = new Array(); 
       		var total = 0;
       		for(var i=0;i<boxArray.length;i++){
	       		if(boxArray[i].checked){
	       			total++;
	       			checkedList.push(boxArray[i].value); 
	       		}
       		}
       		if(total==0){
       			dm.alert("请选择勾选项。",{
       				title:"批量删除",				//弹窗的标提
       				okName:"确定",			//如同alert确定按钮的value
       				picClass:"d_succeed",		//这里有三个值 "d_succeed" 显示成功图标,"d_error" 显示错误图标,"d_perfect" 显示信息提示图标,
       				notHaveClose:"xxx"     //不定义此属性则有“x”关闭按钮
       			});
       		}else{
       			dm.confirm("您确定要删除吗?",{
       				title:"批量删除",				//标题
       				okName:"确定",			//如同confirm确定按钮的value
       				cancleName:"取消",		//如同confirm取消按钮的value
       				callback:function(){	//按确定的执行的函数
       					$.ajax({ 
       						type: "POST", 
       						url: "batchDelRealTimeKingPrice.do", 
       						data: {'nos':checkedList.toString()}, 
       						success: function(result) { 
       							if(result.flag.code == "000000"){
       			            		dm.alert("操作成功！",{
       			            			title:"提示",				//弹窗的标提
       			            			okName:"确定",			//如同alert确定按钮的value
       			            			picClass:"d_succeed",	//这里有三个值 "d_succeed" 显示成功图标,"d_error" 显示错误图标,"d_perfect" 显示信息提示图标,
       			            			notHaveClose:"xxx",
       			            			callback:function(){	//按确定后执行的函数
       			            				window.location.href="getRealTimeKingPriceList.do";
       			            			}
       			            		});
       			              	}else{
       			              		dm.alert("操作失败！");
       			              	}
       						} 
       					}); 
       				}
       			});
       		}
       	});
       	
       }
    
    </script>
	
</head>
<body>
	<div class="systemUser">
		<div class="r_main clearfix ">
			<!--文本框 -->
			<div class="main_title">交易所实时金价</div>
			<div class="main_con clearfix">
				<div style="font-size: 20px;">当前交易实时金价 &nbsp;&nbsp;&nbsp;&nbsp;  <span class="f24 yellow">${pageList.data.statResult.newPrice}</span>元/克</div>
			</div>
			<!--文本框 --END-->
			<!-- 搜索框 -->
			<form action="<%=basePath%>treasury/getRealTimeKingPriceList.do" method="post" id="dataForm">
				<div class="main_con">
					<div class="admin_input clearfix">
						<p>
							实时金价时间：
						  	<input type="text" name="startTime" class="yhgl_input date"  value="${price.startTime}"id="createTime1" onclick="WdatePicker({readOnly:true,maxDate: '#F{$dp.$D(\'createTime2\')}'})" />
							<span class="mr5">至</span>
							<input type="text" name="endTime" class="yhgl_input date"  value="${price.endTime}" id="createTime2" onclick="WdatePicker({readOnly:true,minDate: '#F{$dp.$D(\'createTime1\')}'})" />
				         </p>
						
						<p class="lo_btn">
							<input type="submit" class="search" value="搜索" /> 
							<shiro:hasPermission name="JKGL_JJGL_JYSSSJJ_DC">
							<input name="input" type="button" class="export ml10" value="导出" onclick="exportData('dataForm','exportNowGoldProce.do');"/>
							</shiro:hasPermission>
							<shiro:hasPermission name="JKGL_JJGL_JYSSSJJ_PLSC">
							<a style="margin-left: 10px;" id="batchDel" href="javascript:void(0)" class="btn_cs">批量删除</a>
							</shiro:hasPermission>
							<shiro:hasPermission name="JKGL_JJGL_JYSSSJJ_ASJDSC">
							<a style="margin-left: 10px;" onclick="popDiv('<%=basePath %>treasury/delRealTimeKingPriceByTimeBox.do')" href="javascript:void(0)" class="btn_cs">按时间段删除</a>
							</shiro:hasPermission>
							<a style="margin-left: 10px;" href="<%=basePath%>treasury/getRealTimeKingPriceList.do" class="btn_cs">刷新</a>
						</p>
					</div>
					
					
				</div>
			
			<!--搜索表框  --END-->

			<div class="main_con">
				<div class="menu_bd clearfix">
					<table width="100%" border="0" cellspacing="0" cellpadding="3"
						class="main_table tc" id = "priceTable">
						<tr class="title">
							<td><input type="checkbox" name="allcheckbox" /></td>
							<td align="center">序号</td>
							<td align="center">ID号</td>
							<td align="center">实时金价时间</td>
							<td align="center">金价（元/克）</td>
						</tr>
					</table>

					</div>
					
						<!--分页-->
					<div style="margin-top: 25px;">
						<dim:page url="getRealTimeKingPriceList.do" totalCount="${pageList.data.pageResult.recordCount }" formId="dataForm" showPages="${pageList.data.pageResult.pageSize }"
						curPage="${pageList.data.pageResult.pageIndex }" totalPages="${pageList.data.pageResult.pageTotal }" />
					</div>
					<!--分页  --END-->
			</div>
		</form>
		</div>
	</div>
</body>
<script type="text/javascript">
 
    //弹出框
    function popDiv(url){
 	   $.tbox.popup(url);
    }
 	function openDivPwd(id,loginName){
 		loginNames = encodeURIComponent(encodeURIComponent(loginName));
 		popDiv('<%=basePath %>system/sysuser_modify_pwd.jsp?id='+id+'&ln='+loginNames+'&t=<%=Math.random() %>');
 	}
 </script>
</html>
							