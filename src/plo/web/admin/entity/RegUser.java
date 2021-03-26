package plo.web.admin.entity;

import java.util.Date;

public class RegUser extends User {
	private String u_date_s;
	
	public RegUser() {
		// TODO Auto-generated constructor stub
	}
	public RegUser(String u_date_s) {
		super();
		this.u_date_s = u_date_s;
	}
	public String getU_date_s() {
		return u_date_s;
	}
	public void setU_date_s(String u_date_s) {
		this.u_date_s = u_date_s;
	}
}
