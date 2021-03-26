package plo.web.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import plo.web.admin.entity.Music;
import plo.web.admin.entity.RegAlbum;
import plo.web.admin.service.AlbumManagerService;
import plo.web.admin.service.MusicManagerService;

@WebServlet("/musicReg")
public class MusicRegController extends HttpServlet {

	int strToInt(String str) {
		int num = 1;
		try {
			num = Integer.parseInt(str);
		} catch(Exception e) {
			num = 1;
		}
		return num;
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String m_name = request.getParameter("m_name");
		
		if(m_name != null) {
			String m_playnum = request.getParameter("m_playnum");
			String m_path = request.getParameter("m_path");
			String m_lyrics = request.getParameter("m_lyrics");
			String alb_no = request.getParameter("alb_no");
			
			MusicManagerService service = new MusicManagerService();
			Music music = new Music();
			music.setM_name(m_name);
			music.setM_playnum(strToInt(m_playnum));
			music.setM_path(m_path);
			music.setM_lyrics(m_lyrics);
			music.setAlb_no(strToInt(alb_no));
			
			boolean result = service.musicReg(music);
			request.setAttribute("result", result);
		}
		request.getRequestDispatcher("a00_admin/musicReg.jsp").forward(request, response);
	}
}
