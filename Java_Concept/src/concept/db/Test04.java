package concept.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Scanner;

public class Test04 {
	public static void main(String[] args) {
		String id = "myJsp";
		String password = "jsppassword";
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";

		Connection con = null;
		PreparedStatement ps = null;
		
		String name, email;
		Scanner sc = new Scanner(System.in);
		System.out.print("이름 : ");
		name = sc.next();
		System.out.print("이메일 : ");
		email = sc.next();
		
		try {
			// 커넥션 준비
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, id, password);
			
			//쿼리문 준비
			ps = con.prepareStatement("INSERT INTO account VALUES('"+name+"'"
					+ ",acc_seq.NEXTVAL,'"+email+"',1000,SYSDATE)");
			
			//실행
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
