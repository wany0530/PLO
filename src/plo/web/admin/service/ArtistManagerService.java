package plo.web.admin.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import plo.web.admin.entity.Artist;

public class ArtistManagerService {
	
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

	// 아티스트 조회
	public ArrayList<Artist> getArtistList(){
		return getArtistList(1, 99999);
	}
	
	// 아티스트 조회
	public ArrayList<Artist> getArtistList(int page, int cnt) {
		ArrayList<Artist> artistList = new ArrayList<Artist>();
		String sql = "";
		
		int start = 1 + (page-1)*cnt;
		int end = page * cnt;
		
		
		sql = "SELECT * FROM (\n"
				+ "	SELECT ROWNUM num, u.* FROM (\n"
				+ "		SELECT * FROM P_ARTIST ORDER BY ART_NO DESC\n"
				+ "	) u\n"
				+ ") WHERE num BETWEEN ? AND ?";
		try {
			setCon();
			
			prst = conn.prepareStatement(sql);
			prst.setInt(1, start);
			prst.setInt(2, end);
			rs = prst.executeQuery();
			
			while(rs.next()) {
				int no = rs.getInt("ART_NO");
				String name = rs.getString("ART_NAME");
				String gender = rs.getString("ART_GENDER");
				String group = rs.getString("ART_GROUP");
				String img = rs.getString("ART_IMG");
				
				artistList.add(new Artist(no, name, gender, group, img));
			}
			
			rs.close();
			prst.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		return artistList;
	}
	
	// 등록된 아티스트 수
	public int countArtist() {
		String sql = "";
		int cnt = 0;
		
		sql = "SELECT count(*) cnt FROM P_ARTIST";
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

	// 아티스트 상세
	public Artist artistDetail(int art_no) {
		Artist artist = new Artist();
		
		String sql = "SELECT * FROM P_ARTIST WHERE art_no = ?";
		System.out.println(sql);
		try {
			setCon();
			
			prst = conn.prepareStatement(sql);
			prst.setInt(1, art_no);
			rs = prst.executeQuery();
			
			if(rs.next()) {
				artist.setArt_no(rs.getInt("ART_NO"));
				artist.setArt_name(rs.getString("ART_NAME"));
				artist.setArt_gender(rs.getString("ART_GENDER"));
				artist.setArt_group(rs.getString("ART_GROUP"));
				artist.setArt_img(rs.getString("ART_IMG"));
			}
			
			rs.close();
			prst.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		return artist;
	}
	
	// 아티스트 등록
	public boolean artistReg(Artist artist) {
		boolean success = false;
		
		String sql = "INSERT INTO P_ARTIST \n"
			+ "VALUES(P_ARTIST_NO_SEQ.NEXTVAL, ?, ?, ?, ?)";
		System.out.println(sql);
		try {
			setCon();
			
			prst = conn.prepareStatement(sql);
			prst.setString(1, artist.getArt_name());
			prst.setString(2, artist.getArt_gender());
			prst.setString(3, artist.getArt_group());
			prst.setString(4, artist.getArt_img());
			
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
	
	// 아티스트 삭제
	public boolean artistDel(int art_no) {
		boolean success = false;
		
		String sql = "DELETE P_ARTIST WHERE art_no = ?";
		System.out.println(sql);
		try {
			setCon();
			
			prst = conn.prepareStatement(sql);
			prst.setInt(1, art_no);
			
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
	
	// 아티스트 수정
	public boolean artistUpdate(Artist artist) {
		boolean success = false;
		
		String sql = "UPDATE P_ARTIST\n"
				+ "   SET art_name = ?,\n"
				+ "   	  art_gender = ?,\n"
				+ "   	  art_group = ?,\n"
				+ "   	  art_img = ?\n"
				+ " WHERE art_no = ?";
		System.out.println(sql);
		try {
			setCon();
			
			prst = conn.prepareStatement(sql);
			prst.setString(1, artist.getArt_name());
			prst.setString(2, artist.getArt_gender());
			prst.setString(3, artist.getArt_group());
			prst.setString(4, artist.getArt_img());
			prst.setInt(5, artist.getArt_no());
			
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
