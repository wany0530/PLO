package plo.web.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import plo.web.admin.entity.Album;
import plo.web.admin.entity.Artist;
import plo.web.admin.entity.RegAlbum;
import plo.web.admin.service.AlbumManagerService;
import plo.web.admin.service.ArtistManagerService;

@WebServlet("/albumManager")
public class AlbumManagerController extends HttpServlet {

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
				String alb_no = request.getParameter("alb_no");
				String alb_name = request.getParameter("alb_name");
				String alb_shape = request.getParameter("alb_shape");
				String alb_date = request.getParameter("alb_date");
				String alb_img = request.getParameter("alb_img");
				String alb_intro = request.getParameter("alb_intro");
				String art_no = request.getParameter("art_no");
				
				AlbumManagerService service = new AlbumManagerService();
				RegAlbum album = new RegAlbum();
				album.setAlb_no(strToInt(alb_no));
				album.setAlb_name(alb_name);
				album.setAlb_shape(alb_shape);
				album.setAlb_date_s(alb_date);
				album.setAlb_img(alb_img);
				album.setAlb_intro(alb_intro);
				album.setArt_no(strToInt(art_no));
				
				service.albumUpdate(album);
			}
		}
		if(isDelete != null) {
			if(isDelete.equals("true")) {
				String[] checkId = request.getParameterValues("checkId");
				
				AlbumManagerService service = new AlbumManagerService();
				for(String id : checkId)
					service.albumDel(strToInt(id));
			}
		}
		response.sendRedirect("albumManager");
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String page = request.getParameter("p");
		
		AlbumManagerService service = new AlbumManagerService();
		ArrayList<Album> albumtList = service.getAlbumList(strToInt(page), 10);
		int albumCnt = service.countAlbum();
		
		request.setAttribute("list", albumtList);
		request.setAttribute("cnt", albumCnt);
		
		request.getRequestDispatcher("a00_admin/albumManager.jsp").forward(request, response);
	}
}
