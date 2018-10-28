<%@page import="com.sunyuhan.nsBlog.service.ArticleService"%>
<%@page import="com.sunyuhan.nsBlog.model.Article"%>
<%@page import="java.util.List"%>
<%@page import="com.sunyuhan.nsBlog.Dao.centerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>全部博客_第六博客</title>
<link rel="stylesheet" href="css/style_center.css"/>
<link rel="stylesheet" href="css/style_allBlog.css"/>
<link rel="shortcut icon" href="img/logo_title.ico"/>
</head>
<body>
<!-- 1.第一部分 logo -->
<div class="allPage">
	<div>
		<div class="logo">
			<a href="index.jsp"><img src="img/logo.jpg"  height="90%"/></a>
		</div>
		<div class="logo" style="height: 40px;">
			<iframe id="fancybox-frame" name="fancybox-frame1538998124257" frameborder="0" scrolling="no" hspace="0" 
			src="http://i.tianqi.com/index.php?c=code&a=getcode&id=35&h=55&w=200"></iframe>
		</div>
		<div class="logo">
			<h4 style="display: inline;color: black;">欢迎您！</h4>
			<%
				String cookiename = "";
				Boolean flag = false;
				Cookie[] cookies = request.getCookies();
				for(int i = 0;i<cookies.length;i++){
					if(cookies[i].getName().equals("username")){
						cookiename = cookies[i].getValue();
			%>
				<a href="center.jsp" id="link"><%=cookiename%></a>
				<a href="Cancellation.jsp" style="text-decoration: none">[注销]</a>
			<%
				flag = true;
					break;
					}
				}
				if(!flag){
			%>
					<a href="login.jsp" id="link">登录</a>
					<a href="regs.jsp" id="link">注册</a>
				<%
					}
				%>
		</div>
	</div>
	<div style="clear: both;"></div><!-- 清除浮动 -->
	<div style="background-color:#CD853F;" class="nav">
		<a href="index.jsp" class="amenu">&nbsp;&nbsp;首页</a>
		<a href="blogSort.jsp?sort=食尚主义" class="amenu">&nbsp;&nbsp;食尚主义</a>
		<a href="blogSort.jsp?sort=真实故事" class="amenu">&nbsp;&nbsp;真实故事</a>
		<a href="blogSort.jsp?sort=社会时评" class="amenu">&nbsp;&nbsp;社会时评</a>
		<a href="blogSort.jsp?sort=旅游攻略" class="amenu">&nbsp;&nbsp;旅游攻略</a>
		<a href="blogSort.jsp?sort=科幻小说" class="amenu">&nbsp;&nbsp;科幻小说</a>
		<a href="blogSort.jsp?sort=星座指南" class="amenu">&nbsp;&nbsp;星座指南</a>
		<a href="blogSort.jsp?sort=资本市场" class="amenu">&nbsp;&nbsp;资本市场</a>
		<a href="blogSort.jsp?sort=明星日志" class="amenu">&nbsp;&nbsp;明星日志</a>
		<a href="blogSort.jsp?sort=服饰潮流" class="amenu">&nbsp;&nbsp;服饰潮流</a>
		<a href="blogSort.jsp?sort=校园生活" class="amenu">&nbsp;&nbsp;校园生活</a>
		<a href="blogSort.jsp?sort=军事热点" class="amenu">&nbsp;&nbsp;军事热点</a>
		<a href="blogSort.jsp?sort=八字命理" class="amenu">&nbsp;&nbsp;八字命理</a>
		<a href="blogSort.jsp?sort=其他分类" class="amenu">&nbsp;&nbsp;其他分类</a>
	</div>
	
	<div class="allArtBg">
		<div class="allArt">
			<h3 style="color: black"><font face="FangSong" size="5"><i>全部博客</i></font></h3>
			<hr width="500px" align="left"/>
			<ol>
				<%
					String aname = request.getParameter("name");
						List<Article> artic = new ArticleService().getHisArt(aname);
						int i = 0;
						for(Article article:artic){
							i++;
				%>
						<li><a href="blog.jsp?id=<%=article.getId() %>" style="text-decoration: none; color: black;"><font face="FangSong" size="5"><b><%=article.getTitle() %></b></font></a></li>
				<%
				}	
					%>
			</ol>
		</div>
	</div>
			
	
	<div style="clear: both;"></div><!-- 清除浮动 -->
	<hr />
	<div class="end" style="text-align: center;">
		<a href="#" id="link">关于我们</a>|
		<a href="#" id="link">联系我们</a>|
		<a href="#" id="link">招贤纳士</a>|
		<a href="#" id="link">友情链接</a>|
		<a href="#" id="link">关于网站</a>|
		<a href="#" id="link">免责声明</a>|
		<a href="#" id="link">服务声明</a>|
		<a href="#" id="link">广告声明</a>
		<br />
		Copyright @ 2018-2020 第六组 版权所有
	</div>
</div>
</body>
</html>