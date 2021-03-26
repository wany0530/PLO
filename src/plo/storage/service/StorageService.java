package plo.storage.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import plo.storage.entity.LikeAlbum;
import plo.storage.entity.LikeArtist;
import plo.storage.entity.ManyPlay;
import plo.storage.entity.MusicChart;
import plo.storage.entity.Mylist;
import plo.storage.entity.RecentPlay;

public class StorageService {
	private Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public void setCon() throws SQLException {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String info="jdbc:oracle:thin:@localhost:1521:xe";
		con=DriverManager.getConnection(info, "scott", "tiger");
		System.out.println("접속 성공");
	}
	
	public ArrayList<LikeAlbum> likeAlbumList(int u_no){
		ArrayList<LikeAlbum> alist=new ArrayList<LikeAlbum>();
		try {
			setCon();
			String sql="SELECT alb_name, alb_shape, alb_img, \r\n"
					+ "		alb_date, art_name, genre_name\r\n"
					+ "FROM P_USER u, P_FAVOR_ALBUM pfa, P_ALBUM alb, \r\n"
					+ "		P_ARTIST art, P_MUSIC_GENRE pmg, \r\n"
					+ "		P_GENRE pg, P_MUSIC pm \r\n"
					+ "WHERE u.U_NO = pfa.U_NO \r\n"
					+ "		AND alb.ALB_NO = pfa.ALB_NO\r\n"
					+ "		AND alb.ART_NO = art.ART_NO \r\n"
					+ "		AND alb.ALB_NO = pm.ALB_NO \r\n"
					+ "		AND pm.ALB_NO = pmg.M_NO \r\n"
					+ "		AND pg.GENRE_CODE = pmg.GENRE_CODE \r\n"
					+ "		AND u.u_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, u_no);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				LikeAlbum m=new LikeAlbum(
						rs.getString(1),
						rs.getString(2),
						rs.getString(3),
						rs.getDate(4),
						rs.getString(5),
						rs.getString(6)
						);
				alist.add(m);
			}
			rs.close();
			pstmt.close();
			con.close();
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("DB 관련 에러");
			System.out.println(e.getMessage());
		} catch(Exception e) {
			System.out.println("기타 에러");
			System.out.println(e.getMessage());
		}
		return alist;
	}
	
	
	public ArrayList<LikeArtist> likeArtistList(int u_no){
		ArrayList<LikeArtist> artlist=new ArrayList<LikeArtist>();
		try {
			setCon();
			String sql="SELECT DISTINCT ART_NAME, ART_IMG, ART_GROUP, ART_GENDER, ART.ART_NO \r\n"
					+ "	FROM P_ARTIST art, P_USER u, P_FAVOR_ARTIST pfa\r\n"
					+ "	WHERE u.U_NO =pfa.U_NO \r\n"
					+ "		AND pfa.ART_NO = art.ART_NO \r\n"
					+ "		AND u.u_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, u_no);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				LikeArtist a=new LikeArtist(
						rs.getString(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getInt(5)
						);
				artlist.add(a);
			}
			rs.close();
			pstmt.close();
			con.close();
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("DB 관련 에러");
			System.out.println(e.getMessage());
		} catch(Exception e) {
			System.out.println("기타 에러");
			System.out.println(e.getMessage());
		}
		return artlist;
	}
	
	public ArrayList<String> artGenreList(int art_no, int u_no){
		ArrayList<String> glist=new ArrayList<String>();
		try {
			setCon();
			String sql="SELECT genre_name \r\n"
					+ "	FROM P_ARTIST art, P_ALBUM alb, P_MUSIC pm, \r\n"
					+ "		P_GENRE pg, P_MUSIC_GENRE pmg,\r\n"
					+ "		P_USER u, P_FAVOR_ARTIST pfa\r\n"
					+ "	WHERE art.ART_NO = alb.ALB_NO \r\n"
					+ "		AND alb.ALB_NO = pm.M_NO \r\n"
					+ "		AND pm.M_NO = pmg.M_NO \r\n"
					+ "		AND pmg.GENRE_CODE = pg.GENRE_CODE\r\n"
					+ "		AND u.U_NO =pfa.U_NO \r\n"
					+ "		AND pfa.ART_NO = art.ART_NO \r\n"
					+ "		AND art.ART_NO = ?\r\n"
					+ "		AND u.u_no = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, art_no);
			pstmt.setInt(2, u_no);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				glist.add(rs.getString(1));
			}
			rs.close();
			pstmt.close();
			con.close();
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("DB 관련 에러");
			System.out.println(e.getMessage());
		} catch(Exception e) {
			System.out.println("기타 에러");
			System.out.println(e.getMessage());
		}
		return glist;
	}
	
	public int mylist_Mcnt(int u_no,int mylist_no){
		int mcnt=0;
		try {
			setCon();
			String sql="SELECT count(*) listmusic_cnt\r\n"
					+ "	FROM p_list_music plm, P_MYLIST pm, P_USER pu\r\n"
					+ "	WHERE pu.U_NO = pm.U_NO \r\n"
					+ "		AND pm.MYLIST_NO = plm.MYLIST_NO \r\n"
					+ "		AND pu.u_no=?\r\n"
					+ "		AND plm.mylist_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, u_no);
			pstmt.setInt(2, mylist_no);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				mcnt=rs.getInt(1);
			}
			rs.close();
			pstmt.close();
			con.close();
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("DB 관련 에러");
			System.out.println(e.getMessage());
		} catch(Exception e) {
			System.out.println("기타 에러");
			System.out.println(e.getMessage());
		}
		return mcnt;
	}
	
	public String mylist_Img(int u_no,int mylist_no){
		String mylist_img="";
		try {
			setCon();
			String sql="SELECT alb_img\r\n"
					+ "FROM P_MUSIC pm, P_ALBUM pa\r\n"
					+ "WHERE pm.ALB_NO = pa.ALB_NO\r\n"
					+ "	AND m_no=(\r\n"
					+ "			SELECT m_no\r\n"
					+ "			FROM p_list_music\r\n"
					+ "			WHERE listadd_no=(\r\n"
					+ "					SELECT max(listadd_no)\r\n"
					+ "					FROM P_MYLIST pml, P_LIST_MUSIC plm, P_USER pu \r\n"
					+ "					WHERE pml.MYLIST_NO = plm.MYLIST_NO\r\n"
					+ "						AND pu.U_NO = pml.U_NO\r\n"
					+ "						and pu.U_no = ?\r\n"
					+ "						AND plm.mylist_no=?))";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, u_no);
			pstmt.setInt(2, mylist_no);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				mylist_img=rs.getString(1);
			}
			rs.close();
			pstmt.close();
			con.close();
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("DB 관련 에러");
			System.out.println(e.getMessage());
		} catch(Exception e) {
			System.out.println("기타 에러");
			System.out.println(e.getMessage());
		}
		return mylist_img;
	}
	
	public ArrayList<Mylist> mylist_Info(int u_no){
		ArrayList<Mylist> mlist=new ArrayList<Mylist>();
		try {
			setCon();
			String sql="SELECT DISTINCT MYLIST_NAME, MYLIST_DATE, pml.MYLIST_NO\r\n"
					+ "	FROM P_MYLIST pml, P_LIST_MUSIC plm, P_MUSIC pm, \r\n"
					+ "		P_ALBUM pa , P_USER pu \r\n"
					+ "	WHERE pml.MYLIST_NO = plm.MYLIST_NO \r\n"
					+ "		AND plm.M_NO = pm.M_NO \r\n"
					+ "		AND pm.ALB_NO = pa.ALB_NO\r\n"
					+ "		AND pu.U_NO = pml.U_NO\r\n"
					+ "		AND pu.U_no =?"
					+ " ORDER BY MYLIST_DATE DESC";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, u_no);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Mylist m=new Mylist(
						rs.getString(1),
						rs.getDate(2),
						rs.getInt(3)
					);
				mlist.add(m);
			}
			rs.close();
			pstmt.close();
			con.close();
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("DB 관련 에러");
			System.out.println(e.getMessage());
		} catch(Exception e) {
			System.out.println("기타 에러");
			System.out.println(e.getMessage());
		}
		return mlist;
	}
	
	public ArrayList<MusicChart> likeMusicList(int u_no){
		ArrayList<MusicChart> lmlist=new ArrayList<MusicChart>();
		try {
			setCon();
			String sql="SELECT m_name, alb_name, alb_img, art_name\r\n"
					+ " FROM P_USER pu, P_FAVOR_MUSIC pfm, P_MUSIC pm,\r\n"
					+ "		P_ALBUM alb, P_ARTIST art\r\n"
					+ " WHERE pu.u_no = pfm.U_NO\r\n"
					+ "		AND pfm.M_NO = pm.M_NO \r\n"
					+ "		AND pm.ALB_NO = alb.ALB_NO \r\n"
					+ "		AND alb.ART_NO = art.ART_NO\r\n"
					+ "		AND pu.u_no =?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, u_no);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				MusicChart m=new MusicChart(
						rs.getString(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4)
					);
				lmlist.add(m);
			}
			rs.close();
			pstmt.close();
			con.close();
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("DB 관련 에러");
			System.out.println(e.getMessage());
		} catch(Exception e) {
			System.out.println("기타 에러");
			System.out.println(e.getMessage());
		}
		return lmlist;
	}
	
	public ArrayList<RecentPlay> recentPlaylist(int u_no){
		ArrayList<RecentPlay> rlist=new ArrayList<RecentPlay>();
		try {
			setCon();
			String sql="SELECT m_no, max(log_date) log_date \r\n"
					+ "FROM (SELECT m_no,log_date \r\n"
					+ "		FROM p_playlog \r\n"
					+ "		WHERE u_no=?) \r\n"
					+ "GROUP BY m_no \r\n"
					+ "ORDER BY log_date desc";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, u_no);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				RecentPlay m=new RecentPlay(
						rs.getInt(1),
						rs.getDate(2)
					);
				rlist.add(m);
			}
			rs.close();
			pstmt.close();
			con.close();
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("DB 관련 에러");
			System.out.println(e.getMessage());
		} catch(Exception e) {
			System.out.println("기타 에러");
			System.out.println(e.getMessage());
		}
		return rlist;
	}
	
	
	public MusicChart musicInfolist(int u_no,int m_no){
		MusicChart milist=new MusicChart();
		try {
			setCon();
			String sql="SELECT DISTINCT m_name, alb_name, alb_img, art_name\r\n"
					+ "	FROM P_USER pu, P_PLAYLOG pp, P_MUSIC pm,\r\n"
					+ "		P_ALBUM alb, P_ARTIST art\r\n"
					+ "	WHERE pu.u_no = pp.U_NO\r\n"
					+ "		AND pp.M_NO = pm.M_NO \r\n"
					+ "		AND pm.ALB_NO = alb.ALB_NO \r\n"
					+ "		AND alb.ART_NO = art.ART_NO\r\n"
					+ "		AND pu.u_no=?\r\n"
					+ "		AND pp.m_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, u_no);
			pstmt.setInt(2, m_no);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				milist=new MusicChart(
							rs.getString(1),
							rs.getString(2),
							rs.getString(3),
							rs.getString(4)
						);
			}
			rs.close();
			pstmt.close();
			con.close();
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("DB 관련 에러");
			System.out.println(e.getMessage());
		} catch(Exception e) {
			System.out.println("기타 에러");
			System.out.println(e.getMessage());
		}
		return milist;
	}
	
	public int musicPlayCnt(int u_no,int m_no){
		int mpcnt=0;
		try {
			setCon();
			String sql="SELECT count(*) \r\n"
					+ " FROM p_playlog \r\n"
					+ " WHERE u_no=? \r\n"
					+ " 	AND m_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, u_no);
			pstmt.setInt(2, m_no);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				mpcnt=rs.getInt(1);
			}
			rs.close();
			pstmt.close();
			con.close();
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("DB 관련 에러");
			System.out.println(e.getMessage());
		} catch(Exception e) {
			System.out.println("기타 에러");
			System.out.println(e.getMessage());
		}
		return mpcnt;
	}
	
	
	public ArrayList<ManyPlay> manyPlaylist(int u_no){
		ArrayList<ManyPlay> mlist=new ArrayList<ManyPlay>();
		try {
			setCon();
			String sql="SELECT m_no, count(*) cnt \r\n"
					+ " FROM p_playlog \r\n"
					+ " WHERE u_no=?\r\n"
					+ " GROUP BY m_no \r\n"
					+ " ORDER BY cnt desc";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, u_no);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ManyPlay m=new ManyPlay(
						rs.getInt(1),
						rs.getInt(2)
					);
				mlist.add(m);
			}
			rs.close();
			pstmt.close();
			con.close();
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("DB 관련 에러");
			System.out.println(e.getMessage());
		} catch(Exception e) {
			System.out.println("기타 에러");
			System.out.println(e.getMessage());
		}
		return mlist;
	}
	
	public ArrayList<MusicChart> myListDetaillist(int u_no, int mylist_no){
		ArrayList<MusicChart> mdlist=new ArrayList<MusicChart>();
		try {
			setCon();
			String sql="SELECT m_name, alb_name, alb_img, art_name\r\n"
					+ " FROM P_USER pu, P_MYLIST pml, P_LIST_MUSIC plm,\r\n"
					+ "		P_MUSIC pm, P_ALBUM alb, P_ARTIST art\r\n"
					+ " WHERE pu.U_NO = pml.U_NO \r\n"
					+ "		AND pml.MYLIST_NO = plm.MYLIST_NO \r\n"
					+ "		AND plm.M_NO = pm.M_NO \r\n"
					+ "		AND pm.ALB_NO = alb.ALB_NO \r\n"
					+ "		AND alb.ALB_NO = art.ART_NO \r\n"
					+ "		AND pml.U_NO = ?\r\n"
					+ "		AND pml.MYLIST_NO = ?\r\n"
					+ "	ORDER BY plm.LISTADD_NO DESC";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, u_no);
			pstmt.setInt(2, mylist_no);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				MusicChart m=new MusicChart(
						rs.getString(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4)
					);
				mdlist.add(m);
			}
			rs.close();
			pstmt.close();
			con.close();
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("DB 관련 에러");
			System.out.println(e.getMessage());
		} catch(Exception e) {
			System.out.println("기타 에러");
			System.out.println(e.getMessage());
		}
		return mdlist;
	}
	
	
	public Mylist mylist_detail_Info(int u_no, int mylist_no){
		Mylist mdinfo=new Mylist();
		try {
			setCon();
			String sql="SELECT DISTINCT MYLIST_NAME, MYLIST_DATE, pml.MYLIST_NO\r\n"
					+ "	FROM P_MYLIST pml, P_LIST_MUSIC plm, P_MUSIC pm, \r\n"
					+ "		P_ALBUM pa , P_USER pu \r\n"
					+ "	WHERE pml.MYLIST_NO = plm.MYLIST_NO \r\n"
					+ "		AND plm.M_NO = pm.M_NO \r\n"
					+ "		AND pm.ALB_NO = pa.ALB_NO\r\n"
					+ "		AND pu.U_NO = pml.U_NO\r\n"
					+ "		AND pu.U_no = ?\r\n"
					+ "		AND pml.MYLIST_NO = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, u_no);
			pstmt.setInt(2, mylist_no);
			rs=pstmt.executeQuery();
			if(rs.next()) {
					mdinfo=new Mylist(
						rs.getString(1),
						rs.getDate(2),
						rs.getInt(3)
					);
			}
			rs.close();
			pstmt.close();
			con.close();
			
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("DB 관련 에러");
			System.out.println(e.getMessage());
		} catch(Exception e) {
			System.out.println("기타 에러");
			System.out.println(e.getMessage());
		}
		return mdinfo;
	}
	/*
	public int mylist_no(String mylist_name, int u_no){
		int mylist_no=0;
		try {
			setCon();
			String sql="SELECT MYLIST_NO \r\n"
					+ " FROM P_MYLIST\r\n"
					+ " WHERE MYLIST_NAME = ?\r\n"
					+ "		AND U_NO = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, mylist_name);
			pstmt.setInt(2, u_no);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				mylist_no=rs.getInt(1);
			}
			rs.close();
			pstmt.close();
			con.close();
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("DB 관련 에러");
			System.out.println(e.getMessage());
		} catch(Exception e) {
			System.out.println("기타 에러");
			System.out.println(e.getMessage());
		}
		return mylist_no;
	}
	*/
	
	public int likeNoAlb_name(String alb_name){
		int alb_no=0;
		try {
			setCon();
			String sql="SELECT ALB_NO \r\n"
					+ " FROM P_ALBUM \r\n"
					+ " WHERE ALB_NAME = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, alb_name);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				alb_no=rs.getInt(1);
			}
			rs.close();
			pstmt.close();
			con.close();
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("DB 관련 에러");
			System.out.println(e.getMessage());
		} catch(Exception e) {
			System.out.println("기타 에러");
			System.out.println(e.getMessage());
		}
		return alb_no;
	}
	
	public void likeNoAlbum(int u_no, int alb_no) {
		// 1. 접속 autocommit(false)
		try {
			setCon();
			// 2. 대화
			con.setAutoCommit(false);
			String sql="DELETE \r\n"
					+ " FROM P_FAVOR_ALBUM \r\n"
					+ " WHERE U_NO = ? \r\n"
					+ "		AND ALB_NO = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, u_no);
			pstmt.setInt(2, alb_no);
			pstmt.executeUpdate(); 
			con.commit(); 
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("db 처리 에러");
			try {
				con.rollback();
				System.out.println("에러 발생으로 원복 처리");
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
				System.out.println("rollback에 문제발생");
			}
		} catch (Exception e) {
			System.out.println("일반 에러");
		}
	}
	
	
	public int likeNoArt_name(String art_name){
		int art_no=0;
		try {
			setCon();
			String sql="SELECT ART_NO \r\n"
					+ " FROM P_ARTIST \r\n"
					+ " WHERE ART_NAME = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, art_name);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				art_no=rs.getInt(1);
			}
			rs.close();
			pstmt.close();
			con.close();
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("DB 관련 에러");
			System.out.println(e.getMessage());
		} catch(Exception e) {
			System.out.println("기타 에러");
			System.out.println(e.getMessage());
		}
		return art_no;
	}
	
	public void likeNoArtist(int u_no, int art_no) {
		// 1. 접속 autocommit(false)
		try {
			setCon();
			// 2. 대화
			con.setAutoCommit(false);
			String sql="DELETE \r\n"
					+ " FROM P_FAVOR_ARTIST \r\n"
					+ " WHERE U_NO = ? \r\n"
					+ "		AND ART_NO = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, u_no);
			pstmt.setInt(2, art_no);
			pstmt.executeUpdate(); 
			con.commit(); 
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("db 처리 에러");
			try {
				con.rollback();
				System.out.println("에러 발생으로 원복 처리");
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
				System.out.println("rollback에 문제발생");
			}
		} catch (Exception e) {
			System.out.println("일반 에러");
		}
	}
	
	
	public static void main(String[] args) {
		
//		StorageService dao = new StorageService();
	}
}
