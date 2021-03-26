package plo.storage.entity;

public class LikeArtist {
	private String art_name;
	private String art_img;
	private String art_group;
	private String art_gender;
	private int art_no;
	public LikeArtist() {
		super();
		// TODO Auto-generated constructor stub
	}
	public LikeArtist(String art_name, String art_img, String art_group, String art_gender, int art_no) {
		super();
		this.art_name = art_name;
		this.art_img = art_img;
		this.art_group = art_group;
		this.art_gender = art_gender;
		this.art_no = art_no;
	}
	public String getArt_name() {
		return art_name;
	}
	public void setArt_name(String art_name) {
		this.art_name = art_name;
	}
	public String getArt_img() {
		return art_img;
	}
	public void setArt_img(String art_img) {
		this.art_img = art_img;
	}
	public String getArt_group() {
		return art_group;
	}
	public void setArt_group(String art_group) {
		this.art_group = art_group;
	}
	public String getArt_gender() {
		return art_gender;
	}
	public void setArt_gender(String art_gender) {
		this.art_gender = art_gender;
	}
	public int getArt_no() {
		return art_no;
	}
	public void setArt_no(int art_no) {
		this.art_no = art_no;
	}
}
