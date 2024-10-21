package utils;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;
//使用C3p0连接池获取连接数据库
public class C3p0Utils {
	private static DataSource ds;
	static{
		ds=new ComboPooledDataSource();
	}
	public static DataSource getDs(){
		return ds;
	}
	
	public static Connection getConnection() throws SQLException{
		return ds.getConnection();
	}

	public static void main(String args[]) throws SQLException {
		System.out.println(new C3p0Utils().getConnection()+"连接成功");
	}
}
