package plo.web.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import plo.web.admin.entity.Music;
import plo.web.admin.service.MusicManagerService;

@WebServlet("/musicManager")
public class MusicManagerController extends HttpServlet {

	int strToInt(String str) {
		int num = 1;
		try {
			num = Integer.parseInt(str);
		} catch(Exception e) {

		}
		return num;
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String isUpdate = request.getParameter("isUpdate");
		String isDelete = request.getParameter("isDelete");
		
		if(isUpdate != null) {
			if(isUpdate.equals("true")) {
				String m_no = request.getParameter("m_no");
				String m_name = request.getParameter("m_name");
				String m_playnum = request.getParameter("m_playnum");
				String m_path = request.getParameter("m_path");
				String m_lyrics = request.getParameter("m_lyrics");
				String alb_no = request.getParameter("alb_no");
				
				MusicManagerService service = new MusicManagerService();
				Music music = new Music();
				music.setM_no(strToInt(m_no));
				music.setM_name(m_name);
				music.setM_playnum(strToInt(m_playnum));
				music.setM_path(m_path);
				music.setM_lyrics(m_lyrics);
				music.setAlb_no(strToInt(alb_no));
				
				service.musicUpdate(music);
			}
		}
		if(isDelete != null) {
			if(isDelete.equals("true")) {
				String[] checkId = request.getParameterValues("checkId");
				
				MusicManagerService service = new MusicManagerService();
				for(String id : checkId)
					service.musicDel(strToInt(id));
			}
		}
		response.sendRedirect("musicManager");
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String page = request.getParameter("p");
		
		MusicManagerService service = new MusicManagerService();
		ArrayList<Music> musicList = service.getMusicList(strToInt(page), 10);
		int musicCnt = service.countMusic();
		
		request.setAttribute("list", musicList);
		request.setAttribute("cnt", musicCnt);
		
		request.getRequestDispatcher("a00_admin/musicManager.jsp").forward(request, response);
	}
}
