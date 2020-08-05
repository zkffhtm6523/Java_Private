package concept.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Test07 {
	public static void main(String[] args) {
		String id = "myJsp";
		String password = "jsppassword";
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			// 커넥션 준비
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, id, password);
		
			String sql = "SELECT st_name, "
					+ "st_avg FROM student";
			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			boolean result = rs.next();//레코드가 1개라도 있으면 true/ 없으면 false
									//레코드를 확인하기 위해서는 최소 1회 next()를 실행해야 함
									//실행하지 않는 초기 커서는 아무것도 가리키지 않기 때문
									//next를 두 번 실행해서 이푸린부터 나옴
			while (rs.next()) { //rs.next로 하면 다음 행으로 넘어감
				String name;
				double avg;
				name = rs.getString("st_name");//현재 위치 자리에 항목의 값을 String 형태로
				avg = rs.getDouble("st_avg");//String타입을 받아옴
								//(String) : 항목 이름
								//(int) : 몇 번째 항목(항목 이름을 모를 때)				
				System.out.println(name + " / " + avg + "점");
			}
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
