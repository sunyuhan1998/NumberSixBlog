package com.sunyuhan.nsBlog.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.sunyuhan.nsBlog.Dao.BaseDao;

/**
 * @author sunyuhan
 *
 * 2018��10��13��
 * 
 * �����javaBean���ṩ��������id��ȡ����������ӵ��������
 * 
 */
public class Clicks extends BaseDao{
	int clicks = 0;//���ݿ������е����
	int artid = 0;//����id
	String sql;
	String sql2;
	public Clicks(int artid){
		this.artid = artid;
	}
	public Statement linkSql() {
		Statement stmt = doBaseDao();
		return stmt;
	}
	public int getClicks() {
		try {
			sql = "SELECT clicks FROM artdata WHERE id="+artid+"";
			ResultSet rs = linkSql().executeQuery(sql);
			while(rs.next())
				clicks = rs.getInt("clicks");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return clicks;
	}
	public void addClicks() {
		try {
			int addClicks = 0;//���Ӻ�ĵ����
			clicks = getClicks();
			addClicks = clicks+1;
			sql2 = "update artdata set clicks="+addClicks+" where id="+artid+"";
			linkSql().execute(sql2);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}
