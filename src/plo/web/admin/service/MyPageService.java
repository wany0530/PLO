package plo.web.admin.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MyPageService {
	
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String id = "scott";
	private String pw = "tiger";
	
	private Connection conn;
	private PreparedStatement prst;
	private ResultSet rs;
	
	// DB연결
	private void setCon() throws SQLException {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		conn = DriverManager.getConnection(url, id, pw);
		System.out.println("접속성공");
	}
	
	// 회원 탈퇴
	public void userDel(int u_no) {
		String sql = "DELETE FROM P_USER WHERE u_no = ?";
		try {
			setCon();
			conn.setAutoCommit(false);
			
			prst = conn.prepareStatement(sql);
			prst.setInt(1, u_no);
			prst.executeUpdate();
			
			conn.commit();
			prst.close();
			conn.close();
		} catch (SQLException e) {
			System.out.println("DB 관련 에러 : " + e.getMessage());
			System.out.println(sql);
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} catch(Exception e) {
			System.out.println("기타 에러 : " + e.getMessage());
		}
	}
	
	// 비밀번호 변경
	public void updatePass(int u_no, String u_pass) {
		String sql = "UPDATE P_USER\r\n"
				+ "SET u_pass = ?\r\n"
				+ "WHERE u_no = ?";
		try {
			setCon();
			conn.setAutoCommit(false);
			
			prst = conn.prepareStatement(sql);
			prst.setString(1, u_pass);
			prst.setInt(2, u_no);
			prst.executeUpdate();
			
			conn.commit();
			prst.close();
			conn.close();
			
		} catch (SQLException e) {
			System.out.println("DB 관련 에러 : " + e.getMessage());
			System.out.println(sql);
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} catch(Exception e) {
			System.out.println("기타 에러 : " + e.getMessage());
		}
		
	}

	
	public static void main(String[] args) {
		MyPageService ms = new MyPageService();
		//ms.updatePass(8, "passpasspass");
		ms.userDel(10);

	}

}
