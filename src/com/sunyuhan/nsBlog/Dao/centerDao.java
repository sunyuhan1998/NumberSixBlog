package com.sunyuhan.nsBlog.Dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * @author sunyuhan
 *
 * 2018��10��10��
 * 
 * �����������ݿ⣬ʹ��get��������û��������ԣ������ǳ���ǰ̨��cookie�л��
 * 
 */
public class centerDao extends BaseDao{
	String id;
	String sex;
	String regt;
	String email;
	String alsig;
	public int getId(String cname) {
		int id = 0000;
		name = cname;
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
	
	public int getAlsig(String cname) {
		int alsig = 0000;
		name = cname;
		String sql = "SELECT alsig FROM userdata WHERE username='"+name+"'";
		try {
			ResultSet rs = doBaseDao().executeQuery(sql);
			while(rs.next())
			alsig = rs.getInt("alsig");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return alsig;
	}
	
	public String getSex(String cname) {
		String sex = "";
		name = cname;
		String sql = "SELECT sex FROM userdata WHERE username='"+name+"'";
		try {
			ResultSet rs = doBaseDao().executeQuery(sql);
			while(rs.next())
			sex = rs.getString("sex");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sex;
	}
	
	public String getEmail(String cname) {
		String email = "";
		name = cname;
		String sql = "SELECT email FROM userdata WHERE username='"+name+"'";
		try {
			ResultSet rs = doBaseDao().executeQuery(sql);
			while(rs.next())
			email = rs.getString("email");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return email;
	}
	
	public String getRegtime(String cname) {
		String regtime = "";
		name = cname;
		String sql = "SELECT regtime FROM userdata WHERE username='"+name+"'";
		try {
			ResultSet rs = doBaseDao().executeQuery(sql);
			while(rs.next())
			regtime = rs.getString("regtime");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return regtime;
	}

}
