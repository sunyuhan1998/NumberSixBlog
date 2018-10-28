package com.sunyuhan.nsBlog.Dao;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

/**
 * @author sunyuhan
 *
 * 2018年10月9日
 * 
 * 数据库连接基类，其他数据库连接操作均由此类派生
 * 
 */
public class BaseDao {
	static String jdbcDriver = null;
	static String url = null;
	static String name = null;
	static String password = null;
	Connection connection;
	Statement stmt;
	public Statement doBaseDao() {
		try {
			Properties properties = new Properties();
			InputStream in = BaseDao.class.getClassLoader().getResourceAsStream("daoConf.properties");
			properties.load(in);
			
			jdbcDriver = properties.getProperty("jdbcDriver");
			url = properties.getProperty("url");
			name = properties.getProperty("name");
			password = properties.getProperty("password");
			
			Class.forName(jdbcDriver);
			connection = DriverManager.getConnection(url,name,password);
			stmt = connection.createStatement();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return stmt;
	}
}
