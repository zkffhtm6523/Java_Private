package concept.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class Test03 {
	public static void main(String[] args) {
		String id = "myJsp";
		String password = "jsppassword";
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";

		Connection con = null;
		PreparedStatement ps = null;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, id, password);
			ps = con.prepareStatement(
					"INSERT INTO account VALUES('홍길동',acc_seq.NEXTVAL,'hong@gmail.com',2000, SYSDATE)");
			ps.execute();// commit이 자동으로 실행된다.
			ps = con.prepareStatement(
					"INSERT INTO account VALUES('고길동',acc_seq.NEXTVAL,'gogo@gmail.com',1500, SYSDATE)");
			ps.execute();
			ps = con.prepareStatement(
					"INSERT INTO account VALUES('김피카츄',acc_seq.NEXTVAL,'pikapika@gmail.com',20000, TO_DATE('2018/04/20', 'YYYY/MM/DD'))");
			ps.execute();

			System.out.println("레코드 추가 완료!");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null) {
					ps.close(); 
				}
				if (con != null) {
					con.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}