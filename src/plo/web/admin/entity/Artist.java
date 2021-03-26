package plo.web.admin.entity;

public class Artist {
	private int art_no;
	private String art_name;
	private String art_gender;
	private String art_group;
	private String art_img;
	
	public Artist() {
		// TODO Auto-generated constructor stub
	}

	public Artist(int art_no, String art_name, String art_gender, String art_group, String art_img) {
		super();
		this.art_no = art_no;
		this.art_name = art_name;
		this.art_gender = art_gender;
		this.art_group = art_group;
		this.art_img = art_img;
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

	public String getArt_gender() {
		return art_gender;
	}

	public void setArt_gender(String art_gender) {
		this.art_gender = art_gender;
	}

	public String getArt_group() {
		return art_group;
	}

	public void setArt_group(String art_group) {
		this.art_group = art_group;
	}

	public String getArt_img() {
		return art_img;
	}

	public void setArt_img(String art_img) {
		this.art_img = art_img;
	}
	
}
