package com.sunyuhan.nsBlog.model;

import com.sunyuhan.nsBlog.Dao.BaseDao;

/**
 * @author sunyuhan
 *
 * 2018年10月12日
 * 
 * 文章javaBean 数据封装类
 * 
 */
public class Article{
	int id = 0;//文章id
	int clicks = 0;//点击量
	String time = "";//发布时间
	String sort = "";//分类
	int authorID = 0;//作者id
	String authorName = "";//作者名
	String title = "";//文章标题
	String content = "";//文章内容
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getClicks() {
		return clicks;
	}
	public void setClicks(int clicks) {
		this.clicks = clicks;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public int getAuthorID() {
		return authorID;
	}
	public void setAuthorID(int authorID) {
		this.authorID = authorID;
	}
	public String getAuthorName() {
		return authorName;
	}
	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	

}
