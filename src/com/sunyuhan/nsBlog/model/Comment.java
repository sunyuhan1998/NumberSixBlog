package com.sunyuhan.nsBlog.model;

/**
 * @author sunyuhan
 *
 * 2018年10月23日
 * 
 * 评论javaBean 数据封装类
 */
public class Comment {
	int id;
	int authorID;
	int artID;
	int goods;
	String artTitle;
	public String getAutherName() {
		return autherName;
	}
	public void setAutherName(String autherName) {
		this.autherName = autherName;
	}
	String autherName;
	String comment;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getAuthorID() {
		return authorID;
	}
	public void setAuthorID(int authorID) {
		this.authorID = authorID;
	}
	public int getArtID() {
		return artID;
	}
	public void setArtID(int artID) {
		this.artID = artID;
	}
	public String getArtTitle() {
		return artTitle;
	}
	public void setArtTitle(String artTitle) {
		this.artTitle = artTitle;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public int getGoods() {
		return goods;
	}
	public void setGoods(int goods) {
		this.goods = goods;
	}
}
