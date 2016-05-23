<%@ page language="java" pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/common/commHeader.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>分配权限</title>
</head>

<body>
<!---------------右边内容开始--------------->
   <div class="r_main">
      <div class="main_con">
        <div class="part">
          <form action="updateRoleFunction.do" method="post" id="updateForm">
            <input type="hidden" value="${role.id}" name="roleId">
	    	<input type="hidden" id="funIds" name="funIds">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="guiz_table">
              <tr>
                 <td class="left_bg" align="center" style="width:150px;"><input id="all" type="checkbox" class="mr5" >所有权限<br/>&nbsp;</td>
                 <td>
                  <ul class="inf_con clearfix p20">
                    <li><div class="til" style="width:100px;">用户组名称：</div><div style="width:400px;" class="info"><input name="" value="${role.name}" type="text" class="yhgl_input w300" /></div></li>
                    <li><div class="til" style="width:100px;">用户组描述：</div><div style="width:400px;" class="info"><input name="" value="${role.desc}" type="text" class="yhgl_input w300" /></div></li>
                    <li>权限管理：勾选后将获得相应的操作权限</li>
                   </ul>                 	
                  </td>
               </tr>
               <c:forEach items="${funcInfo.pageResult}" var="modOne" varStatus="vsOne">
               <tr>
                 <td class="left_bg ico" align="center"><input type="checkbox" name="oneBox" class="mr5" >${modOne.name }<i class="i" onclick="fold();"></i></td>
                 <td>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="con_table">
                    <c:forEach items="${modOne.childList}" var="modTwo" varStatus="vsTwo">
                      <tr>
                    	<td>
                    	 <ul class="table_wh">
						   <li>
						     <div class="title orange f16" ><input name="twoBox" type="checkbox" > ${modTwo.name} </div>
						       <c:forEach items="${modTwo.childList}" var="modThree" varStatus="vsThree">
						         <div class="clearfix con" style="margin-bottom:8px;">
								   <div class="til"><input name="threeBox" type="checkbox" value="${modThree.id}"><span style="font-weight:bold;"> ${modThree.name} </span></div>
								   <div class="info">
								     <dl>
								       <c:forEach items="${modThree.functionList}" var="fun" varStatus="vsThree">
								       	  <c:if test="${fun.desc eq 'HEADMENU'}">
								          <input type="checkbox" class="headMenu" style="display:none;" name="functionList" ${fun.roleId > 0 ? "checked" : ""} value="${fun.id }" >
								          </c:if>
								          <c:if test="${fun.desc ne 'HEADMENU'}">
								          <dd><input type="checkbox" name="functionList" ${fun.roleId > 0 ? "checked" : ""} value="${fun.id }" >${fun.name}</dd>
								          </c:if>
								        </c:forEach>
								     </dl>								            
								    </div>
							       </div>
							     </c:forEach>
						     </li>
					        </ul>
                    	   </td>
                    	  </tr>
                    	</c:forEach>
                    	</table>
 					</td>
                  </tr>
                  </c:forEach>
                </table>
              </form>
         </div>
       <div class="btn"><a href="javascript:void(0)" onclick="update();" class="btn_cs">确认</a><a href="javascript:void(0)" onclick="location.href='sysRoleList.do'" class="btn_cs ml20">返回</a></div>
    </div>
