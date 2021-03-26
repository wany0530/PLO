package plo.web.admin.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import plo.web.admin.entity.Music;


public class MusicManagerService {
	
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

	// 음원 조회
	public ArrayList<Music> getAlbumList(){
		return getMusicList(1, 99999);
	}
	
	// 음원 조회
	public ArrayList<Music> getMusicList(int page, int cnt) {
		ArrayList<Music> musicList = new ArrayList<Music>();
		String sql = "";
		
		int start = 1 + (page-1)*cnt;
		int end = page * cnt;
		
		
		sql = "SELECT * FROM (\n"
				+ "	SELECT ROWNUM num, music.* FROM (\n"
				+ "		SELECT m.*, a.alb_name\n"
				+ "		  FROM P_MUSIC m, P_ALBUM a\n"
				+ "		 WHERE m.alb_no = a.alb_no\n"
				+ "		ORDER BY m.m_no DESC\n"
				+ "	) music\n"
				+ ") WHERE num BETWEEN ? AND ?";
		System.out.println(sql);
		try {
			setCon();
			
			prst = conn.prepareStatement(sql);
			prst.setInt(1, start);
			prst.setInt(2, end);
			rs = prst.executeQuery();
			
			while(rs.next()) {
				int m_no = rs.getInt("m_no");
				String m_name = rs.getString("m_name");
				int m_playnum = rs.getInt("m_playnum");
				String m_path = rs.getString("m_path");
				String m_lyrics = rs.getString("m_lyrics");
				int alb_no = rs.getInt("alb_no");
				String alb_name = rs.getString("alb_name");
				
				musicList.add(new Music(m_no, m_name, m_playnum, m_path,
										m_lyrics, alb_no, alb_name));
				
			}
			
			rs.close();
			prst.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		return musicList;
	}
	
	// 등록된 음원 수
	public int countMusic() {
		String sql = "";
		int cnt = 0;
		
		sql = "SELECT count(*) cnt FROM P_MUSIC";
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

	// 음원 상세
	public Music musicDetail(int music_no) {
		Music music = new Music();
		
		String sql = "SELECT m.*, alb.alb_name\n"
				+ "     FROM P_MUSIC m, P_ALBUM alb\n"
				+ "    WHERE m.alb_no = alb.alb_no\n"
				+ "      AND alb.alb_no=?";
		System.out.println(sql);
		try {
			setCon();
			
			prst = conn.prepareStatement(sql);
			prst.setInt(1, music_no);
			rs = prst.executeQuery();
			
			if(rs.next()) {
				music.setM_no(rs.getInt("m_no"));
				music.setM_name(rs.getString("m_name"));
				music.setM_playnum(rs.getInt("m_playnum"));
				music.setM_path(rs.getString("m_path"));
				music.setM_lyrics(rs.getString("m_lyrics"));
				music.setAlb_no(rs.getInt("alb_no"));
				music.setAlb_name(rs.getString("alb_name"));
			}
			
			rs.close();
			prst.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		return music;
	}
	
	// 음원 등록
	public boolean musicReg(Music music) {
		boolean success = false;
		
		String sql = "INSERT INTO P_MUSIC VALUES(P_MUSIC_NO_SEQ.NEXTVAL, ?, ?, ?, ?, ?)";
		System.out.println(sql);
		try {
			setCon();
			prst = conn.prepareStatement(sql);
			
			prst.setString(1, music.getM_name());
			prst.setInt(2, music.getM_playnum());
			prst.setString(3, music.getM_path());
			prst.setString(4, music.getM_lyrics());
			prst.setInt(5, music.getAlb_no());
			
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
	
	// 음원 삭제
	public boolean musicDel(int m_no) {
		boolean success = false;
		
		String sql = "DELETE P_MUSIC WHERE m_no = ?";
		System.out.println(sql);
		try {
			setCon();
			
			prst = conn.prepareStatement(sql);
			prst.setInt(1, m_no);
			
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
	
	// 음원 수정
	public boolean musicUpdate(Music music) {
		boolean success = false;
		
		String sql = "UPDATE P_MUSIC\n"
				+ "   SET m_name = ?,\n"
				+ "       m_playnum = ?,\n"
				+ "       m_path = ?,\n"
				+ "       m_lyrics = ?,\n"
				+ "       alb_no = ?\n"
				+ " WHERE m_no = ?";
		System.out.println(sql);
		try {
			setCon();
			prst = conn.prepareStatement(sql);
			
			prst.setString(1, music.getM_name());
			prst.setInt(2, music.getM_playnum());
			prst.setString(3, music.getM_path());
			prst.setString(4, music.getM_lyrics());
			prst.setInt(5, music.getAlb_no());
			prst.setInt(6, music.getM_no());
			
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
	
	public static void main(String[] args) {
		
//		ArtistManagerService service = new ArtistManagerService();
//		ArrayList<Artist> artists = service.getArtistList(1,2);
//		for(Artist artist : artists)
//			System.out.println(artist.getArt_name());
//		System.out.println(service.countArtist());
//		Artist detail = service.artistDetail(1);
//		System.out.println(detail.getArt_name());
//		
//		System.out.println(service.artistDel(6));
//		boolean test = service.artistUpdate(new Artist(7, "test(변경)","여자","그룹","img/asdf.png"));
//		System.out.println(test);
	}
}
