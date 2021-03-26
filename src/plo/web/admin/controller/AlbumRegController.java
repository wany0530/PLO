package plo.web.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import plo.web.admin.entity.RegAlbum;
import plo.web.admin.service.AlbumManagerService;

@WebServlet("/albumReg")
public class AlbumRegController extends HttpServlet {

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
		
		String alb_name = request.getParameter("alb_name");
		
		if(alb_name != null) {
			String alb_shape = request.getParameter("alb_shape");
			String alb_date = request.getParameter("alb_date");
			String alb_img = request.getParameter("alb_img");
			String alb_intro = request.getParameter("alb_intro");
			String art_no = request.getParameter("art_no");
			
			AlbumManagerService service = new AlbumManagerService();
			RegAlbum album = new RegAlbum();
			album.setAlb_name(alb_name);
			album.setAlb_shape(alb_shape);
			album.setAlb_date_s(alb_date);
			album.setAlb_img(alb_img);
			album.setAlb_intro(alb_intro);
			album.setArt_no(strToInt(art_no));
			
			boolean result = service.albumReg(album);
			request.setAttribute("result", result);
		}
		request.getRequestDispatcher("a00_admin/albumReg.jsp").forward(request, response);
	}
}
