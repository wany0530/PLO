package plo.web.album.entity;

public class AlbumDetail {
	private int alb_no;
	private String alb_name;
	private String alb_img; //
	private String art_name;
	private String art_group;
	private String m_name;	
	private String genre_name;

	public AlbumDetail() {
		super();
	}
	
	public AlbumDetail(int alb_no, String alb_name, String alb_img, String art_name, String art_group, String m_name,
			String genre_name) {
		super();
		this.alb_no = alb_no;
		this.alb_name = alb_name;
		this.alb_img = alb_img;
		this.art_name = art_name;
		this.art_group = art_group;
		this.m_name = m_name;
		this.genre_name = genre_name;
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
	public String getArt_group() {
		return art_group;
	}
	public void setArt_group(String art_group) {
		this.art_group = art_group;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getGenre_name() {
		return genre_name;
	}
	public void setGenre_name(String genre_name) {
		this.genre_name = genre_name;
	}
	
//	
}
