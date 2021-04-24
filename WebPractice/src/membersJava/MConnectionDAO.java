package membersJava;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class MConnectionDAO {   
	
	public static Connection getConnection() {
		Connection conn= null;
		try {
		   Class.forName("oracle.jdbc.driver.OracleDriver"); //오라클에 연결하는 드라이브 
		    String dbHost = "jdbc:oracle:thin:@masternull.iptime.org:1521:orcl";
		    String user = "java21"; // 본인 계정
		    String pass ="java"; 
		    conn = DriverManager.getConnection(dbHost, user, pass);
		
		} catch(Exception e) {
				e.printStackTrace();
		}

		return conn; // 연결된 커넥션 객체를 돌려받는다. 
	}
	
	public static void close(ResultSet rs, 
							PreparedStatement pstmt,
							Connection conn ) { 
	 if(rs!= null) {try {rs.close();}catch(SQLException s) {}}
	 if(pstmt!= null) {try {pstmt.close();}catch(SQLException s) {}}
	 if(conn!= null) {try {conn.close();}catch(SQLException s) {}}
	 
	}
	
}
