package plo.web.chart.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import plo.web.chart.DTO.Genre;
import plo.web.chart.DTO.Music;
import plo.web.chart.DTO.Mylist;

public class chartService {
	
	// 1. 데이터베이스 연결 처리
		private Connection con;
		// 2. 대화
		private Statement stmt;
		private PreparedStatement pstmt;
		// 3. 결과값 받는 객체..
		private ResultSet rs;
		//# 연결 처리 기능 메서드. (공통 메서드 - 연결)
		public void setCon() throws SQLException {
			// 1. driver 메모리 로딩.
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			// 2. 특정 서버.
			//		- 접속 정보 : 드라이버명 : @ip:port:sid
			String info = "jdbc:oracle:thin:@localhost:1521:xe";
			// 드라이버 매니저 객체를 통해서 Connection 객체를 생성
				con = DriverManager.getConnection(info, "scott", "tiger");
				System.out.println("접속 성공 !!! ^^ 하하하하");
		}
	
	// 많이들은 수 chart정렬	
	public ArrayList<Music> recentlychart(){
		ArrayList<Music> dlist = new ArrayList<Music>();
		try {
			setCon();
			String sql = "SELECT m_name, alb_name, art_name, alb_img , m_no, pal.ALB_NO, par.ART_NO\r\n"
					+ "FROM P_MUSIC pmu, P_ALBUM pal, P_ARTIST par \r\n"
					+ "WHERE pmu.ALB_NO = pal.ALB_NO AND pal.ART_NO = par.ART_NO \r\n"
					+ "ORDER BY pmu.M_PLAYNUM desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Music e = new Music(rs.getString("m_name"),rs.getString("alb_name"),rs.getString("art_name"),rs.getString("alb_img"), rs.getInt("m_no"), rs.getInt("alb_no"), rs.getInt("art_no"));
				dlist.add(e);
			}
			 rs.close();
	         pstmt.close();
	         con.close();
			
		} catch (SQLException e) {
			System.out.println("db문제");
			e.printStackTrace();
			e.getMessage();
		}catch (Exception e) {
			System.out.println("기타문제");
			e.printStackTrace();
			e.getMessage();
		}
		return dlist;
	}
	// 최근 등록된 노래 chart순서 
	public ArrayList<Music> defaultchart(){
		ArrayList<Music> recentlist = new ArrayList<Music>();
		try {
			setCon();
			String sql = "SELECT m_name, alb_name, art_name, alb_img , m_no, pal.ALB_NO, par.ART_NO \r\n"
					+ "FROM P_MUSIC pmu, P_ALBUM pal, P_ARTIST par\r\n"
					+ "WHERE pmu.ALB_NO = pal.ALB_NO AND pal.ART_NO = par.ART_NO\r\n"
					+ "ORDER BY pal.ALB_DATE";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Music e = new Music(rs.getString("m_name"),rs.getString("alb_name"),rs.getString("art_name"),rs.getString("alb_img"), rs.getInt("m_no"), rs.getInt("alb_no"), rs.getInt("art_no"));
				recentlist.add(e);
			}
			rs.close();
			pstmt.close();
			con.close();
			
		} catch (SQLException e) {
			System.out.println("db문제");
			e.printStackTrace();
			e.getMessage();
		}catch (Exception e) {
			System.out.println("기타문제");
			e.printStackTrace();
			e.getMessage();
		}
		return recentlist;
	}
	// 장르별 차트 리스트
	public ArrayList<Music> genre_chartList(int genre_no){
		ArrayList<Music> gclist = new ArrayList<Music>();
		try {
			setCon();
			String sql = "SELECT pmu.m_name, pal.alb_name, par.art_name, pal.alb_img , pmu.m_no, pal.ALB_NO, par.ART_NO \r\n"
					+ "FROM P_MUSIC pmu, P_ALBUM pal, P_ARTIST par, P_MUSIC_GENRE b, P_GENRE c\r\n"
					+ "WHERE pmu.ALB_NO = pal.ALB_NO AND pal.ART_NO = par.ART_NO AND\r\n"
					+ "pmu.M_NO = b.M_NO AND b.GENRE_CODE = c.GENRE_CODE AND c.GENRE_CODE = ?\r\n"
					+ "ORDER BY pmu.M_PLAYNUM DESC";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, genre_no);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Music e = new Music(rs.getString("m_name"),rs.getString("alb_name"),rs.getString("art_name"),rs.getString("alb_img"), rs.getInt("m_no"), rs.getInt("alb_no"), rs.getInt("art_no"));
				gclist.add(e);
			}
			rs.close();
			pstmt.close();
			con.close();
			
		} catch (SQLException e) {
			System.out.println("db문제");
			e.printStackTrace();
			e.getMessage();
		}catch (Exception e) {
			System.out.println("기타문제");
			e.printStackTrace();
			e.getMessage();
		}
		return gclist;
	}
	//내 보관함 리스트
	public ArrayList<Mylist> mylist(int u_no){
		ArrayList<Mylist> mylist = new ArrayList<Mylist>();
		try {
			setCon();
			con.setAutoCommit(false);
			String sql ="SELECT * FROM P_MYLIST WHERE U_NO = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, u_no);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Mylist m = new Mylist(rs.getInt("mylist_no"), rs.getString("mylist_name"),rs.getDate("mylist_date"),rs.getInt("u_no"));
				mylist.add(m);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			System.out.println("db문제");
			e.printStackTrace();
			e.getMessage();
		}catch (Exception e) {
			System.out.println("기타문제");
			e.printStackTrace();
			e.getMessage();
		}
		return mylist;
	}
	/*장르 조회*/
	public ArrayList<Genre> genre_list(){
		ArrayList<Genre> glist = new ArrayList<Genre>();
		try {
			setCon();
			con.setAutoCommit(false);
			String sql ="SELECT * FROM P_GENRE";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Genre g = new Genre(rs.getInt("genre_code"), rs.getString("genre_name"));
				glist.add(g);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			e.getMessage();
			System.out.println("DB문제");
		}catch (Exception e) {
			e.printStackTrace();
			e.getMessage();
			System.out.println("기타");
		}
		return glist;
	}
	// 재생목록 추가
	public void insPlaylist(int u_no, int m_no) {
		try {
			setCon();
			con.setAutoCommit(false);
			String sql="INSERT INTO P_PLAYLIST values(?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, u_no);
			pstmt.setInt(2, m_no);
			pstmt.executeUpdate();
			con.commit();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			e.getMessage();
			System.out.println("DB 처리 에러");
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
				e1.getMessage();
			}
		}catch (Exception e) {
			e.printStackTrace();
			e.getMessage();
		}
	}
	// 재생목록 삭제
	public void delPlaylist(int u_no, int m_no) {
		try {
			setCon();
			con.setAutoCommit(false);
			String sql="DELETE FROM P_PLAYLIST WHERE U_NO = ? AND M_NO = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, u_no);
			pstmt.setInt(2, m_no);
			pstmt.executeUpdate();
			con.commit();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("DB 처리 에러");
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}catch (Exception e) {
			e.printStackTrace();
			e.getMessage();
		}
	}
	// 내 리스트 생성
	public void create_Mylist(String mylist_title, int u_no) {
		try {
			setCon();
			con.setAutoCommit(false);
			String sql="INSERT INTO P_MYLIST VALUES(P_MYLIST_NO_SEQ.NEXTVAL, ?, SYSDATE, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mylist_title);
			pstmt.setInt(2, u_no);
			pstmt.executeUpdate();
			con.commit();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			e.getMessage();
			System.out.println("DB 처리 에러");
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
				e1.getMessage();
			}
		}catch (Exception e) {
			e.printStackTrace();
			e.getMessage();
		}
	}
	// 내 리스트 -> 곡넣기
	public void insMylist(int mylist_no, int mylist_m_no) {
		try {
			setCon();
			con.setAutoCommit(false);
			String sql="INSERT INTO P_LIST_MUSIC VALUES(P_LIST_MUSIC_NO_SEQ.NEXTVAL,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mylist_no);
			pstmt.setInt(2, mylist_m_no);
			pstmt.executeUpdate();
			con.commit();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			e.getMessage();
			System.out.println("DB 처리 에러");
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
				e1.getMessage();
			}
		}catch (Exception e) {
			e.printStackTrace();
			e.getMessage();
		}
	}
	// 좋아요 처리.
	public void LikeFunc(int u_no, int m_no) {
		try {
			setCon();
			con.setAutoCommit(false);
			String sql="INSERT INTO P_FAVOR_MUSIC VALUES(?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, u_no);
			pstmt.setInt(2, m_no);
			pstmt.executeUpdate();
			con.commit();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			e.getMessage();
			System.out.println("DB 처리 에러");
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
				e1.getMessage();
			}
		}catch (Exception e) {
			e.printStackTrace();
			e.getMessage();
		}
	}

	public static void main(String[] args) {
		chartService dao = new chartService();
		dao.LikeFunc(1, 40);
	}
}
