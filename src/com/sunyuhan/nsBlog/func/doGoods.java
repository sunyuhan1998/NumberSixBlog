package com.sunyuhan.nsBlog.func;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.sunyuhan.nsBlog.Dao.BaseDao;

/**
 * @author sunyuhan
 *
 * 2018��10��25��
 * 
 * �йظ����۵��޵���ط���
 * 
 */
public class doGoods extends BaseDao{
	//��ȡָ�����۵�����
	public int getGoods(int comID) {
		int goods = 0;
		String sql = "SELECT goods FROM commentdata WHERE id="+comID+"";
		ResultSet rs = null;
		try {
			rs = doBaseDao().executeQuery(sql);
			while(rs.next())
				goods = rs.getInt("goods");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return goods;
		
	}
	//������������
	public void addGoods(int ComID) {
		int goods = getGoods(ComID);
		goods = goods+1;//��ȡ�����޲���һ
		String sql2 = "UPDATE commentdata SET goods="+goods+" WHERE id="+ComID+"";
		try {
			doBaseDao().execute(sql2);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	//�����ۼ�����
	public void deGoods(int ComID) {
		int goods = getGoods(ComID);
		goods = goods-1;//��ȡ�����޲���һ
		String sql2 = "UPDATE commentdata SET goods="+goods+" WHERE id="+ComID+"";
		try {
			doBaseDao().execute(sql2);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
