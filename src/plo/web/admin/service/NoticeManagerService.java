package plo.web.admin.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import plo.web.admin.entity.Notice;
import plo.web.admin.entity.RegNotice;

public class NoticeManagerService {
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

	// 게시판 조회
	public ArrayList<Notice> getAlbumList(){
		return getNoticeList(1, 99999);
	}
		
	// 게시판 조회
	public ArrayList<Notice> getNoticeList(int page, int cnt) {
		ArrayList<Notice> noticeList = new ArrayList<Notice>();
		String sql = "";
		
		int start = 1 + (page-1)*cnt;
		int end = page * cnt;
		
		
		sql = "SELECT * FROM (\n"
				+ "	SELECT ROWNUM num, n.* FROM (\n"
				+ "		SELECT * FROM P_NOTICE ORDER BY n_no DESC \n"
				+ "	) n\n"
				+ ") WHERE num BETWEEN ? AND ?";
		System.out.println(sql);
		try {
			setCon();
			
			prst = conn.prepareStatement(sql);
			prst.setInt(1, start);
			prst.setInt(2, end);
			rs = prst.executeQuery();
			
			while(rs.next()) {
				int n_no = rs.getInt("n_no");
				String n_title = rs.getString("n_title");
				String n_content = rs.getString("n_content");
				Date n_date = rs.getDate("n_date");
				int n_pub = rs.getInt("n_pub");
				
				noticeList.add(new Notice(n_no, n_title, n_content, n_date, n_pub));
			}
			
			rs.close();
			prst.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		return noticeList;
	}
	
	// 등록된 게시수 수
	public int countNotice() {
		String sql = "";
		int cnt = 0;
		
		sql = "SELECT count(*) cnt FROM P_NOTICE";
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

	// 게시판 상세
	public Notice noticeDetail(int notice_no) {
		Notice notice = new Notice();
		
		String sql = "SELECT * FROM P_NOTICE WHERE n_no = ?";
		System.out.println(sql);
		try {
			setCon();
			
			prst = conn.prepareStatement(sql);
			prst.setInt(1, notice_no);
			rs = prst.executeQuery();
			
			if(rs.next()) {
				notice.setN_no(rs.getInt("n_no"));
				notice.setN_title(rs.getString("n_title"));
				notice.setN_content(rs.getString("n_content"));
				notice.setN_date(rs.getDate("n_date"));
				notice.setN_pub(rs.getInt("n_pub"));
			}
			
			rs.close();
			prst.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		return notice;
	}
	
	// 게시판 등록
	public boolean noticeReg(RegNotice notice) {
		boolean success = false;
		
		String sql = "INSERT INTO P_NOTICE\n"
					+ "VALUES(P_NOTICE_NO_SEQ.NEXTVAL, ?, ?,\n"
					+ "sysdate, ?)";
		System.out.println(sql);
		try {
			setCon();
			prst = conn.prepareStatement(sql);
			
			prst.setString(1, notice.getN_title());
			prst.setString(2, notice.getN_content());
			prst.setInt(3, notice.getN_pub());
			
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
	
	// 게시판 삭제
	public boolean noticeDel(int n_no) {
		boolean success = false;
		
		String sql = "DELETE P_NOTICE WHERE n_no = ?";
		System.out.println(sql);
		try {
			setCon();
			
			prst = conn.prepareStatement(sql);
			prst.setInt(1, n_no);
			
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
	
	// 게시판 수정
	public boolean noticeUpdate(RegNotice notice) {
		boolean success = false;
		
		String sql = "UPDATE P_NOTICE\n"
				+ "   SET n_title = ?,\n"
				+ "       n_content = ?,\n"
				+ "       n_date = to_date(?, 'yyyy-mm-dd'),\n"
				+ "       n_pub = ?\n"
				+ " WHERE n_no = ?";
		System.out.println(sql);
		try {
			setCon();
			prst = conn.prepareStatement(sql);
			
			prst.setString(1, notice.getN_title());
			prst.setString(2, notice.getN_content());
			prst.setString(3, notice.getN_date_s());
			prst.setInt(4, notice.getN_pub());
			prst.setInt(5, notice.getN_no());
			
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
}
