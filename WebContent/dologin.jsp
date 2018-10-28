<%@page import="com.sunyuhan.nsBlog.service.ArticleService"%>
<%@page import="com.sunyuhan.nsBlog.Dao.signDao"%>
<%@page import="com.sunyuhan.nsBlog.Dao.userLoginDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>处理登录信息</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String result = new userLoginDao(username,password).doLogin();
	switch(result){
		case "password error":
			out.print("用户名或密码输入错误！请重新");
			%>
			<a href="login.jsp">登录</a>
			<a href="index.jsp">返回主页</a>
			<%
			break;
		case "ok":
			Cookie un = new Cookie("username",username);
			response.addCookie(un);
			un.setMaxAge(10800);//3小时有效期
			//根据cookie做签到是否过期的判定
			Boolean flag = false;
			int id = new ArticleService().getId(username);
			Cookie[] cookies = request.getCookies();
			for(int i = 0;i<cookies.length;i++){
				if(cookies[i].getName().equals("signFlag"+id+"")){
					flag = true;
				}
			}
			if(flag == false){
				new signDao().deSign(new ArticleService().getId(username));
			}//
			response.sendRedirect("index.jsp");
			break;
	}
%>
</body>
</html>