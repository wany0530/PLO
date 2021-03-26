package plo.web.admin.entity;

public class FaqCode {
	private int fc_no;
	private String fc_name;
	
	public FaqCode() {
		// TODO Auto-generated constructor stub
	}

	public FaqCode(int fc_no, String fc_name) {
		super();
		this.fc_no = fc_no;
		this.fc_name = fc_name;
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
