package plo.storage.entity;

import java.util.Date;

public class Mylist {
	private String mylist_name;
	private Date mylist_date;
	private int mylist_no;
	public Mylist() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Mylist(String mylist_name, Date mylist_date, int mylist_no) {
		super();
		this.mylist_name = mylist_name;
		this.mylist_date = mylist_date;
		this.mylist_no = mylist_no;
	}
	public String getMylist_name() {
		return mylist_name;
	}
	public void setAlb_img(String mylist_name) {
		this.mylist_name = mylist_name;
	}
	public Date getMylist_date() {
		return mylist_date;
	}
	public void setMylist_date(Date mylist_date) {
		this.mylist_date = mylist_date;
	}
	public int getMylist_no() {
		return mylist_no;
	}
	public void setMylist_no(int mylist_no) {
		this.mylist_no = mylist_no;
	}
	public void setMylist_name(String mylist_name) {
		this.mylist_name = mylist_name;
	}
}
