package plo.web.admin.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import plo.web.admin.entity.Faq;
import plo.web.admin.entity.FaqCode;

public class FaqManagerService {
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

	// FAQ 조회
	public ArrayList<Faq> getFaqList(){
		return getFaqList(1, 99999, "", "");
	}
	// FAQ 조회
	public ArrayList<Faq> getFaqList(String title, String fc_name){
		return getFaqList(1, 99999, title, fc_name);
	}
	// FAQ 조회
	public ArrayList<Faq> getFaqList(int page, int cnt, String title, String fc_name) {
		ArrayList<Faq> faqList = new ArrayList<Faq>();
		String sql = "";
		
		int start = 1 + (page-1)*cnt;
		int end = page * cnt;
		
		sql = "SELECT * FROM (\n"
				+ "	SELECT ROWNUM num, faq.* FROM (\n"
				+ "			SELECT f.*, code.fc_name\n"
				+ "			  FROM P_FAQ f, P_FAQ_CODE code\n"
				+ "			 WHERE f.fc_no = code.fc_no\n"
				+ "			   AND f_title LIKE UPPER(?)\n"
				+ "			   AND fc_name LIKE UPPER(?)\n"
				+ "		  ORDER BY f_no DESC\n"
				+ "		) faq\n"
				+ ") WHERE num BETWEEN ? AND ?";
		System.out.println(sql);
		try {
			setCon();
			
			prst = conn.prepareStatement(sql);
			prst.setString(1, "%"+title+"%");
			prst.setString(2, "%"+fc_name+"%");
			prst.setInt(3, start);
			prst.setInt(4, end);
			
			rs = prst.executeQuery();
			
			while(rs.next()) {
				int f_no = rs.getInt("f_no");
				String f_title = rs.getString("f_title");
				String f_content = rs.getString("f_content");
				int f_pub = rs.getInt("f_pub");
				int fc_no = rs.getInt("fc_no");
				String faqcode_name = rs.getString("fc_name");

				faqList.add(new Faq(f_no, f_title, f_content,
									f_pub, fc_no, faqcode_name));
			}
			
			rs.close();
			prst.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		return faqList;
	}

	// FAQ CODE 조회
	public ArrayList<FaqCode> getFaqCode(){
		ArrayList<FaqCode> faqCodeList = new ArrayList<FaqCode>();
		
		String sql = "SELECT * FROM P_FAQ_CODE";
		System.out.println(sql);
		try {
			setCon();
			
			prst = conn.prepareStatement(sql);
			rs = prst.executeQuery();
			
			while(rs.next()) {
				rs.getInt("fc_no");
				rs.getString("fc_name");

				faqCodeList.add(new FaqCode(rs.getInt("fc_no"),
											rs.getString("fc_name")));
			}
			
			rs.close();
			prst.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		return faqCodeList;
	}
	
	// 등록된 FAQ 수
	public int countFaq() {
		String sql = "";
		int cnt = 0;
		
		sql = "SELECT count(*) cnt FROM P_FAQ";
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

	// FAQ 상세
	public Faq faqDetail(int faq_no) {
		Faq faq = new Faq();
		
		String sql = "SELECT * FROM P_FAQ WHERE f_no = ?";
		System.out.println(sql);
		try {
			setCon();
			
			prst = conn.prepareStatement(sql);
			prst.setInt(1, faq_no);
			rs = prst.executeQuery();
			
			if(rs.next()) {
				faq.setF_no(rs.getInt("f_no"));
				faq.setF_title(rs.getString("f_title"));
				faq.setF_content(rs.getString("f_content").replaceAll("\r\n", ""));
				faq.setF_pub(rs.getInt("f_pub"));
				faq.setFc_no(rs.getInt("fc_no"));
				faq.setFc_name(rs.getString("fc_name"));
			}
			
			rs.close();
			prst.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return faq;
	}
	
	// FAQ 등록
	public boolean faqReg(Faq faq) {
		boolean success = false;
		
		String sql = "INSERT INTO P_FAQ VALUES(P_FAQ_NO_SEQ.NEXTVAL, ?, ?, ?, ?)";
		
		System.out.println(sql);
		try {
			setCon();
			prst = conn.prepareStatement(sql);
			
			prst.setString(1, faq.getF_title());
			prst.setString(2, faq.getF_content());
			prst.setInt(3, faq.getF_pub());
			prst.setInt(4, faq.getFc_no());
			
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
	
	// FAQ 삭제
	public boolean faqDel(int f_no) {
		boolean success = false;
		
		String sql = "DELETE P_FAQ WHERE f_no = ?";
		System.out.println(sql);
		try {
			setCon();
			
			prst = conn.prepareStatement(sql);
			prst.setInt(1, f_no);
			
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
	
	// FAQ 수정
	public boolean faqUpdate(Faq faq) {
		boolean success = false;
		
		String sql = "UPDATE P_FAQ\n"
				+ "   SET f_title = ?,\n"
				+ "       f_content = ?,\n"
				+ "       f_pub = ?,\n"
				+ "       fc_no = ?\n"
				+ " WHERE f_no = ?";
		System.out.println(sql);
		try {
			setCon();
			prst = conn.prepareStatement(sql);
			
			prst.setString(1, faq.getF_title());
			prst.setString(2, faq.getF_content());
			prst.setInt(3, faq.getF_pub());
			prst.setInt(4, faq.getFc_no());
			prst.setInt(5, faq.getF_no());
			
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
