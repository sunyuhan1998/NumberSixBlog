package com.sunyuhan.nsBlog.Dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author sunyuhan
 *
 * 2018年10月12日
 * 
 * 用户提交博文数据库操作
 * 
 */
public class writeBlogDao extends BaseDao{
	int id = 0;
	String sort = "";
	String time = new SimpleDateFormat("yyyy年MM月dd日hh点mm分ss秒").format(new Date());
	String title = "";
	String content = "";
	String username = "";
	String sql1;
	String sql2;
	
	public writeBlogDao(String sort,String username,String title,String content) {
		this.sort = sort;
		this.username = username;
		this.title = title;
		this.content = content;
		getId();
	}
	public void getId() {
		try {
			sql1 = "SELECT id FROM userdata WHERE username='"+username+"'";
			ResultSet rs = doBaseDao().executeQuery(sql1);
			while(rs.next()) {
				id = rs.getInt("id");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}
	public String saveBlog() {
		sql2 = "INSERT INTO artdata(authorID,sort,time,title,content) "
				+ "VALUES("+id+",'"+sort+"','"+time+"','"+title+"','"+content+"')";
		String result = "";
		try {
			doBaseDao().execute(sql2);
			result = "ok";
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	

}
