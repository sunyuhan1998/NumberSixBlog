package com.sunyuhan.nsBlog.Dao;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @author sunyuhan
 *
 * 2018年10月27日
 * 
 * 签到相关功能
 */
public class signDao extends BaseDao{
	//签到方法
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
	//前台用于获取签到状态
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
	//前台用于恢复签到状态
	public void deSign(int id) {
		String sql2 = "UPDATE userdata SET alsig=0 WHERE id="+id+"";
		try {
			doBaseDao().execute(sql2);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
}
