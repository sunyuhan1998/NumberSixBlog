package com.sunyuhan.nsBlog.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sunyuhan.nsBlog.Dao.BaseDao;
import com.sunyuhan.nsBlog.model.Comment;

/**
 * @author sunyuhan
 *
 * 2018��10��23��
 * 
 * ���۹������ҵ���߼�ʵ��
 */
public class CommentService extends BaseDao{
	//��������
	public void addComment(int artID,int autID,String comment) {//����������id�������û�id����������
		try {
			String title = new ArticleService().getArtInfo(artID).getTitle();
			String authorName = new ArticleService().getName(autID);
			String sql = "INSERT INTO commentdata(authorID,authorName,artID,artTitle,comment,goods) VALUES("+autID+",'"+authorName+"',"+artID+",'"+title+"','"+comment+"',0)";
			doBaseDao().execute(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	//��ȡ�������۶���
	public List<Comment> getNewComment() {
		String sql = "SELECT * FROM commentdata ORDER BY id desc";
		List<Comment> comments = new ArrayList<Comment>();
		Comment comment = null;
		try {
			ResultSet rs = doBaseDao().executeQuery(sql);
			while(rs.next()) {
				comment = new Comment();
				comment.setId(rs.getInt("id"));
				comment.setAuthorID(rs.getInt("authorID"));
				comment.setAutherName(rs.getString("authorName"));
				comment.setArtID(rs.getInt("artID"));
				comment.setArtTitle(rs.getString("artTitle"));
				comment.setComment(rs.getString("comment"));
				comment.setGoods(rs.getInt("goods"));
				comments.add(comment);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return comments;
	}	
	//��ȡ�������۶���
	public List<Comment> getHotComment() {
		String sql = "SELECT * FROM commentdata ORDER BY 7 desc";
		List<Comment> comments = new ArrayList<Comment>();
		Comment comment = null;
		try {
			ResultSet rs = doBaseDao().executeQuery(sql);
			while(rs.next()) {
				comment = new Comment();
				comment.setId(rs.getInt("id"));
				comment.setAuthorID(rs.getInt("authorID"));
				comment.setAutherName(rs.getString("authorName"));
				comment.setArtID(rs.getInt("artID"));
				comment.setArtTitle(rs.getString("artTitle"));
				comment.setComment(rs.getString("comment"));
				comment.setGoods(rs.getInt("goods"));
				comments.add(comment);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return comments;
	}	
	//��������ID������ۼ�
	public List<Comment> getComment(int artID) {
		String sql = "SELECT * FROM commentdata WHERE artID="+artID+" ORDER BY 7 desc";
		List<Comment> comments = new ArrayList<Comment>();
		Comment comment = null;
		try {
			ResultSet rs = doBaseDao().executeQuery(sql);
			while(rs.next()) {
				comment = new Comment();
				comment.setId(rs.getInt("id"));
				comment.setAutherName(rs.getString("authorName"));
				comment.setArtID(rs.getInt("authorID"));
				comment.setArtID(rs.getInt("artID"));
				comment.setArtTitle(rs.getString("artTitle"));
				comment.setComment(rs.getString("comment"));
				comment.setGoods(rs.getInt("goods"));
				comments.add(comment);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return comments;
	}
	
	
	

}
