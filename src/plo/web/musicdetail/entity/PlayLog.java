package plo.web.musicdetail.entity;

import java.util.Date;

public class PlayLog {
	private int log_no;
	private Date log_date;
	private int u_no;
	private int m_no;
	public PlayLog() {
		super();
	}
	public PlayLog(int log_no, Date log_date, int u_no, int m_no) {
		super();
		this.log_no = log_no;
		this.log_date = log_date;
		this.u_no = u_no;
		this.m_no = m_no;
	}
	public PlayLog(int u_no, int m_no) {
		super();
		this.u_no = u_no;
		this.m_no = m_no;
	}
	public int getLog_no() {
		return log_no;
	}
	public void setLog_no(int log_no) {
		this.log_no = log_no;
	}
	public Date getLog_date() {
		return log_date;
	}
	public void setLog_date(Date log_date) {
		this.log_date = log_date;
	}
	public int getU_no() {
		return u_no;
	}
	public void setU_no(int u_no) {
		this.u_no = u_no;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	};
}
