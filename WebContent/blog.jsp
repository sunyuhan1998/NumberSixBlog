<%@page import="com.sunyuhan.nsBlog.func.doGoods"%>
<%@page import="com.sunyuhan.nsBlog.service.CommentService"%>
<%@page import="com.sunyuhan.nsBlog.model.Comment"%>
<%@page import="java.util.List"%>
<%@page import="com.sunyuhan.nsBlog.model.Clicks"%>
<%@page import="com.sunyuhan.nsBlog.model.Article"%>
<%@page import="com.sunyuhan.nsBlog.service.ArticleService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	//博文展示的通用页面，只需要上一个jsp传递文章id就可以做内容展示
int id = Integer.parseInt(request.getParameter("id"));
Article article = new ArticleService().getArtInfo(id);//获得文章对象
new Clicks(id).addClicks();//增加点击量
%>
<title><%=article.getTitle()%>_第六博客</title>
<link rel="stylesheet" href="css/style_index.css"/>
<link rel="stylesheet" href="css/style_blog.css"/>
<link rel="stylesheet" href="css/style_Goods.css">
<link rel="shortcut icon" href="img/logo_title.ico"/>
<script src="js/jquery-1.11.0.min.js" type="text/javascript"></script>
</head>
<body>
<!-- 1.第一部分 logo -->
<div class="allPage">
	<div>
		<div class="logo">
			<a href="index.jsp"><img src="img/logo.jpg"  height="90%"/></a>
		</div>
		<div class="logo" style="height: 40px;">
			<iframe id="fancybox-frame" name="fancybox-frame1538998124257" frameborder="0" scrolling="no" hspace="0" src="http://i.tianqi.com/index.php?c=code&a=getcode&id=35&h=55&w=200"></iframe>
		</div>
		<div class="logo">
			<h4 style="display: inline;">欢迎您！</h4>
			<%
			String cookiename = "";
			Boolean flag = false;
			Cookie[] cookies = request.getCookies();
			if(!(cookies==null))
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
	<!-- 2.第二部分 banner -->
	<div style="background-color:#CD853F; height: 132px;">
		<img alt="banner01" src="img/blogBanner01.gif" width="100%"/>
	</div>
	<div class="blog">
		<!-- 标题 -->
		<div class="blogTitle">
			<font face="FangSong" size="6" color="black" ><b><%=article.getTitle()%></b></font>
		</div>
		<!-- 文章信息 -->
		<div class="blogInfo">
			<div class="aut">
				<font face="SimSun" color="black">作者：<%=article.getAuthorName() %></font>
			</div>
			<div class="clicks">
				<font face="SimSun" color="black">点击量：<%=article.getClicks() %></font>
			</div>
			
			<div class="time">
				<font face="SimSun" color="black">发布时间:<%=article.getTime() %></font>
			</div> 
		</div>
		<hr width="85%"/>
		<!-- 正文 -->
		<div class="cont">
			<font face="KaiTi" size="5" color="black"><%=article.getContent() %></font>
		</div>
		<hr width="85%"/>
		<!-- 评论功能区 -->
		<div class="comment">
		<%
		int comAutId = new ArticleService().getId(cookiename);
		%>
			<form action="doComment.jsp?autID=<%=comAutId %>&artID=<%=id %>" method="post">
				<textarea style="width: 80%; height: 100px" name="comment" placeholder="评论几句" /></textarea>
				<input class="com-button"  type="submit" value="评论"/>
			</form>
		</div>
		<div class="comment-list">
			<p><font size="4"><b>热门评论</b></font></p>
			<hr width="10%" align="left"/>
			<%
			List<Comment> comments = new CommentService().getComment(id);
			int goods = new doGoods().getGoods(id);
			int i = 0;
			int j = 1;
			for(Comment comment:comments){
				i++;
				int comid = comment.getId();
			%>
			<div class="comInfo">
			<input type="hidden" value="<%=comid %>" id="comid<%=i %>">
			<p><%=comment.getComment() %></p><br />
				<div id="container">
					<div class="feed" id="feed<%=i %>">
					<div class="heart " id="like<%=i %>" rel="like"></div>
					<div class="likeCount" id="likeCount<%=i %>"><%=new doGoods().getGoods(comid) %></div>
					</div>
				</div>
				<b style="width: 60%; float: left;padding-top: 50px"><%=j %>楼&nbsp;&nbsp;——&nbsp;&nbsp;<%=comment.getAutherName() %></b>
			</div>
			
			<hr width="60%" align="left"/>
			<%
			j++;
			if(i==5){
				break;
			}
			}
			%>
			<script src="js/click.js" type="text/javascript"></script>
		</div>
	</div>
	<div class="ret_Bg">
		<div class="ret_Top"><a href="#">返回顶部</a></div>
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