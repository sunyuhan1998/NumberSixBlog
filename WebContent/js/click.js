$(document).ready(function()
{
$('body').on("click",'.heart',function()
{
	var A=$(this).attr("id");
	var B=A.split("like");
	var messageID=B[1];
	var C=parseInt($("#likeCount"+messageID).html());
	var comid = $("#comid"+messageID).val();
	$(this).css("background-position","")
	var D=$(this).attr("rel");
	if(D === 'like') 
	{      
	$("#likeCount"+messageID).html(C+1);
	$(this).addClass("heartAnimation").attr("rel","unlike");
	var url = "doGoods.jsp";
	var data = {goodsCom:comid};
	$.ajax({
		type : "get",
		async : false,
		url : url,
		data : data,
		timeout:1000,
	});
	}
	else
	{
	$("#likeCount"+messageID).html(C-1);
	$(this).removeClass("heartAnimation").attr("rel","like");
	$(this).css("background-position","left");
	var url = "deGoods.jsp";
	var data = {goodsCom:comid};
	$.ajax({
		type : "get",
		async : false,
		url : url,
		data : data,
		timeout:1000,
	});
	}
});
});