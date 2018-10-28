<%@page import="com.sunyuhan.nsBlog.Dao.userRegDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>处理注册信息</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String email = request.getParameter("email");
	String sex = request.getParameter("sex");
	String result = new userRegDao(username,password,email,sex).docreate();
	switch(result){
		case "already exist":
			out.print("用户名已存在！请更换用户名！");
			%>
			<a href="regs.jsp">重新注册</a>
			<a href="index.jsp">返回主页</a>
			<%
			break;
		case "ok":
			%>
			<a href="login.jsp">注册成功！点此登录</a>
			<%
			break;
	}
%>
</body>
</html>