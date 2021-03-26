package plo.web.musicdetail.entity;

public class LikeMusic {
	private int u_no;
	private int m_no;
	public LikeMusic() {
		super();
	}
	public LikeMusic(int u_no, int m_no) {
		super();
		this.u_no = u_no;
		this.m_no = m_no;
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
	}
}
