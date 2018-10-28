<%@page import="com.sunyuhan.nsBlog.Dao.signDao"%>
<%@page import="com.sunyuhan.nsBlog.service.ArticleService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>签到</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	String cookiename = "";
	Cookie[] cookies = request.getCookies();
	for(int i = 0;i<cookies.length;i++){
		if(cookies[i].getName().equals("username")){
			cookiename = cookies[i].getValue();
		}
	}
	String moon = request.getParameter("moon");
	int id = new ArticleService().getId(cookiename);
	new signDao().doSign(id, moon);
	Cookie sig = new Cookie("signFlag"+id+"",moon);
	response.addCookie(sig);
	sig.setMaxAge(86400);//24小时有效期
	response.sendRedirect("center.jsp");
%>
</body>
</html>