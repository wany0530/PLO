package plo.storage.entity;

public class ManyPlay {
	private int m_no;
	private int cnt;
	public ManyPlay() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ManyPlay(int m_no, int cnt) {
		super();
		this.m_no = m_no;
		this.cnt = cnt;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
}
