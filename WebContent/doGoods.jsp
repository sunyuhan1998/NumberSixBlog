<%@page import="com.sunyuhan.nsBlog.func.doGoods"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>点赞</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	String goodsCom = request.getParameter("goodsCom");
	int gcNum = Integer.parseInt(goodsCom);//获取点赞的评论id
	new doGoods().addGoods(gcNum);
	/* Boolean flag = false;//是否点过赞的标志
	Cookie[] cookies = request.getCookies();
	if(!(cookies==null))
		for(int i = 0;i<cookies.length;i++){
			if(cookies[i].getName().equals("clickGoods")){
				System.out.println("cookie值为"+cookies[i].getValue());
				flag = true;
			}
		}
		if(flag = true){
			//证明已经点过赞，做减赞处理
			new doGoods().deGoods(gcNum);
			//清掉cookie
			Cookie[] decookies = request.getCookies();
			for(int i = 0;i<cookies.length;i++){
				if(cookies[i].getName().equals("clickGoods"+goodsCom+"")){
					cookies[i].setMaxAge(0);
					response.addCookie(cookies[i]);
				}
			}
		}
		else{
			//证明未赞，做加赞处理
			new doGoods().addGoods(gcNum);
			//添加cookie
			String clickGoods = "1";
			Cookie gc = new Cookie("clickGoods"+goodsCom+"",clickGoods);
			response.addCookie(gc);
			gc.setMaxAge(86400);//允许重复赞的周期为24小时
		} */
	
%>
</body>
</html>