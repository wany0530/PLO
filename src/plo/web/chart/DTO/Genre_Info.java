package plo.web.chart.DTO;

public class Genre_Info {
	private String alb_name;
	private String art_name;
	private String alb_img;
	private String art_img;
	
	public Genre_Info() {
		// TODO Auto-generated constructor stub
	}
	
	public Genre_Info(String alb_name, String art_name, String alb_img, String art_img) {
		super();
		this.alb_name = alb_name;
		this.art_name = art_name;
		this.alb_img = alb_img;
		this.art_img = art_img;
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

	public String getArt_img() {
		return art_img;
	}

	public void setArt_img(String art_img) {
		this.art_img = art_img;
	}
	
	
}
