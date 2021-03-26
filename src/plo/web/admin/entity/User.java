package plo.web.admin.entity;

import java.util.Date;

public class User {
	private int u_no;
	private String u_id;
	private String u_pass;
	private String u_name;
	private String u_mail;
	private Date u_date;
	
	public User() {
		// TODO Auto-generated constructor stub
	}

	public User(int u_no, String u_id, String u_pass, String u_name, String u_mail) {
		super();
		this.u_no = u_no;
		this.u_id = u_id;
		this.u_pass = u_pass;
		this.u_name = u_name;
		this.u_mail = u_mail;
	}

	public User(int u_no, String u_id, String u_pass, String u_name, String u_mail, Date u_date) {
		super();
		this.u_no = u_no;
		this.u_id = u_id;
		this.u_pass = u_pass;
		this.u_name = u_name;
		this.u_mail = u_mail;
		this.u_date = u_date;
	}

	public int getU_no() {
		return u_no;
	}

	public void setU_no(int u_no) {
		this.u_no = u_no;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getU_pass() {
		return u_pass;
	}

	public void setU_pass(String u_pass) {
		this.u_pass = u_pass;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getU_mail() {
		return u_mail;
	}

	public void setU_mail(String u_mail) {
		this.u_mail = u_mail;
	}

	public Date getU_date() {
		return u_date;
	}

	public void setU_date(Date u_date) {
		this.u_date = u_date;
	}

}
