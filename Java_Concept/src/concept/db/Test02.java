package concept.db;

import java.sql.*;
public class Test02 {
	public static void main(String[] args) {
		String id = "myJsp";
		String password = "jsppassword";
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String sql = "CREATE TABLE account("
				+ " name VARCHAR2(20),"
				+ " no NUMBER,"
				+ " email VARCHAR2(20),"
				+ " point NUMBER,"
				+ " regdate DATE"
				+ ")";
		Connection con = null;
		PreparedStatement ps = null;
		
		try { // 만약 문제가 생기면 뒤에 실행 안되고 catch로 이동
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, id, password);
			ps = con.prepareStatement(sql);
			ps.execute();
			System.out.println("Account 테이블 생성 완료");
			
			ps = con.prepareStatement("CREATE SEQUENCE acc_seq NOCACHE");
			ps.execute();
			System.out.println("acc_seq 시퀀스 생성 완료!");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally { //예외 상황 발생해도 무조건 실행해라
			try {
				if(ps != null) {
					ps.close(); // 현재 null.close가 실행된다.
				}
				if(con != null) {
					con.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
