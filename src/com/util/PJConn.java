package com.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class PJConn {
	
	private static Connection conn = null;
	
	public static Connection getConnection() {
		
		try {
			
			String url = "jdbc:oracle:thin:@192.168.55.142:1521:xe";
			String user = "pro2";
			String pwd = "a123";
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, pwd);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return conn;
	
	}
	
	public static void close() {
		
		try {
			
			if(conn==null) {
				return;
			}
			if(!conn.isClosed()) {
				conn.close();
			}
			
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		conn = null;
		
		
	}

}
