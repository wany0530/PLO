package plo.web.chart.DTO;

import java.util.Date;

public class Mylist {
	private int mylist_no;
	private String mylist_name;
	private Date mylist_date;
	private int u_no;
	private int cnt;
	
	public Mylist() {
		// TODO Auto-generated constructor stub
	}

	public Mylist(int mylist_no, String mylist_name, Date mylist_date, int u_no) {
		super();
		this.mylist_no = mylist_no;
		this.mylist_name = mylist_name;
		this.mylist_date = mylist_date;
		this.u_no = u_no;
	}

	public int getMylist_no() {
		return mylist_no;
	}
	
	public void setMylist_no(int mylist_no) {
		this.mylist_no = mylist_no;
	}
	
	public String getMylist_name() {
		return mylist_name;
	}
	
	public void setMylist_name(String mylist_name) {
		this.mylist_name = mylist_name;
	}
	
	public Date getMylist_date() {
		return mylist_date;
	}
	
	public void setMylist_date(Date mylist_date) {
		this.mylist_date = mylist_date;
	}
	
	public int getU_no() {
		return u_no;
	}
	
	public void setU_no(int u_no) {
		this.u_no = u_no;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	
}
