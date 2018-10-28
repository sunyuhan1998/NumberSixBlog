<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>写博客_第六博客</title>
<link rel="stylesheet" href="css/style_index.css"/>
<link rel="stylesheet" href="css/style_writeBlog.css"/>
<link rel="shortcut icon" href="img/logo_title.ico"/>
<script type="text/javascript" src="ueditor/ueditor.config.js"></script>  
<script type="text/javascript" src="ueditor/ueditor.all.js"></script>  
<link rel="stylesheet" href="ueditor/themes/default/css/ueditor.css"> 
<script type="text/javascript" charset="utf-8"  
    src="ueditor/lang/zh-cn/zh-cn.js">
</script>
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
	<!-- 2.第二部分 导航栏  -->
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
	<div class="wblog">
		<div class="wblogn">
			<form action="dowriteBlog.jsp" method="post">
				<div class="blogTitle" align="center">
					<input type="text" name="title" class="titlestyle"  placeholder="请输入博文标题" />
				</div>
			
				<div class="editor" align="center">
					<textarea id="container" name="container" style="width: 850px; height: 430px; margin: 0 auto;">
					</textarea> 
					<script type="text/javascript">  
						UE.getEditor("container");  
					</script>
				</div>
				<div class="sort">
					<h3><font face="FangSong" size="5" color="white">分类</font></h3>
					<select name="sort" class="shortselect">
						<option value="">--请选择</option>
						<option value="其他分类">--其他分类</option>
						<option value="食尚主义">--食尚主义</option>
						<option value="真实故事">--真实故事</option>
						<option value="社会时评">--社会时评</option>
						<option value="旅游攻略">--旅游攻略</option>
						<option value="科幻小说">--科幻小说</option>
						<option value="星座指南">--星座指南</option>
						<option value="资本市场">--资本市场</option>
						<option value="明星日志">--明星日志</option>
						<option value="服饰潮流">--服饰潮流</option>
						<option value="校园生活">--校园生活</option>
						<option value="军事热点">--军事热点</option>
						<option value="八字命理">--八字命理</option>
					</select>
				</div>
				<div class="saveButton">
					<button id="fabu" name="fabu" class="saveButton-button">发布</button>
				</div>
			</form>
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