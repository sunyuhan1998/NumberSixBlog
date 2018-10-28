package com.sunyuhan.nsBlog.Dao;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @author sunyuhan
 *
 * 2018��10��27��
 * 
 * ǩ����ع���
 */
public class signDao extends BaseDao{
	//ǩ������
	public void doSign(int id,String moon) {
		int state = Integer.parseInt(moon);
		try {
			String sql = "UPDATE userdata SET alsig="+state+" WHERE id="+id+"";
			doBaseDao().execute(sql);
			switch (moon) {
			case "feichanghao":
				state = 1;
				break;
			case "yiban":
				state = 2;
				break;
			case "zaogao":
				state = 3;
				break;
			default:
				break;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	//ǰ̨���ڻ�ȡǩ��״̬
	public int  getSign(int id) {
		int state = 0;
		try {
			String sql = "SELECT alsig FROM userdata WHERE id="+id+"";
			ResultSet rs = doBaseDao().executeQuery(sql);
			while(rs.next()) {
				state = rs.getInt("alsig");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return state;
	}
	//ǰ̨���ڻָ�ǩ��״̬
	public void deSign(int id) {
		String sql2 = "UPDATE userdata SET alsig=0 WHERE id="+id+"";
		try {
			doBaseDao().execute(sql2);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
}
