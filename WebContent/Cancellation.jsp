<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注销</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	Cookie[] cookies = request.getCookies();
	for(int i = 0;i<cookies.length;i++){
		if(cookies[i].getName().equals("username")) {
		cookies[i].setMaxAge(0);
		response.addCookie(cookies[i]);
		}
	}
	response.sendRedirect("login.jsp");
%>
</body>
</html>