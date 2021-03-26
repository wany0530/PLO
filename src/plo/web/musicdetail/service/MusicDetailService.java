package plo.web.musicdetail.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import plo.web.musicdetail.entity.MusicDetail;
import plo.web.musicdetail.entity.PlayLog;

public class MusicDetailService {
	
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
	
	public MusicDetail getMusicDetail(int m_no) {
		MusicDetail md = null;
		String sql = "SELECT M_NO, M_NAME, M_PATH, M_LYRICS, pa2.ALB_NO AS alb_no, alb_name, pa.ART_no AS art_no, art_name\r\n"
				+ "FROM P_MUSIC pm, P_ALBUM pa2, P_ARTIST pa\r\n"
				+ "WHERE pm.ALB_NO=pa2.ALB_NO \r\n"
				+ "	AND pa2.ART_NO =pa.ART_NO\r\n"
				+ "	AND m_no=?";		
		try {
			setCon();
			prst = conn.prepareStatement(sql);
			prst.setInt(1, m_no);
			rs = prst.executeQuery();
			
//int m_no, String m_name, String m_path, String m_lyrics, String alb_name, String art_name
			if(rs.next()) {
				md = new MusicDetail(rs.getInt("m_no"), rs.getString("m_name"),
						rs.getString("m_path"), rs.getString("m_lyrics"), rs.getInt("alb_no"),
						rs.getString("alb_name"), rs.getInt("art_no"), rs.getString("art_name"));
			}
			
			rs.close();
			prst.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("DB 관련 에러 : " + e.getMessage());
			System.out.println(sql);
		} catch(Exception e) {
			System.out.println("기타 에러 : " + e.getMessage());
		}
		
		return md;
	}
	public void insPlayLog(PlayLog pl) {
		String sql = "INSERT INTO P_PLAYLOG VALUES(P_PLAYLOG_NO_SEQ.NEXTVAL, SYSDATE, ?, ?)";
		
		try {
			setCon();
			conn.setAutoCommit(false);
			
			prst = conn.prepareStatement(sql);
			prst.setInt(1, pl.getU_no());
			prst.setInt(2, pl.getM_no());
			prst.executeUpdate();
			
			conn.commit();
			prst.close();
			conn.close();
			
		} catch (SQLException e) {
			System.out.println("DB에러 : " + sql);
			System.out.println(e.getMessage());
			System.out.println(pl.getU_no());
			System.out.println(pl.getM_no());
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}
	public static void main(String[] args) {
//		MusicDetailService ms = new MusicDetailService();
//		MusicDetail md = ms.getMusicDetail(1);
//		System.out.println(md.getM_name() + " : " + md.getArt_name());

	}

}
