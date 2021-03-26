package plo.web.admin.entity;

public class RegAlbum extends Album {
	private String alb_date_s;
	
	public RegAlbum() {
		// TODO Auto-generated constructor stub
	}
	public RegAlbum(String alb_date_s) {
		super();
		this.alb_date_s = alb_date_s;
	}

	public String getAlb_date_s() {
		return alb_date_s;
	}

	public void setAlb_date_s(String alb_date_s) {
		this.alb_date_s = alb_date_s;
	}
}
