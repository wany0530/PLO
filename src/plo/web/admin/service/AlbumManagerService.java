package plo.web.admin.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import plo.web.admin.entity.Album;
import plo.web.admin.entity.RegAlbum;

public class AlbumManagerService {
	
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

	// 앨범 조회
	public ArrayList<Album> getAlbumList(){
		return getAlbumList(1, 99999);
	}
	
	// 앨범 조회
	public ArrayList<Album> getAlbumList(int page, int cnt) {
		ArrayList<Album> albumList = new ArrayList<Album>();
		String sql = "";
		
		int start = 1 + (page-1)*cnt;
		int end = page * cnt;
		
		
		sql = "SELECT * FROM (\n"
				+ "	SELECT ROWNUM num, alb.* FROM (\n"
				+ "		SELECT alb.*, art.art_name\n"
				+ "		  FROM P_ARTIST art, P_ALBUM alb\n"
				+ "		 WHERE art.art_no = alb.art_no\n"
				+ "		ORDER BY alb_no DESC\n"
				+ "	) alb\n"
				+ ") WHERE num BETWEEN ? AND ?";
		System.out.println(sql);
		try {
			setCon();
			
			prst = conn.prepareStatement(sql);
			prst.setInt(1, start);
			prst.setInt(2, end);
			rs = prst.executeQuery();
			
			while(rs.next()) {
				int alb_no = rs.getInt("alb_no");
				String alb_name = rs.getString("alb_name");
				String alb_shape = rs.getString("alb_shape");
				Date alb_date = rs.getDate("alb_date");
				String alb_img = rs.getString("alb_img");
				String alb_intro = rs.getString("alb_intro");
				int art_no = rs.getInt("art_no");
				String art_name = rs.getString("art_name");
				
				albumList.add(new Album(alb_no, alb_name, alb_shape, alb_date,
										alb_img, alb_intro, art_no, art_name));
			}
			
			rs.close();
			prst.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		return albumList;
	}
	
	// 등록된 앨범 수
	public int countAlbum() {
		String sql = "";
		int cnt = 0;
		
		sql = "SELECT count(*) cnt FROM P_ALBUM";
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

	// 앨범 상세
	public Album albumDetail(int album_no) {
		Album album = new Album();
		
		String sql = "SELECT alb.*, art.art_name\n"
				+ "     FROM P_ARTIST art, P_ALBUM alb\n"
				+ "    WHERE art.art_no = alb.art_no\n"
				+ "      AND alb.alb_no=?";
		System.out.println(sql);
		try {
			setCon();
			
			prst = conn.prepareStatement(sql);
			prst.setInt(1, album_no);
			rs = prst.executeQuery();
			
			if(rs.next()) {
				album.setAlb_no(rs.getInt("alb_no"));
				album.setAlb_name(rs.getString("alb_name"));
				album.setAlb_shape(rs.getString("alb_shape"));
				album.setAlb_date(rs.getDate("alb_date"));
				album.setAlb_img(rs.getString("alb_img"));
				album.setAlb_intro(rs.getString("alb_intro"));
				album.setArt_no(rs.getInt("art_no"));
				album.setArt_name(rs.getString("art_name"));
			}
			
			rs.close();
			prst.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		return album;
	}
	
	// 앨범 등록
	public boolean albumReg(RegAlbum album) {
		boolean success = false;
		
		String sql = "INSERT INTO P_ALBUM VALUES(P_ALBUM_NO_SEQ.NEXTVAL, ?, ?, to_date(?,'yyyy-mm-dd'), ?, ?, ?)";
		System.out.println(sql);
		try {
			setCon();
			
			prst = conn.prepareStatement(sql);
			prst.setString(1, album.getAlb_name());
			prst.setString(2, album.getAlb_shape());
			prst.setString(3, album.getAlb_date_s());
			prst.setString(4, album.getAlb_img());
			prst.setString(5, album.getAlb_intro());
			prst.setInt(6, album.getArt_no());
			
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
	
	// 앨범 삭제
	public boolean albumDel(int alb_no) {
		boolean success = false;
		
		String sql = "DELETE P_ALBUM WHERE alb_no = ?";
		System.out.println(sql);
		try {
			setCon();
			
			prst = conn.prepareStatement(sql);
			prst.setInt(1, alb_no);
			
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
	
	// 앨범 수정
	public boolean albumUpdate(RegAlbum album) {
		boolean success = false;
		
		String sql = "UPDATE P_ALBUM\n"
				+ "   SET alb_name = ?,\n"
				+ "   	   alb_shape = ?,\n"
				+ "   	   alb_date = to_date(?, 'yyyy-mm-dd'),\n"
				+ "   	   alb_img = ?,\n"
				+ "   	   alb_intro = ?,\n"
				+ "   	   art_no = ?\n"
				+ " WHERE alb_no = ?";
		System.out.println(sql);
		try {
			setCon();
			prst = conn.prepareStatement(sql);
			
			prst.setString(1, album.getAlb_name());
			prst.setString(2, album.getAlb_shape());
			prst.setString(3, album.getAlb_date_s());
			prst.setString(4, album.getAlb_img());
			prst.setString(5, album.getAlb_intro());
			prst.setInt(6, album.getArt_no());
			prst.setInt(7, album.getAlb_no());
			
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
