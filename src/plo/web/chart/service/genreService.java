package plo.web.chart.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import plo.web.chart.DTO.Genre_Info;
import plo.web.chart.DTO.Music;

public class genreService {
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
	public ArrayList<Genre_Info> GenrePage_list(int genre_code){
		ArrayList<Genre_Info> gilist = new ArrayList<Genre_Info>();
		try {
			setCon();
			String sql = "SELECT d.ALB_NAME, e.ART_NAME, d.ALB_IMG, e.ART_IMG \r\n"
					+ "FROM P_MUSIC a, P_MUSIC_GENRE b, P_GENRE c, P_ALBUM d, P_ARTIST e\r\n"
					+ "WHERE a.M_NO = b.M_NO AND b.GENRE_CODE = c.GENRE_CODE AND a.ALB_NO = d.ALB_NO AND d.ART_NO = e.ART_NO\r\n"
					+ "AND c.GENRE_CODE = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, genre_code);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Genre_Info gi = new Genre_Info(rs.getString("alb_name"), rs.getString("art_name"), rs.getString("alb_img"), rs.getString("art_img"));
				gilist.add(gi);
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
		return gilist;
	}
	public static void main(String[] args) {
		genreService dao = new genreService();
		System.out.println(dao.GenrePage_list(1).get(0).getAlb_img());
	}
}
