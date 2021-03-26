package plo.web.admin.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DashboardService {
	
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String id = "scott";
	private String pw = "tiger";
	
	private Connection conn;
	private PreparedStatement prst;
	private ResultSet rs;

	// DB연결
	private void setCon() {
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, id, pw);
			System.out.println("접속성공");
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 카운트
	public int count(String item) {
		int cnt = 0;
		String sql = "";
		
		if(!item.equals("")) {
			sql = "SELECT count(*) cnt FROM "+item;
		
			try {
				setCon();
				prst = conn.prepareStatement(sql);
				rs = prst.executeQuery();
				
				if(rs.next())
					cnt = rs.getInt("CNT");
				
				rs.close();
				prst.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
			
		return cnt;
	}

	public static void main(String[] args) {
		
//		DashboardService service = new DashboardService();
	}
}
