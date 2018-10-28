<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.sunyuhan.nsBlog.Dao.writeBlogDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>博文提交结果</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	String title = request.getParameter("title");
	String content = request.getParameter("container");
	String sort = request.getParameter("sort");
	String cookiename = "";
	Cookie[] cookies = request.getCookies();
	if(sort.equals("")){
		sort = "其他分类";
	}
	if(!(cookies==null))
	for(int i = 0;i<cookies.length;i++){
		if(cookies[i].getName().equals("username")){
			cookiename = cookies[i].getValue();
			break;
		}
	}
	String result = new writeBlogDao(sort,cookiename,title,content).saveBlog();
	if(result.equals("ok")){
		out.print("发布成功！");
		%>
		<a href="center.jsp">返回个人中心</a>
		<%
	}
	else{
		out.print("博客发布失败！请检查博客内容！");
		%>
		<a href="writeBlog.jsp">返回</a>
		<%
	}
	
%>
</body>
</html>