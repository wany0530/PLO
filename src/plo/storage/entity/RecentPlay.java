package plo.storage.entity;

import java.util.Date;

public class RecentPlay {
	private int m_no;
	private Date log_date;
	public RecentPlay() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RecentPlay(int m_no, Date log_date) {
		super();
		this.m_no = m_no;
		this.log_date = log_date;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public Date getLog_date() {
		return log_date;
	}
	public void setLog_date(Date log_date) {
		this.log_date = log_date;
	}
	
}
