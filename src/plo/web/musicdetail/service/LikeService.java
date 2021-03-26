package plo.web.musicdetail.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import plo.web.musicdetail.entity.LikeMusic;

public class LikeService {
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
	
	// 곡 좋아요
	public void insMusicLike(LikeMusic lm) {
		String sql = "INSERT INTO P_FAVOR_MUSIC VALUES(?,?)";
		
		try {
			setCon();
			conn.setAutoCommit(false);
			
			prst = conn.prepareStatement(sql);
			prst.setInt(1, lm.getU_no());
			prst.setInt(2, lm.getM_no());
			prst.executeUpdate();
			
			conn.commit();
			prst.close();
			conn.close();
			
		} catch (SQLException e) {
			System.out.println("DB에러 : " + sql);
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}
	// 곡 좋아요 취소
	public void delMusicLike(LikeMusic lm) {
		String sql = "DELETE FROM p_favor_music\r\n"
				+ "WHERE u_no=? AND m_no=?";
		
		try {
			setCon();
			conn.setAutoCommit(false);
			
			prst = conn.prepareStatement(sql);
			prst.setInt(1, lm.getU_no());
			prst.setInt(2, lm.getM_no());
			prst.executeUpdate();
			
			conn.commit();
			prst.close();
			conn.close();
			
		} catch (SQLException e) {
			System.out.println("DB에러 : " + sql);
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	// 좋아요 체크
	public boolean isLikeMusic(LikeMusic lm) {
		boolean isLM = false;
		String sql = "SELECT * FROM p_favor_music WHERE u_no=? AND m_no = ?";
		
		try {
			setCon();
			prst = conn.prepareStatement(sql);
			prst.setInt(1, lm.getU_no());
			prst.setInt(2, lm.getM_no());
			rs = prst.executeQuery();
			
			isLM = rs.next();
			
			rs.close();
			prst.close();
			conn.close();
			
		} catch (SQLException e) {
			System.out.println("DB 에러 : " + e.getMessage());
			System.out.println(sql);
		} catch (Exception e) {
			System.out.println("일반 에러 : " + e.getMessage());
		}
		return isLM;
	}
	
	public static void main(String[] args) {
		LikeService ls = new LikeService();
//		System.out.println(ls.isLikeMusic(2, 2));
	
	}
}
