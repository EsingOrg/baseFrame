$(function(){
	//菜单集
	$(".til").click(function(){
		
		var that=$(this);
		$obj=$(this).next(".con");
		if($obj.css("display")=="none"){
			$obj.css("display","block");
			that.find("span").attr("class","ico1");
			that.closest(".cell").siblings().find(".con").css("display","none");
			that.closest(".cell").siblings().find(".til").find("span").attr("class","ico2");
		}else{
			that.find("span").attr("class","ico2");
			$obj.css("display","none");
		}
	});
	
	
	
	
	//菜单
	$(".con li").click(function(){
		var obj = $(this);
		obj.siblings().removeAttr("class");
		obj.closest(".con").closest(".cell").siblings().find(".con").find("li").removeAttr("class");
		obj.attr("class","hover");
	});
	
	$(".l_ico").live("click",function(){
		$(".l_main").css("display","none");
		$(this).attr("class","l_ico1");
		parent.frames["bigFram"].cols= "10,*";
	});
	
	$(".l_ico1").live("click",function(){
		$(".l_main").css("display","block");
		$(this).attr("class","l_ico");
		parent.frames["bigFram"].cols= "210,*";
	});
});

