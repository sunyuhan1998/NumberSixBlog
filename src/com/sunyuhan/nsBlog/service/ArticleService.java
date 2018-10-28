package com.sunyuhan.nsBlog.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sunyuhan.nsBlog.Dao.BaseDao;
import com.sunyuhan.nsBlog.model.Article;

/**
 * @author sunyuhan
 *
 * 2018年10月12日
 * 
 * 文章类的业务逻辑操作
 * 包括各种页面对文章内容信息的查询功能
 * 
 */
public class ArticleService extends BaseDao{
	//通过用户名获得id
	public int getId(String cname) {
		int id = 0000;
		String name = cname;
		String sql = "SELECT id FROM userdata WHERE username='"+name+"'";
		try {
			ResultSet rs = doBaseDao().executeQuery(sql);
			while(rs.next())
			id = rs.getInt("id");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return id;
	}
	//通过id获得用户名
	public String getName(int id) {
		String name = "";
		String sql = "SELECT username FROM userdata WHERE id='"+id+"'";
		try {
			ResultSet rs = doBaseDao().executeQuery(sql);
			while(rs.next())
			name = rs.getString("username");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return name;
	}
	/**
	 * 用于个人中心页面右侧展示历史文章列表
	 */
	public List<Article> getHisArt(String username) {
		int aid = getId(username);
		List<Article> articles = new ArrayList<Article>();
		String sql = "SELECT * FROM artdata WHERE authorID="+aid+" ORDER BY id DESC";
		try {
			ResultSet rs = doBaseDao().executeQuery(sql);
			while(rs.next()) {
				Article article = new Article();
				article.setId(rs.getInt("id"));
				article.setTitle(rs.getString("title"));
				articles.add(article);
			}
				
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return articles;
	}//
	/**
	 * 以下两个方法用于blog页面展示博客内容，首页热点和评论功能也间接调用了这一方法
	 */
	public String getAut(int artID){
		int autID = 0;
		String autName = "";
		ResultSet rs;
		try {
			rs = doBaseDao().executeQuery("SELECT authorID FROM artdata WHERE id="+artID+"");
			while(rs.next())
				autID = Integer.parseInt(rs.getString("authorID"));
			rs = doBaseDao().executeQuery("SELECT username FROM userdata WHERE id="+autID+"");
			while(rs.next())
				autName = rs.getString("username");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return autName;
	}
	public Article getArtInfo(int artID) {
		String sql = "SELECT * FROM artdata WHERE id="+artID+"";
		Article article = null;
		String aut = "";
		aut = getAut(artID);
		try {
			ResultSet rs = doBaseDao().executeQuery(sql);
			while(rs.next()) {
				article = new Article();
				article.setAuthorName(aut);
				article.setClicks(rs.getInt("clicks"));
				article.setTime(rs.getString("time"));
				article.setSort(rs.getString("sort"));
				article.setTitle(rs.getString("title"));
				article.setContent(rs.getString("content"));
			}
				
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return article;
	}//
	/**
	 * 以下方法用于主页获取热门文章的id和标题，以点击率为依据
	 */
	public List<Article> getHotArt() {
		String sql = "SELECT * FROM artdata ORDER BY clicks DESC";
		List<Article> articles = new ArrayList<Article>();
		Article article = null;
		try {
			ResultSet rs = doBaseDao().executeQuery(sql);
			while(rs.next()) {
				article = new Article();
				article.setId(rs.getInt("id"));
				article.setTitle(rs.getString("title"));
				article.setSort(rs.getString("sort"));
				articles.add(article);
			}
		} catch (Exception e) {
		}
		return articles;
	}//
	/**
	 * 主页获取热门作者，依据文章点击率
	 */
	public List<Article> getHotAut() {
		int authorID = 0;
		String sql = "SELECT DISTINCT authorID FROM artdata ORDER BY clicks DESC";
		String sql2 = "";
		List<Article> articles = new ArrayList<Article>();
		Article article = null;
		try {
			ResultSet rs = doBaseDao().executeQuery(sql);
			while(rs.next()) {
				article = new Article();
				article.setAuthorID(rs.getInt("authorID"));
				authorID = article.getAuthorID();
				sql2 = "SELECT username FROM userdata WHERE id="+authorID+"";
				ResultSet rs2 = doBaseDao().executeQuery(sql2);
				while(rs2.next())
					article.setAuthorName(rs2.getString("username"));
				articles.add(article);
			}
		} catch (Exception e) {
		}
		return articles;
	}
	/**
	 * 获得最新文章列表
	 */
	public List<Article> getNews() {
		List<Article> articles = new ArrayList<Article>();
		Article article = null;
		try {
			String sql = "SELECT * FROM artdata ORDER BY id desc";
			ResultSet rs = doBaseDao().executeQuery(sql);
			while(rs.next()) {
				article = new Article();
				article.setId(rs.getInt("id"));
				article.setTitle(rs.getString("title"));
				articles.add(article);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return articles;
	}
	/**
	 * 优质文章中用于预选文章
	 */
	public List<Article> getGoodArt() {
		List<Article> articles = new ArrayList<Article>();
		Article article = null;
		try {
			String sql = "SELECT * FROM artdata ORDER BY id desc";
			ResultSet rs = doBaseDao().executeQuery(sql);
			while(rs.next()) {
				if (rs.getString("content").length()>2000) {//内容长度大于2000的文章
					article = new Article();
					article.setContent(rs.getString("content"));
					article.setId(rs.getInt("id"));
					article.setTitle(rs.getString("title"));
					articles.add(article);
				}
			}
			for(int i = 0;i<articles.size();i++) {
				String cont = articles.get(i).getContent();
				int imgNum = cont.indexOf("http://localhost:8080/nsBlog/clientPic/");//过滤掉没有图片的文章
				if (imgNum<0) {
					articles.remove(i);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return articles;
	}
	/*
	 * 用于获得文章分类
	 */
	public List<Article> getSort(String sort) {
		List<Article> articles = new ArrayList<Article>();
		Article article = null;
		try {
			String sql = "SELECT * FROM artdata WHERE sort='"+sort+"' ORDER BY id desc";
			ResultSet rs = doBaseDao().executeQuery(sql);
			while(rs.next()) {
				article = new Article();
				article.setId(rs.getInt("id"));
				article.setSort(rs.getString("sort"));
				article.setTitle(rs.getString("title"));
				articles.add(article);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return articles;
	}
	
	
	

}
