<%@page import="com.sunyuhan.nsBlog.Dao.signDao"%>
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
<title>个人中心_第六博客</title>
<link rel="stylesheet" href="css/style_center.css"/>
<link rel="stylesheet" href="css/style_index.css"/>
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
	<div class="left">
		<div class="left-cont">
		<%
			int id = 0;
		%>
		<%
			int alsig = 0;
		%><!-- 接收数据库中的签到状态 -->
		<%
			String as = "";
		%><!-- 实际展示的签到状态 -->
		<%
			String sex = "";
		%>
		<%
			String regtime = "";
		%>
		<%
			String email = "";
		%>
		<%
			centerDao cd = new centerDao();
				id = cd.getId(cookiename);
				alsig = cd.getAlsig(cookiename);
				if(alsig==0){
			as = "否";
				}else as = "是";
				sex = cd.getSex(cookiename);
				regtime = cd.getRegtime(cookiename);
				email = cd.getEmail(cookiename);
		%>
			<h2>个人信息</h2>
			<hr width="90%" align="left"/>
			<table  width="100%" height="100px" >
				<tr align="left">
					<td><h4>id</h4></td>
					<td><h4><%=id%></h4></td>
				</tr>
				<tr align="left">
					<td><h4>昵称</h4></td>
					<td><h4><%=cookiename%></h4></td>
				</tr>
				<tr align="left">
					<td><h4>性别</h4></td>
					<td><h4><%=sex%></h4></td>
				</tr>
				<tr align="left">
					<td><h4>注册时间</h4></td>
					<td><h4><%=regtime%></h4></td>
				</tr>
				<tr align="left">
					<td><h4>邮箱</h4></td>
					<td><h4><%=email%></h4></td>
				</tr>
				<tr align="left">
					<td><h4>是否签到</h4></td>
					<td><h4><%=as%></h4></td>
				</tr>
			</table>
			<hr width="90%" align="left"/>
		</div>
	</div>
	<div class="right">
		<div class="right_c">
			<div class="signAll">
			<%
			Boolean signFlag = false;
			Cookie[] cookies2 = request.getCookies();
			for(int i = 0;i<cookies.length;i++){
				if(cookies[i].getName().equals("signFlag"+id+"")){
					signFlag = true;
				}
			}
			if(signFlag == false){
			%>
				<p>&nbsp;&nbsp;&nbsp;&nbsp;<font face="FangSong" size="5" color="black">签到——今天心情怎么样？</font></p>
				<div class="sign">
					<iframe align="center" width="100%" height="100%" src="sign.html" frameborder="no"  scrolling="no"></iframe>
				</div>
			<%
			}else{
				int pathState = new signDao().getSign(new ArticleService().getId(cookiename));
				String picPath = "";
				switch(pathState){
				case 1:
					picPath = "img/feichanghao.jpg";
					break;
				case 2:
					picPath = "img/yiban.jpg";
					break;
				case 3:
					picPath = "img/zaogao.jpg";
					break;
				default:
					break;
				}
			%>
			<img alt="signPic" src="<%=picPath %>">
			<%
			}
			%>
			
			</div>
			<hr />
				<a href="writeBlog.jsp" class="rc1" style="text-decoration: none;">
				<h3 align="center"><font face="FangSong" size="6">-写博客-</font></h3>
				</a>
			<hr />
			<div class="hisArt">
				<h3 style="color: white">历史博客</h3>
			<ul>
			<%
				List<Article> artic = new ArticleService().getHisArt(cookiename);
				int i = 0;
				for(Article article:artic){
					i++;
			%>
					<li><a href="blog.jsp?id=<%=article.getId() %>" target="_blank" style="text-decoration: none; color: white">
						<font face="FangSong" size="4"><b><%=article.getTitle() %></b></font></a></li>
			<%
				if(i>=6) break;
			}	
				%>
			</ul>
			<p>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="allBlog.jsp?name=<%=cookiename%>" class="rc1" target="_blank" style="text-decoration: none;">
			<font face="FangSong" size="4" color="yellow">全部博客</font>
			</a></p>
			</div>
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