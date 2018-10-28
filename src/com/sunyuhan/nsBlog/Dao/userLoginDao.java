package com.sunyuhan.nsBlog.Dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * @author sunyuhan
 *
 * 2018年10月10日
 * 
 * 用户登录数据库操作
 * 
 */
public class userLoginDao extends BaseDao{
	static String sql = null;
	static String username = null;
	static String upassword = null;
	
	public userLoginDao(String username,String upassword){
		userLoginDao.username = username;
		userLoginDao.upassword = upassword;
		sql = "SELECT username,password FROM userdata";
	}
	public String doLogin() {
		String result = null;
		try {
			ResultSet rs = doBaseDao().executeQuery(sql);
			while(rs.next()) {
				if (rs.getString("username").equals(username)&&rs.getString("password").equals(upassword)) {
					result = "ok";
					return result;
				}
			}
			result = "password error";
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
		
	}

}
