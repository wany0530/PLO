package plo.web.chart.DTO;

public class Genre {
	private int genre_code;
	private String genre_name;
	
	public Genre() {
		// TODO Auto-generated constructor stub
	}

	public Genre(int genre_code, String genre_Name) {
		super();
		this.genre_code = genre_code;
		genre_name = genre_Name;
	}

	public int getGenre_code() {
		return genre_code;
	}

	public void setGenre_code(int genre_code) {
		this.genre_code = genre_code;
	}

	public String getGenre_name() {
		return genre_name;
	}

	public void setGenre_name(String genre_name) {
		this.genre_name = genre_name;
	}

	
}
