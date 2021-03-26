package plo.web.mainSearch.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import plo.web.mainSearch.entity.Album;
import plo.web.mainSearch.entity.Artist;
import plo.web.mainSearch.entity.Lyrics;
import plo.web.mainSearch.entity.Music;


public class ArtistSearchService {
	  // 1. 데이터베이스 연결
	   private Connection con;
	   // 2. 대화
	   private Statement stmt;
	   private PreparedStatement pstmt;
	   // 3. 결과값 받는 객체
	   private ResultSet rs;

	   // # 연결 처리 기능 메서드
	   public void setCon() throws SQLException {
	      // 1. driver 메모리 로딩
	      try {
	         Class.forName("oracle.jdbc.driver.OracleDriver");
	      } catch (ClassNotFoundException e) {
	         e.printStackTrace();
	      }
	      // 2. 특정 서버
	      // - 접속 정보: 드라이버명:@ip:port:sid
	      String info = "jdbc:oracle:thin:@localhost:1521:xe";
	      // 드라이버 매니저 객체를 통해 Connection 객체를 생성
	      con = DriverManager.getConnection(info, "scott", "tiger");
	      System.out.println("접속 성공");
	   }


       //아티스트 검색

// 조회(매개변수 없는 것) 한개 데이터 처리
public ArrayList<Artist> artist(String keyword){
	ArrayList<Artist> alist=new ArrayList <Artist>();
	
   try {
//         1. 공통 연결 메서드 호출
      setCon();
//         2. Statement 객체 생성(연결객체 - Connection)
      String sql ="SELECT art_name, art_img "
      		+ "FROM p_artist \r\n"
      		+ "WHERE art_name LIKE '%'||'"+keyword+"'||'%'";
     
      stmt=con.prepareStatement(sql);
      System.out.println(sql);
//         3. ResultSet 객체 생성(대화객체 - Statement)
      rs = stmt.executeQuery(sql);
      while(rs.next()) {
    	//String art_name, String art_img
    	Artist e=new Artist (rs.getString(1),
  			  rs.getString(2));			 
  			
    	alist.add(e);  
    }
    System.out.println(sql);
    System.out.println("데이터 건수: "+alist.size());
    
    rs.close();
    stmt.close();
    con.close();
      
   } catch (SQLException e) {
      e.printStackTrace();
      System.out.println(e.getMessage());
   } catch (Exception e) {
      System.out.println(e.getMessage());
   }
   return alist;
}



//음악 검색

// 조회(매개변수 없는 것) 한개 데이터 처리
public ArrayList<Music> mlist(String keyword){
	ArrayList<Music> mlist=new ArrayList <Music>();
	
   try {
//         1. 공통 연결 메서드 호출
      setCon();
//         2. Statement 객체 생성(연결객체 - Connection)
      String sql ="SELECT m_name, m_path "
      		+ "FROM p_music \r\n"
      		+ "WHERE m_name LIKE '%'||'"+keyword+"'||'%'";
     
      stmt=con.prepareStatement(sql);
      System.out.println(sql);
//         3. ResultSet 객체 생성(대화객체 - Statement)
      rs = stmt.executeQuery(sql);
      while(rs.next()) {
    	//String art_name, String art_img
    	  Music e=new Music (rs.getString(1),
  			  rs.getString(2));			 
  			
    	mlist.add(e);  
    }
    System.out.println(sql);
    System.out.println("데이터 건수: "+mlist.size());
    
    rs.close();
    stmt.close();
    con.close();
      
   } catch (SQLException e) {
      e.printStackTrace();
      System.out.println(e.getMessage());
   } catch (Exception e) {
      System.out.println(e.getMessage());
   }
   return mlist;
}

//앨범 검색

public ArrayList<Album> album(String keyword){
	ArrayList<Album> album=new ArrayList <Album>();
	
   try {
//         1. 공통 연결 메서드 호출
      setCon();
//         2. Statement 객체 생성(연결객체 - Connection)
      String sql ="SELECT alb_name, alb_date, alb_img "
      		+ "FROM p_album \r\n"
      		+ "WHERE alb_name LIKE '%'||'"+keyword+"'||'%'";
     
      stmt=con.prepareStatement(sql);
      System.out.println(sql);
//         3. ResultSet 객체 생성(대화객체 - Statement)
      rs = stmt.executeQuery(sql);
      while(rs.next()) {
    	//String art_name, String art_img
    	  Album e=new Album (rs.getString(1),
  			  rs.getDate(2),rs.getString(3));			 
  			
    	  album.add(e);  
    }
    System.out.println(sql);
    System.out.println("데이터 건수: "+album.size());
    
    rs.close();
    stmt.close();
    con.close();
      
   } catch (SQLException e) {
      e.printStackTrace();
      System.out.println(e.getMessage());
   } catch (Exception e) {
      System.out.println(e.getMessage());
   }
   return album;
}

/*가사 검색*/
public ArrayList<Lyrics> lyrics(String keyword){
	ArrayList<Lyrics> lyrics=new ArrayList <Lyrics>();
	
   try {
//         1. 공통 연결 메서드 호출
      setCon();
//         2. Statement 객체 생성(연결객체 - Connection)
      String sql ="SELECT m_name, m_path, m_lyrics "
      		+ "FROM p_music \r\n"
      		+ "WHERE m_name LIKE '%'||'"+keyword+"'||'%'";
     
      stmt=con.prepareStatement(sql);
      System.out.println(sql);
//         3. ResultSet 객체 생성(대화객체 - Statement)
      rs = stmt.executeQuery(sql);
      while(rs.next()) {
    	//String art_name, String art_img
    	  Lyrics e=new Lyrics (rs.getString(1),
  			  rs.getString(2),rs.getString(3));			 
  			
    	  lyrics.add(e);  
    }
    System.out.println(sql);
    System.out.println("데이터 건수: "+lyrics.size());
    
    rs.close();
    stmt.close();
    con.close();
      
   } catch (SQLException e) {
      e.printStackTrace();
      System.out.println(e.getMessage());
   } catch (Exception e) {
      System.out.println(e.getMessage());
   }
   return lyrics;
}


  

public static void main(String [] args) {
	ArtistSearchService art=new ArtistSearchService();
}
}