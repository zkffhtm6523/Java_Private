package concept.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Test08 {
	public static void main(String[] args) {
		String id = "myJsp";
		String password = "jsppassword";
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, id, password);
			
			sql = "SELECT st_name"
					+ ", st_kr"
					+ ", st_no"
					+ ", st_avg FROM student"
					+ " WHERE st_avg >= 80";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			String name;
			int kr;
			int no;
			double avg;
			while(rs.next()) {
				name = rs.getString("st_name");
				kr = rs.getInt("st_kr");
				no = rs.getInt("st_no");
				avg = rs.getDouble("st_avg");
				
				System.out.println("이름 : "+name);
				System.out.println("국어 점수 : "+kr);
				System.out.println("학번 : "+no);
				System.out.println("평균점수 : "+avg);
				System.out.println();
			}
			ps.close();
			rs.close();
			
			System.out.println("====2번 문제====");
			sql = "SELECT st_name, st_no, st_tel FROM student WHERE st_name LIKE '김%' ORDER BY st_name ASC";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				System.out.println("이름 : " + rs.getString("st_name"));//바로 접속하기
				System.out.println("학번 : " + rs.getInt("st_no"));
				System.out.println("연락처 : " + rs.getString("st_tel"));
				System.out.println();
			}
			
			rs.close();
			ps.close();
			
			// 3번 문제 : 가장 나중에 등록한 학생을 삭제
			sql = "DELETE FROM student WHERE st_redate = (SELECT MAX(st_regdate) FROM student)";
			ps = con.prepareStatement(sql);
//			System.out.println(ps.executeUpdate() + "개 레코드가 삭제됨");
			ps.close();
			
			sql = "SELECT st_name, st_avg FROM student WHERE st_avg = (SELECT MAX(st_avg) FROM student)";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			rs.next();
			System.out.println("1등의 이름 : " + rs.getString("st_name"));
			System.out.println("1등의 평균 점수 : " + rs.getDouble("st_avg"));
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if (ps != null) ps.close();
				if (con != null) con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
