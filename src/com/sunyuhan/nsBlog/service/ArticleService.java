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
 * 2018��10��12��
 * 
 * �������ҵ���߼�����
 * ��������ҳ�������������Ϣ�Ĳ�ѯ����
 * 
 */
public class ArticleService extends BaseDao{
	//ͨ���û������id
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
	//ͨ��id����û���
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
	 * ���ڸ�������ҳ���Ҳ�չʾ��ʷ�����б�
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
	 * ����������������blogҳ��չʾ�������ݣ���ҳ�ȵ�����۹���Ҳ��ӵ�������һ����
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
	 * ���·���������ҳ��ȡ�������µ�id�ͱ��⣬�Ե����Ϊ����
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
	 * ��ҳ��ȡ�������ߣ��������µ����
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
	 * ������������б�
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
	 * ��������������Ԥѡ����
	 */
	public List<Article> getGoodArt() {
		List<Article> articles = new ArrayList<Article>();
		Article article = null;
		try {
			String sql = "SELECT * FROM artdata ORDER BY id desc";
			ResultSet rs = doBaseDao().executeQuery(sql);
			while(rs.next()) {
				if (rs.getString("content").length()>2000) {//���ݳ��ȴ���2000������
					article = new Article();
					article.setContent(rs.getString("content"));
					article.setId(rs.getInt("id"));
					article.setTitle(rs.getString("title"));
					articles.add(article);
				}
			}
			for(int i = 0;i<articles.size();i++) {
				String cont = articles.get(i).getContent();
				int imgNum = cont.indexOf("http://localhost:8080/nsBlog/clientPic/");//���˵�û��ͼƬ������
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
	 * ���ڻ�����·���
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
