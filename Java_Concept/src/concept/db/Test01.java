package concept.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Test01 {
	public static void main(String[] args) {
		String id = "myjsp";
        String password = "jsppassword";
        String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		
        try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection connection = DriverManager.getConnection(url, id, password);
		
			PreparedStatement ps = connection.prepareStatement("CREATE SEQUENCE student_seq NOCACHE");
			ps.execute();
			
			ps.close();
			connection.close();
			
			System.out.println("������ ���� �Ϸ�!");
        } catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
