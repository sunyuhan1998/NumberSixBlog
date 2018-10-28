package com.sunyuhan.nsBlog.func;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.sunyuhan.nsBlog.Dao.BaseDao;

/**
 * @author sunyuhan
 *
 * 2018年10月25日
 * 
 * 有关给评论点赞的相关方法
 * 
 */
public class doGoods extends BaseDao{
	//获取指定评论的赞数
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
	//给评论增加赞
	public void addGoods(int ComID) {
		int goods = getGoods(ComID);
		goods = goods+1;//获取已有赞并加一
		String sql2 = "UPDATE commentdata SET goods="+goods+" WHERE id="+ComID+"";
		try {
			doBaseDao().execute(sql2);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	//给评论减少赞
	public void deGoods(int ComID) {
		int goods = getGoods(ComID);
		goods = goods-1;//获取已有赞并减一
		String sql2 = "UPDATE commentdata SET goods="+goods+" WHERE id="+ComID+"";
		try {
			doBaseDao().execute(sql2);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
