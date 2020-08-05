package com.webtoon.test;

import java.sql.*;

public class DbCon {
	public static Connection getCon() throws Exception{
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String username = "hr";
		String password = "root";
		Connection con = DriverManager.getConnection(url,username,password);
		System.out.println("접속 성공");
		return con;
	}
	public static void closeCon(Connection con, PreparedStatement ps, ResultSet rs) {
		if (rs != null) {try {rs.close();} catch (Exception e) {}}
		if (ps != null) {try {ps.close();} catch (Exception e) {}}
		if (con != null) {try {con.close();} catch (Exception e) {}}
	}

	public static void closeCon(Connection con, PreparedStatement ps) {
		closeCon(con, ps, null);
	}
}
