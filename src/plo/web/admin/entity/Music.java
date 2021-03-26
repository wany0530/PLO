package plo.web.admin.entity;

public class Music {
	private int m_no;
	private String m_name;
	private int m_playnum;
	private String m_path;
	private String m_lyrics;
	
	private int alb_no;
	private String alb_name;
	
	public Music() {
		// TODO Auto-generated constructor stub
	}

	public Music(int m_no, String m_name, int m_playnum, String m_path, String m_lyrics, int alb_no, String alb_name) {
		super();
		this.m_no = m_no;
		this.m_name = m_name;
		this.m_playnum = m_playnum;
		this.m_path = m_path;
		this.m_lyrics = m_lyrics;
		this.alb_no = alb_no;
		this.alb_name = alb_name;
	}

	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public int getM_playnum() {
		return m_playnum;
	}

	public void setM_playnum(int m_playnum) {
		this.m_playnum = m_playnum;
	}

	public String getM_path() {
		return m_path;
	}

	public void setM_path(String m_path) {
		this.m_path = m_path;
	}

	public String getM_lyrics() {
		return m_lyrics;
	}

	public void setM_lyrics(String m_lyrics) {
		this.m_lyrics = m_lyrics;
	}

	public int getAlb_no() {
		return alb_no;
	}

	public void setAlb_no(int alb_no) {
		this.alb_no = alb_no;
	}

	public String getAlb_name() {
		return alb_name;
	}

	public void setAlb_name(String alb_name) {
		this.alb_name = alb_name;
	}
	
	
}
