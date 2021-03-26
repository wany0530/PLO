package plo.web.admin.entity;

import java.util.Date;

public class Faq {
	private int f_no;
	private String f_title;
	private String f_content;
	private int f_pub;
	
	private int fc_no;
	private String fc_name;
	
	public Faq() {
		// TODO Auto-generated constructor stub
	}

	

	public Faq(int f_no, String f_title, String f_content, int f_pub, int fc_no, String fc_name) {
		super();
		this.f_no = f_no;
		this.f_title = f_title;
		this.f_content = f_content;
		this.f_pub = f_pub;
		this.fc_no = fc_no;
		this.fc_name = fc_name;
	}



	public int getF_no() {
		return f_no;
	}

	public void setF_no(int f_no) {
		this.f_no = f_no;
	}

	public String getF_title() {
		return f_title;
	}

	public void setF_title(String f_title) {
		this.f_title = f_title;
	}

	public String getF_content() {
		return f_content;
	}

	public void setF_content(String f_content) {
		this.f_content = f_content;
	}

	public int getF_pub() {
		return f_pub;
	}

	public void setF_pub(int f_pub) {
		this.f_pub = f_pub;
	}

	public int getFc_no() {
		return fc_no;
	}

	public void setFc_no(int fc_no) {
		this.fc_no = fc_no;
	}

	public String getFc_name() {
		return fc_name;
	}

	public void setFc_name(String fc_name) {
		this.fc_name = fc_name;
	}
	
}
