<%@page import="com.sunyuhan.nsBlog.service.CommentService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>提交评论</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	int artID = Integer.parseInt(request.getParameter("artID"));
	int autID = Integer.parseInt(request.getParameter("autID"));
	String comment = request.getParameter("comment");
	new CommentService().addComment(artID,autID,comment);//被评论文章id，评论用户id，评论内容
	response.sendRedirect("blog.jsp?id="+artID+"");
%>
</body>
</html>