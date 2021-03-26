package plo.web.admin.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import plo.web.admin.entity.RegUser;
import plo.web.admin.entity.User;

public class UserManagerService {
	
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

	// 전체 리스트 (전체)
	public ArrayList<User> getUserTotal() {
		ArrayList<User> userList = new ArrayList<User>();
		String sql = "SELECT * FROM P_USER";
		
		System.out.println(sql);
		try {
			setCon();
			
			prst = conn.prepareStatement(sql);
			rs = prst.executeQuery();
			
			while(rs.next()) {
				int no = rs.getInt("U_NO");
				String id = rs.getString("U_ID");
				String pass = rs.getString("U_PASS");
				String name = rs.getString("U_NAME");
				String mail = rs.getString("U_MAIL");
				Date date = rs.getDate("U_DATE");
				
				userList.add(new User(no, id, pass, name, mail, date));
			}
			
			rs.close();
			prst.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		return userList;
	}
	
	// 회원 리스트
	public ArrayList<User> getUserList(int page, int cnt) {
		ArrayList<User> userList = new ArrayList<User>();
		String sql = "";
		
		int start = 1 + (page-1)*cnt;
		int end = page * cnt;
		
		
		sql = "SELECT * FROM (\n"
				+ "	SELECT ROWNUM num, u.* FROM (\n"
				+ "		SELECT * FROM P_USER ORDER BY U_NO DESC\n"
				+ "	) u\n"
				+ ") WHERE num BETWEEN ? AND ?";
		System.out.println(sql);
		try {
			setCon();
			
			prst = conn.prepareStatement(sql);
			prst.setInt(1, start);
			prst.setInt(2, end);
			rs = prst.executeQuery();
			
			while(rs.next()) {
				int no = rs.getInt("U_NO");
				String id = rs.getString("U_ID");
				String pass = rs.getString("U_PASS");
				String name = rs.getString("U_NAME");
				String mail = rs.getString("U_MAIL");
				Date date = rs.getDate("U_DATE");
				
				userList.add(new User(no, id, pass, name, mail, date));
			}
			
			rs.close();
			prst.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		return userList;
	}
	
	// 등록된 회원 수
	public int count() {
		String sql = "";
		int cnt = 0;
		
		sql = "SELECT count(*) cnt FROM P_USER";
		System.out.println(sql);
		try {
			setCon();
			
			prst = conn.prepareStatement(sql);
			rs = prst.executeQuery();
			
			if(rs.next())
				cnt = rs.getInt("cnt");
			
			rs.close();
			prst.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;	
	}

	// 회원 상세
	public User userInfo(int u_no) {
		User user = new User();
		
		String sql = "SELECT * FROM P_USER WHERE u_no = ?";
		System.out.println(sql);
		try {
			setCon();
			
			prst = conn.prepareStatement(sql);
			prst.setInt(1, u_no);
			rs = prst.executeQuery();
			
			if(rs.next()) {
				user.setU_no(rs.getInt("U_NO"));
				user.setU_id(rs.getString("U_ID"));
				user.setU_pass(rs.getString("U_PASS"));
				user.setU_name(rs.getString("U_NAME"));
				user.setU_mail(rs.getString("U_MAIL"));
				user.setU_date(rs.getDate("U_DATE"));
			}
			
			rs.close();
			prst.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		return user;
	}
	
	// 회원 등록
	public boolean userReg(RegUser user) {
		boolean success = false;
		
		String sql = "INSERT INTO P_USER \n"
			+ "VALUES(P_USER_NO_SEQ.NEXTVAL, ?, ?, ?, ?, to_date(?, 'yyyy-mm-dd'))";
		System.out.println(sql);
		try {
			setCon();
			
			prst = conn.prepareStatement(sql);
			prst.setString(1, user.getU_id());
			prst.setString(2, user.getU_pass());
			prst.setString(3, user.getU_name());
			prst.setString(4, user.getU_mail());
			prst.setString(5, user.getU_date_s());
			
			rs = prst.executeQuery();
			
			success = rs.next();
			
			rs.close();
			prst.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		return success;	
		
	}
	
	// 회원 삭제
	public boolean userDel(int u_no) {
		boolean success = false;
		
		String sql = "DELETE P_USER WHERE u_no = ?";
		System.out.println(sql);
		try {
			setCon();
			
			prst = conn.prepareStatement(sql);
			prst.setInt(1, u_no);
			
			rs = prst.executeQuery();
			
			success = rs.next();
			System.out.println("삭제여부"+success);
			rs.close();
			prst.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return success;
	}
	
	// 회원 수정
	public boolean userUpdate(RegUser user) {
		boolean success = false;
		
		String sql = "UPDATE P_USER\n"
				+ "   SET u_pass = ?,\n"
				+ "   	   u_name = ?,\n"
				+ "   	   u_mail = ?,\n"
				+ "   	   u_date = ?\n"
				+ " WHERE u_no = ?";
		
		System.out.println(sql);
		try {
			setCon();
			
			prst = conn.prepareStatement(sql);
			prst.setString(1, user.getU_pass());
			prst.setString(2, user.getU_name());
			prst.setString(3, user.getU_mail());
			prst.setString(4, user.getU_date_s());
			prst.setInt(5, user.getU_no());
			
			rs = prst.executeQuery();
			
			success = rs.next();
			System.out.println("수정여부"+success);
			
			rs.close();
			prst.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return success;
	}

	// 회원 가입
	public boolean userSignin(RegUser user) {
			boolean success = false;
			
			String sql = "INSERT INTO P_USER \n"
						+ "VALUES(P_USER_NO_SEQ.NEXTVAL, ?, ?, ?, ?, to_date(?, 'yyyy-mm-dd'))";
			System.out.println(sql);
			try {
				setCon();
				
				prst = conn.prepareStatement(sql);
				prst.setString(1, user.getU_id());
				prst.setString(2, user.getU_pass());
				prst.setString(3, user.getU_name());
				prst.setString(4, user.getU_mail());
				prst.setString(5, user.getU_date_s());
				
				rs = prst.executeQuery();
				
				success = rs.next();
				
				rs.close();
				prst.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
				
			return success;	
			
		}

	// 로그인
	public int login(String u_id, String u_pass) {
			boolean success = false;
			String sql = "SELECT U_ID, U_PASS\n"
						+ "FROM P_USER\n"
						+ "WHERE U_ID= ?";
			System.out.println(sql);
			
			try {
				setCon();
				
				prst = conn.prepareStatement(sql);
				prst.setString(1, u_id);
				rs = prst.executeQuery();
				
				if (rs.next()) {
					if(rs.getString("u_pass").equals(u_pass)) {
						return 1;
					} else {
						return 0;
					}
				}
				
				rs.close();
				prst.close();
				conn.close();
				
			} catch (SQLException e) {
				System.out.println("##### 에러내용");
				e.printStackTrace();
			}			
			return -1;	
		}	

	// 회원 검색
	public User userSearch(String u_id) {
		User user = new User();
		
		String sql = "SELECT * FROM P_USER WHERE u_id = ?";
		System.out.println(sql);
		try {
			setCon();
			
			prst = conn.prepareStatement(sql);
			prst.setString(1, u_id);
			rs = prst.executeQuery();
			
			if(rs.next()) {
				user.setU_no(rs.getInt("U_NO"));
				user.setU_id(rs.getString("U_ID"));
				user.setU_pass(rs.getString("U_PASS"));
				user.setU_name(rs.getString("U_NAME"));
				user.setU_mail(rs.getString("U_MAIL"));
				user.setU_date(rs.getDate("U_DATE"));
			}
			
			rs.close();
			prst.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		return user;
	}	
	
	public static void main(String[] args) {
		
		UserManagerService service = new UserManagerService();
//		RegUser user = new RegUser("2020-11-01");
//		user.setU_id("test");
//		user.setU_pass("test");
//		user.setU_name("test");
//		user.setU_mail("test@asdf");
//		service.userReg(user);
		
	}
}
