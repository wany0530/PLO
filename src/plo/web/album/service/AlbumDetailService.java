package plo.web.album.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import plo.web.album.entity.AlbumDetail;
import plo.web.album.entity.AlbumDetail2;


public class AlbumDetailService {
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String id = "scott";
	private String pw = "tiger";
	
	private Connection conn;
	private PreparedStatement pstmt;
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
	
	public ArrayList<AlbumDetail> getAlbumList(int alb_no) {
		ArrayList<AlbumDetail> alblist = new ArrayList<AlbumDetail>();
		/*
		String sql = " SELECT pl.alb_no, ALB_NAME, ALB_IMG ,\r\n"
				+ "		art_name ,art_group, M_NAME, genre_name\r\n"
				+ "FROM P_ALBUM pl, P_ARTIST pr, P_MUSIC pm, \r\n"
				+ "	 P_GENRE pg, P_MUSIC_GENRE pmg\r\n"
				+ "WHERE pl.ALB_NO = pm.M_ALB_NO \r\n"
				+ "	AND pl.ART_NO = pr.ART_NO \r\n"
				+ "	AND pg.GENRE_CODE = pmg.GENRE_CODE	\r\n"
				+ "	AND pm.M_NO = pmg.M_NO\r\n"
				+ "	AND pl.alb_name = ? ";	
	*/
		
		
		String sql = " SELECT pl.alb_no, ALB_NAME, ALB_IMG ,\r\n"
					+ "		art_name ,art_group, M_NAME, genre_name\r\n"
					+ "FROM P_ALBUM pl, P_ARTIST pr, P_MUSIC pm, \r\n"
					+ "	 P_GENRE pg, P_MUSIC_GENRE pmg\r\n"
					+ "WHERE pl.ALB_NO = pm.ALB_NO \r\n"
					+ "	AND pl.ART_NO = pr.ART_NO \r\n"
					+ "	AND pg.GENRE_CODE = pmg.GENRE_CODE	\r\n"
					+ "	AND pm.M_NO = pmg.M_NO\r\n"
					+ "	AND pl.ALB_NO = ? ";			
	
		
		try {
			setCon();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, alb_no);
			rs = pstmt.executeQuery();
			
			System.out.println(sql);
			
//			int alb_no, String alb_name, String alb_img, String art_name, 
//			String art_group, String m_name,String genre_name
			while(rs.next()) {
				System.out.println("## 데이터가 있음");
				
				AlbumDetail ad = new AlbumDetail(rs.getInt("alb_no"), rs.getString("alb_name"),
									rs.getString("alb_img"), rs.getString("art_name"),
									rs.getString("art_group"), rs.getString("m_name")
									, rs.getString("genre_name"));
				alblist.add(ad);					
			}		
			rs.close();
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("DB 관련 에러 : " + e.getMessage());
			System.out.println(sql);
		} catch(Exception e) {
			System.out.println("기타 에러 : " + e.getMessage());
		}
		
		return alblist;
	}
	
	public AlbumDetail getAlbumDetail(int alb_no) {
		AlbumDetail ad = null;
		String sql = " SELECT pl.alb_no, ALB_NAME, ALB_IMG ,\r\n"
					+ "		art_name ,art_group, M_NAME, genre_name\r\n"
					+ "FROM P_ALBUM pl, P_ARTIST pr, P_MUSIC pm, \r\n"
					+ "	 P_GENRE pg, P_MUSIC_GENRE pmg\r\n"
					+ "WHERE pl.ALB_NO = pm.ALB_NO \r\n"
					+ "	AND pl.ART_NO = pr.ART_NO \r\n"
					+ "	AND pg.GENRE_CODE = pmg.GENRE_CODE	\r\n"
					+ "	AND pm.M_NO = pmg.M_NO\r\n"
					+ "	AND pl.ALB_NO = ? ";		
		try {
			setCon();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, alb_no);
			rs = pstmt.executeQuery();
			
			System.out.println(sql);
			
//			int alb_no, String alb_name, String alb_img, String art_name, 
//			String art_group, String m_name,String genre_name
			if(rs.next()) {
				System.out.println("## 데이터가 있음");
				
				ad = new AlbumDetail(rs.getInt("alb_no"), rs.getString("alb_name"),
									rs.getString("alb_img"), rs.getString("art_name"),
									rs.getString("art_group"), rs.getString("m_name")
									, rs.getString("genre_name"));				
			} else {
				System.out.println("## 데이터 없음");
			}			
			rs.close();
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("DB 관련 에러 : " + e.getMessage());
			System.out.println(sql);
		} catch(Exception e) {
			System.out.println("기타 에러 : " + e.getMessage());
		}
		
		return ad;
	}
	
	
	public AlbumDetail2 getAlbumDetail2(int alb_no) {
		AlbumDetail2 ad2 = null;
		String sql = " SELECT pl.alb_no, ALB_NAME, ALB_IMG ,\r\n"
					+ "	art_name ,art_group, genre_name, ALB_INTRO \r\n"
					+ "FROM P_ALBUM pl, P_ARTIST pr, P_MUSIC pm,\r\n"
					+ "	 P_GENRE pg, P_MUSIC_GENRE pmg\r\n"
					+ "WHERE pl.ALB_NO = pm.ALB_NO \r\n"
					+ "	AND pl.ART_NO = pr.ART_NO \r\n"
					+ "	AND pg.GENRE_CODE = pmg.GENRE_CODE\r\n"
					+ "	AND pm.M_NO = pmg.M_NO\r\n"
					+ "	AND pl.ALB_NO = ? ";		
		try {
			setCon();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, alb_no);
			rs = pstmt.executeQuery();
			
			System.out.println(sql);
			
//			int alb_no, String alb_name, String alb_img, String art_name, 
//			String art_group, String m_name,String genre_name
			if(rs.next()) {
				System.out.println("## 데이터가 있음");
				
				ad2 = new AlbumDetail2(rs.getInt("alb_no"), rs.getString("alb_name"),
						rs.getString("alb_img"), rs.getString("art_name"),
						rs.getString("art_group"), rs.getString("genre_name")
						, rs.getString("alb_intro"));
			} else {
				System.out.println("## 데이터 없음");
			}			
			rs.close();
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("DB 관련 에러 : " + e.getMessage());
			System.out.println(sql);
		} catch(Exception e) {
			System.out.println("기타 에러 : " + e.getMessage());
		}
		
		return ad2;
	}
	
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
