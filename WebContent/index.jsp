<%@page import="com.sunyuhan.nsBlog.func.doGoods"%>
<%@page import="com.sunyuhan.nsBlog.service.CommentService"%>
<%@page import="com.sunyuhan.nsBlog.model.Comment"%>
<%@page import="com.sunyuhan.nsBlog.func.art2Pic"%>
<%@page import="com.sunyuhan.nsBlog.func.Summary"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.sunyuhan.nsBlog.service.ArticleService"%>
<%@page import="com.sunyuhan.nsBlog.model.Article"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>第六博客_记录美好生活</title>
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
	<!-- 3.第三部分 轮播图 -->
	<div class="top">
		<div class="container">
		<div class="list" style=" left:-600px;">
		<%List<Article> picWithArt = new ArticleService().getGoodArt(); 
		int d = 0;
		for(Article pwa:picWithArt){
			d++;
		%> 
			<a href="blog.jsp?id=<%=pwa.getId()%>"><img src="<%=new art2Pic().doArt2Pic(pwa.getId()) %>"></a>
		<%
		if(d==6){
			break;
		}
		}
		%>
		</div>
		<ul class="dots">
			<li index=1 class="active dot"></li>
			<li index=2 class="dot"></li>
			<li index=3 class="dot"></li>
			<li index=4 class="dot"></li>
			<li index=5 class="dot"></li>
		</ul>
	</div>
	<script type="text/javascript" src="js/sowing_js.js"></script>
		<!-- 4.第四部分 首页推荐 -->
		<div class="recommend">
			<table width="100%" height="300" align="center" border="0" style="border-collapse: collapse;">
			<%
				List<Article> sumArt = new Summary().doSummary();
			%>
				<tr ><!-- 第一个推荐文章 -->
					<td align="left" style="padding-left: 10px; padding-right: 10px;
					border-bottom: 1px solid #ccc;border-right: 1px solid #ccc">
						<a href="blog.jsp?id=<%=sumArt.get(0).getId()%>" target="_blank" style="text-decoration:none;">
							<font face="YouYuan" size="5" style="color: #8E388E;">
							<b><%=sumArt.get(0).getTitle()%></b></font>
						</a><br />
						&nbsp;&nbsp;"<%=sumArt.get(0).getContent()%>..."
					</td><!-- 第二个推荐文章 -->
					<td align="left" style="padding-left: 10px; padding-right: 10px;">
					<a href="blog.jsp?id=<%=sumArt.get(1).getId()%>"  target="_blank" style="text-decoration:none;">
						<font face="YouYuan" size="5" style="color: #8E388E;">
						<b><%=sumArt.get(1).getTitle()%></b></font>
					</a><br />
						&nbsp;&nbsp;"<%=sumArt.get(1).getContent()%>..."
					</td>
				</tr>
				<tr><!-- 第三个推荐文章 -->
					<td align="left" style="padding-left: 10px; padding-right: 10px; ">
					<a href="blog.jsp?id=<%=sumArt.get(2).getId()%>" target="_blank" style="text-decoration:none;">
						<font face="YouYuan" size="5" style="color: #8E388E;">
						<b><%=sumArt.get(2).getTitle()%></b></font>
					</a><br />
						&nbsp;&nbsp;"<%=sumArt.get(2).getContent()%>..."
					</td><!-- 第四个推荐文章 -->
					<td align="left" style="padding-left: 10px; padding-right: 10px; border-top: 1px solid #ccc;border-left: 1px solid #ccc">
					<a href="blog.jsp?id=<%=sumArt.get(3).getId()%>" target="_blank" style="text-decoration:none;">
						<font face="YouYuan" size="5" style="color: #8E388E;">
						<b><%=sumArt.get(3).getTitle()%></b></font>
					</a><br />
						&nbsp;&nbsp;"<%=sumArt.get(3).getContent()%>..."
					</td>
				</tr>
			</table>
		</div>
	</div>
	<!-- 5.第五部分 分割线 -->
	<div>
		<HR style="FILTER: alpha(opacity=100,finishopacity=0,style=3)" width="100%" color=gray SIZE=2>
	</div>
	<div class="center">
		<!-- 6.第六部分 左侧热门文章排行 -->
		<div class="hotArt">
			<h3 style="width: 150px">十大热门文章&nbsp;<img alt=hot src="img/hot.png" width="20px" height="20px"></h3>
			<ol>
			<%
				List<Article> artic = new ArticleService().getHotArt();
				for(int i=1;i<artic.size();i++){//从1开始，屏蔽了点击率最高项
					Article article = artic.get(i);
			%>
				<li>
					<div class="haList">
						<a href="blog.jsp?id=<%=article.getId()%>" target="_blank" style="text-decoration: none; color: #8E388E;">
						<font face="FangSong" size="4"><b><%=article.getTitle()%></b></font></a>
					</div>
				</li>
			<%
				if(i==10)break;
				}
			%>
			</ol>
		</div>
		<!-- 7.第七部分 中间选项卡 -->
		<script src="js/tabs1.js" language="javascript" type="text/javascript"></script>
		<script src="js/tabs2.js" language="javascript" type="text/javascript"></script>
		<div id="demo" class="tabs_wrap">
		  <ul class="tabs_list">
		    <li class="curr">热点</li>
		    <li>推荐</li>
		    <li>视觉</li>
		    <li>神评</li>
		  </ul>
		  <div class="tabs_con">
		    <div class="tabs_con_wrap">
		      <div id="tabsMove" class="tabs_move">
       			<div class="one"><!-- 选项卡第一页 -->
       				<div class="oneTandP">
						<h2 style="height: 20px;"><%=artic.get(0).getSort() %></h2>
						<hr width="100px" align="left"/>
						<a href="blog.jsp?id=<%=artic.get(0).getId()%>" target="_blank" style="text-decoration: none; color: red;"><!-- 获得点击率第一的博客 -->
						<font size="6" face="FangSong"><b><%=artic.get(0).getTitle()%></b></font></a>
						<%String path = new art2Pic().doArt2Pic(artic.get(0).getId());%>
						<img alt="pic" src="<%=path %>">
						<div class="oneSu">
						<%Article artSum = new Summary().getSummary(artic.get(0).getId()); %>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<font face="FangSong" size="5">
						“<%=artSum.getContent() %>... ...”
						</font>
					</div>
					</div>
					
				</div>
       			<div class="two"><!-- 选项卡第二页 -->
					<ul>
					<%
						for(int i = 11;i<artic.size();i++){
								Article article = artic.get(i);
					%>
						<li>
							<font face="YouYuan" size="4" style="color: #8B4500;"><b><%=article.getSort()%>&nbsp;&nbsp;|&nbsp;&nbsp;</b></font>
							<a href="blog.jsp?id=<%=article.getId()%>" target="_blank" style="text-decoration: none; color: #8B4500;">
							<font face="YouYuan" size="4"><b><%=article.getTitle()%></b></font></a>
						</li>
					<%
						if(i==25)break;
							}
					%>
					</ul>
				</div>
		        <div class="three"><!-- 选项卡第三页 -->
		        	 <table><!-- 两行表格各三列图片 -->
		        	 <%
		        	 List<Article> goodsArtsWithPic = new ArticleService().getGoodArt();
		        	 Article gawp = null;
		        	 %>
		        	 	<tr>
		        	 	<%
		        	 	for(int k = 0;k<goodsArtsWithPic.size();k++){
		        	 		gawp = goodsArtsWithPic.get(k);
		        	 	%>
		        	 		<td>
		        	 			<div class="table-pic">
		        	 			<img alt="pic" src="<%=new art2Pic().doArt2Pic(gawp.getId()) %>" />
		        	 			</div>
		        	 			<div class="table-title">
		        	 			<a href="blog.jsp?id=<%=gawp.getId() %>" target="_block"><font size="3"><%=gawp.getTitle() %></font></a>
		        	 			</div>
		        	 		</td>
        	 			<%
		        	 		if(k==2){
		        	 			break;
		        	 		}
		        	 	}
	        	 		%>
		        	 	</tr>
		        	 	<tr>
		        	 	<%
		        	 	for(int k = 3;k<goodsArtsWithPic.size();k++){
		        	 		gawp = goodsArtsWithPic.get(k);
		        	 	%>
		        	 		<td>
		        	 			<div class="table-pic">
		        	 			<img alt="pic" src="<%=new art2Pic().doArt2Pic(gawp.getId()) %>" />
		        	 			</div>
		        	 			<div class="table-title">
		        	 			<a href="blog.jsp?id=<%=gawp.getId() %>" target="_block"><font size="3"><%=gawp.getTitle() %></font></a>
		        	 			</div>
		        	 		</td>
        	 			<%
		        	 		if(k==5){
		        	 			break;
		        	 		}
		        	 	}
	        	 		%>
		        	 	</tr>
		        	 </table> 
		        </div>
		        <div class="four"><!-- 选项卡第四页 -->
				<%
					List<Comment> hotCom = new CommentService().getHotComment();
					int h = 0;
				 %>
					<ol>
					<%for(Comment comment:hotCom){
						h++;
					%>
					<li>
						<font face="YouYuan" size="4" color="#CD853F"><b>“<%=comment.getComment() %>”</b></font><br /><br /><br />
						<font face="FangSong" size="3"><%=comment.getAutherName() %></font>&nbsp;&nbsp;&nbsp;&nbsp;评论了&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="blog.jsp?id=<%=comment.getArtID()%>" target="_blank" style="text-decoration: none; color: black;">
						<font face="FangSong" size="3"><%=comment.getArtTitle() %></font></a>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<b style="color: red">（<%=new doGoods().getGoods(comment.getId()) %>）赞</b>
						<hr width="90%" align="left"/>
					</li>
					<%
					if(h==4){
						break;
					}
					}
					%>
					</ol>
		        </div>
		      </div>
		    </div>
		  </div>
		</div><!-- 选项卡结束 -->
	</div>
	<!-- 8.第八部分 两个banner -->
	<div class="banner">
		<img src="img/banner01.png" />
	</div>
	<div class="banner2">
		<img src="img/banner02.png" />
	</div>
	<!-- 9.第九部分 文章列表 -->
	<div class="bottom">
		<div class="pageArtList">
			<h3>最新发布</h3>
			<ul>
			<%
				List<Article> articles = new ArticleService().getNews();
					int i = 0;
					for(Article article:articles){
					i++;
			%>
				<li><a href="blog.jsp?id=<%=article.getId()%>" target="_blank" style="text-decoration: none; color: black;">
							<font face="YouYuan" size="3" class="newArts"><%=article.getTitle()%></font></a></li>
			<%
			if(i>11) break;
			}
			%>
			</ul>
		</div>
		<div class="hotAut">
			<h3 style="height: 45px">热门作者排行榜</h3>
			<ol>
			<%
			List<Article> articles2 = new ArticleService().getHotAut();
				int size = articles2.size();
				if(articles2.size()<8){//热门作者不足时，使用空对象填充
					for(int k = 0;k < 8-size;k++){
						Article article = new Article();
						article.setAuthorID(0);
						articles2.add(article);
					}
				}
				int j = 0;
				for(Article article:articles2) {//如果id为0,则用虚席以待替代超链接
					if(article.getAuthorID()==0){
			%>
				<li>
				<div class="autList">
					<font face="YouYuan" size="3">虚席以待</font>
				</div></li>
			<%
				j++;
				}else{
				j++;
			%>
			<li>
			<div class="autList">
				<a href="allBlog.jsp?name=<%=article.getAuthorName()%>" target="_blank" style="text-decoration: none; color: red;">
				<font face="YouYuan" size="3"><%=article.getAuthorName()%></font></a>
			</div></li>
			<%
				}
				if(j==8) break;
			}
			%>
			</ol>
		</div>
		<div class="newComs">
			<h3 style="height: 33px">最新评论</h3>
			<%
				List<Comment> comments = new CommentService().getNewComment();
				int k = 0;
			 %>
				<ul>
				<%for(Comment comment:comments){
					k++;
				%>
				<li>
					<font face="YouYuan" size="4">“<%=comment.getComment() %>”</font><br />
					<font face="FangSong" size="3"><%=comment.getAutherName() %></font>&nbsp;&nbsp;评论了&nbsp;&nbsp;
					<a href="blog.jsp?id=<%=comment.getArtID()%>" target="_blank" style="text-decoration: none; color: black;">
					<font face="FangSong" size="3"><%=comment.getArtTitle() %></font></a>
					<hr width="90%" align="left"/>
				</li>
				<%
				if(k==4){
					break;
				}
				}
				%>
				</ul>
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
		Copyright <a href="about.jsp" target="_blank" style="text-decoration: none; color: black;">@</a> 2018-2020 第六组 版权所有
	</div>
</div>

</body>
</html>