package plo.storage.entity;

import java.util.Date;

public class LikeAlbum {
	private String alb_name;
	private String alb_shape;
	private String alb_img;
	private Date alb_date;
	private String art_name;
	private String genre_name;
	public LikeAlbum() {
		super();
		// TODO Auto-generated constructor stub
	}
	public LikeAlbum(String alb_name, String alb_shape, String alb_img, Date alb_date, String art_name,
			String genre_name) {
		super();
		this.alb_name = alb_name;
		this.alb_shape = alb_shape;
		this.alb_img = alb_img;
		this.alb_date = alb_date;
		this.art_name = art_name;
		this.genre_name = genre_name;
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
	public String getAlb_img() {
		return alb_img;
	}
	public void setAlb_img(String alb_img) {
		this.alb_img = alb_img;
	}
	public Date getAlb_date() {
		return alb_date;
	}
	public void setAlb_date(Date alb_date) {
		this.alb_date = alb_date;
	}
	public String getArt_name() {
		return art_name;
	}
	public void setArt_name(String art_name) {
		this.art_name = art_name;
	}
	public String getGenre_name() {
		return genre_name;
	}
	public void setGenre_name(String genre_name) {
		this.genre_name = genre_name;
	}
}
