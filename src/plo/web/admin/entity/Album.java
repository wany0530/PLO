package plo.web.admin.entity;

import java.util.Date;

public class Album {
	private int alb_no;
	private String alb_name;
	private String alb_shape;
	private Date alb_date;
	private String alb_img;
	private String alb_intro;
	
	private int art_no;
	private String art_name;
	
	public Album() {
		// TODO Auto-generated constructor stub
	}


	public Album(int alb_no, String alb_name, String alb_shape, Date alb_date, String alb_img, String alb_intro,
			int art_no, String art_name) {
		super();
		this.alb_no = alb_no;
		this.alb_name = alb_name;
		this.alb_shape = alb_shape;
		this.alb_date = alb_date;
		this.alb_img = alb_img;
		this.alb_intro = alb_intro;
		this.art_no = art_no;
		this.art_name = art_name;
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

	public String getAlb_shape() {
		return alb_shape;
	}

	public void setAlb_shape(String alb_shape) {
		this.alb_shape = alb_shape;
	}

	public Date getAlb_date() {
		return alb_date;
	}

	public void setAlb_date(Date alb_date) {
		this.alb_date = alb_date;
	}

	public String getAlb_img() {
		return alb_img;
	}

	public void setAlb_img(String alb_img) {
		this.alb_img = alb_img;
	}

	public String getAlb_intro() {
		return alb_intro;
	}

	public void setAlb_intro(String alb_intro) {
		this.alb_intro = alb_intro;
	}

	public int getArt_no() {
		return art_no;
	}

	public void setArt_no(int art_no) {
		this.art_no = art_no;
	}
	
	public String getArt_name() {
		return art_name;
	}

	public void setArt_name(String art_name) {
		this.art_name = art_name;
	}
	
}
