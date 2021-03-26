package plo.web.chart.DTO;

public class Music {
	private String m_name;
	private String alb_name;
	private String art_name;
	private String alb_img;
	private int m_no;
	private int alb_no;
	private int art_no;
	
	public Music() {
		// TODO Auto-generated constructor stub
	}

	public Music(String m_name, String alb_name, String art_name, String alb_img, int m_no, int alb_no, int art_no) {
		super();
		this.m_name = m_name;
		this.alb_name = alb_name;
		this.art_name = art_name;
		this.alb_img = alb_img;
		this.m_no = m_no;
		this.alb_no = alb_no;
		this.art_no = art_no;
	}
	public Music(String m_name, String alb_name, String art_name, String alb_img) {
		super();
		this.m_name = m_name;
		this.alb_name = alb_name;
		this.art_name = art_name;
		this.alb_img = alb_img;
	}
	
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public int getAlb_no() {
		return alb_no;
	}
	public void setAlb_no(int alb_no) {
		this.alb_no = alb_no;
	}
	public int getArt_no() {
		return art_no;
	}
	public void setArt_no(int art_no) {
		this.art_no = art_no;
	}
	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getAlb_name() {
		return alb_name;
	}

	public void setAlb_name(String alb_name) {
		this.alb_name = alb_name;
	}

	public String getArt_name() {
		return art_name;
	}

	public void setArt_name(String art_name) {
		this.art_name = art_name;
	}

	public String getAlb_img() {
		return alb_img;
	}

	public void setAlb_img(String alb_img) {
		this.alb_img = alb_img;
	}
	
	
}
