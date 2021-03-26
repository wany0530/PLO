package plo.storage.entity;

public class MusicChart {
	private String m_name;
	private String alb_name;
	private String alb_img;
	private String art_name;
	public MusicChart() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MusicChart(String m_name, String alb_name, String alb_img, String art_name) {
		super();
		this.m_name = m_name;
		this.alb_name = alb_name;
		this.alb_img = alb_img;
		this.art_name = art_name;
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
	public String getAlb_img() {
		return alb_img;
	}
	public void setAlb_img(String alb_img) {
		this.alb_img = alb_img;
	}
	public String getArt_name() {
		return art_name;
	}
	public void setArt_name(String art_name) {
		this.art_name = art_name;
	}
}
