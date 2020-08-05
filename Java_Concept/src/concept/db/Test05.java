package concept.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Scanner;

public class Test05 {
	public static void main(String[] args) {
		String id = "myJsp";
		String password = "jsppassword";
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";

		Connection con = null;
		PreparedStatement ps = null;

		try {
			// 커넥션 준비
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, id, password);
			
			//student 테이블에, 입력받은 학생 이름, 연락처를 레코드로 추가
			Scanner sc = new Scanner(System.in);
			String name;
			String tel;
			System.out.print("학생 이름 : ");
			name = sc.next();
			System.out.print("학생 연락처 : ");
			tel = sc.next();
			
			int kr, en, ma;
			double avg;
			
			System.out.print("국어 :");
			kr = sc.nextInt();
			System.out.print("영어 :");
			en = sc.nextInt();
			System.out.print("수학 :");
			ma = sc.nextInt();
			
			avg = (kr + en + ma) / 3.0;
			
			String sql = "INSERT INTO student VALUES"
					+ "("
					+ "st_seq.NEXTVAL"
					+ ",?"
					+ ",?"
					+ ",?"
					+ ",?"
					+ ",?"
					+ ",?"
					+ ",SYSDATE"
					+ ")";
			ps = con.prepareStatement(sql);
			ps.setString(1, name); //1번 물음표 name으로 대체
			ps.setString(2, tel);
			ps.setInt(3, kr);
			ps.setInt(4, en);
			ps.setInt(5, ma);
			ps.setDouble(6, avg);
			
			ps.execute();
			System.out.println("학생 추가 완료!");
			
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