</div>
<!---------------右边内容结束--------------->

    <script type="text/javascript">
    $(function(){
    	setAll();
    	//折叠、展开方法
    	$(":checkbox").not("#all").click(function(){
    		setAll();
    	});
    	
    });
    //折叠按钮点击事件
    function fold(){
    	//点击til
		//$(this).next().slideToggle("slow,10");//当前的下一个显示或隐藏
		that=$(this).closest("td");
		that.next().slideToggle();//当前的下一个显示或隐藏
		if(that.hasClass("up")){//如果有UP的样式
			that.removeClass("up");//就移除
		}else{
			that.addClass("up");//如果没有就加上
		}
	  }
    
        //绑定全选，取消全选事件
	    $("#all").click(function(){
	    	var allObj = $("#all");
			var checkObjs = $(":checkbox").not("#all");
			if(allObj.attr("checked")) {
				checkObjs.attr("checked", "checked");
			} else {
				checkObjs.removeAttr("checked");
			}
	    });
	    
	    $("[name=twoBox]").click(function(){
	    	var myCheckbox=$(this).closest("div").siblings().find(":checkbox");
	    	if($(this).attr("checked")){
	    		myCheckbox.attr("checked","checked"); 
	    	}else{
	    		myCheckbox.removeAttr("checked");
	    	}
	    	//20151113--start
	    	//end
	    	
	    });
	    
	    $("[name=threeBox]").click(function(){
	    	var myCheckbox=$(this).closest("div").next().find(":checkbox");
	    	if($(this).attr("checked")){
	    		myCheckbox.attr("checked","checked"); 
	    	}else{
	    		myCheckbox.removeAttr("checked");
	    	}
	    });
	    
	    $("[name=oneBox]").click(function(){
	    	var myCheckbox=$(this).closest("td").next().find(":checkbox");
	    	if($(this).attr("checked")){
	    		myCheckbox.attr("checked","checked"); 
	    	}else{
	    		myCheckbox.removeAttr("checked");
	    	}
	    });
	    
	    function setAll(){
		    //设置第三级的全选按钮
		    $("[name=threeBox]").each(function(){
		    	var myCheckbox=$(this).closest("div").next().find(":checkbox").not(".headMenu");
		    	var isFull=false;//是否存一个被选中
		    	myCheckbox.each(function(){
		    		if ($(this).attr("checked")){
		    			isFull=true;
		    			return true;
		    		}
		    	});
		    	if(isFull){
		    		$(this).attr("checked","checked");
		    	}else{
		    		$(this).removeAttr("checked");
		    	}
		    });
		    
		    //设置第二级的全选按钮
		    $("[name=twoBox]").each(function(){
		    	var myCheckbox=$(this).closest("div").siblings().find("[name=threeBox]:checkbox");
		    	var isFull=false;
		    	myCheckbox.each(function(){
		    		if ($(this).attr("checked")){
		    			isFull=true;
		    			return true;
		    		}
		    	});
		    	if(isFull){
		    		$(this).attr("checked","checked");
		    	}else{
		    		$(this).removeAttr("checked");
		    	}
		    });
		    
		    //设置第一级的全选按钮
		    $("[name=oneBox]").each(function(){
		    	var myCheckbox=$(this).closest("td").next().find("[name=twoBox]:checkbox");
		    	var isFull=false;
		    	myCheckbox.each(function(){
		    		if ($(this).attr("checked")){
		    			isFull=true;
		    			return true;
		    		}
		    	});
		    	if(isFull){
		    		$(this).attr("checked","checked");
		    		$(this).closest("td").next().find(".headMenu").attr("checked","checked");;
		    	}else{
		    		$(this).removeAttr("checked");
		    		$(this).closest("td").next().find(".headMenu").removeAttr("checked");
		    	}
		    });
		    
		    $("#all").each(function(){
			    var isFull=false;
			    $("[name=oneBox]").each(function(){
			    	if ($(this).attr("checked")){
			    		isFull=true;
			    		return true;
			    	}
			    });
		    	if(isFull){
		    		$("#all").attr("checked","checked"); 
		    	}else{
		    		$(this).removeAttr("checked");
		    	}
		    });
	    
	    }
	    
	    function update(){
	    	var ids = new Array();
  			var checkes = $("[name=fun]:checkbox").not("#all");
  			var index = 0;
  			for(var i = 0; i < checkes.length; i++){
  				if(checkes[i].checked){
  					ids[index] = checkes[i].value;
  					index++;
  				}
  			}
  			$("#funIds").val(ids);
  			$("#updateForm").submit();
	    }
	    
	    
    </script>

</body>
</html>