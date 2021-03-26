package plo.web.mainSearch.entity;

public class Lyrics {
 private String m_name;
 private String m_path;
 private String m_lyrics;
public Lyrics() {
	super();
	// TODO Auto-generated constructor stub
}
public Lyrics(String m_name, String m_path, String m_lyrics) {
	super();
	this.m_name = m_name;
	this.m_path = m_path;
	this.m_lyrics = m_lyrics;
}
public String getM_name() {
	return m_name;
}
public void setM_name(String m_name) {
	this.m_name = m_name;
}
public String getM_path() {
	return m_path;
}
public void setM_path(String m_path) {
	this.m_path = m_path;
}
public String getM_lyrics() {
	return m_lyrics;
}
public void setM_lyrics(String m_lyrics) {
	this.m_lyrics = m_lyrics;
}

}

