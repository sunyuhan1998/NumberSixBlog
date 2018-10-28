package com.sunyuhan.nsBlog.func;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.sunyuhan.nsBlog.Dao.BaseDao;

/**
 * @author sunyuhan
 *
 * 2018年10月22日
 * 
 * 由文章id找首图片的方法
 * 传入一个文章的id，返回它的第一张图片路径
 */
public class art2Pic extends BaseDao{
	public String doArt2Pic(int artID) {
		String path = "";
		String content = "";
		String sql = "SELECT content FROM artdata WHERE id="+artID+"";
		try {
			ResultSet rs = doBaseDao().executeQuery(sql);
			while(rs.next())
				content = rs.getString("content");
			content = content.substring(content.indexOf("clientPic/")+10);
			content = content.substring(0, content.indexOf("\""));
			path = "http://localhost:8080/nsBlog/clientPic/"+content;
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		return path;
	}
}
