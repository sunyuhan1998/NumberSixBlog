package com.sunyuhan.nsBlog.model;

import com.sunyuhan.nsBlog.Dao.BaseDao;

/**
 * @author sunyuhan
 *
 * 2018��10��12��
 * 
 * ����javaBean ���ݷ�װ��
 * 
 */
public class Article{
	int id = 0;//����id
	int clicks = 0;//�����
	String time = "";//����ʱ��
	String sort = "";//����
	int authorID = 0;//����id
	String authorName = "";//������
	String title = "";//���±���
	String content = "";//��������
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
