package plo.web.admin.entity;

import java.util.Date;

public class RegNotice extends Notice{
	private String n_date_s;
	
	public RegNotice() {
		// TODO Auto-generated constructor stub
	}

	public RegNotice(int n_no, String n_title, String n_content, Date n_date, int n_pub) {
		super(n_no, n_title, n_content, n_date, n_pub);
		// TODO Auto-generated constructor stub
	}

	public String getN_date_s() {
		return n_date_s;
	}

	public void setN_date_s(String n_date_s) {
		this.n_date_s = n_date_s;
	}
	
}
