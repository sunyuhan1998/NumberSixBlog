package com.sunyuhan.nsBlog.Dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author sunyuhan
 *
 * 2018��10��10��
 * 
 * �û�ע�����ݿ����
 * 
 */
public class userRegDao extends BaseDao{
	
	static String sql = null;
	static String sql2 = null;
	static String username = null;
	static String upassword = null;
	static String email = null;
	static String sex = null;
	static String time = null;
	public userRegDao(String username,String upassword,String email,String sex){
		userRegDao.username = username;
		userRegDao.upassword = upassword;
		userRegDao.email = email;
		userRegDao.sex = sex;
		userRegDao.time = new SimpleDateFormat("yyyy��MM��dd��hh��mm��ss��").format(new Date());
		sql = "INSERT INTO userdata(username,password,alsig,regtime,email,sex) VALUES('"+username+"','"+upassword+"',0,'"+time+"','"+email+"','"+sex+"')";
		sql2 = "SELECT username FROM userdata";
	}
	public String docreate() {
		String result = null;
		try {
			ResultSet rs = doBaseDao().executeQuery(sql2);
			while(rs.next()) {
				if (rs.getString("username").equals(username)) {
					result = "already exist";
					return result;
				}
			}
			stmt.execute(sql);
			result = "ok";
			System.out.println("���û�ע��"+"�˺�"+username+",����"+upassword+",ע��ʱ��"+time);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

}
