package plo.web.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import plo.web.admin.entity.Artist;
import plo.web.admin.service.ArtistManagerService;

@WebServlet("/artistReg")
public class ArtistRegController extends HttpServlet {

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
		
		String art_name = request.getParameter("art_name");
		String art_gender = request.getParameter("art_gender");
		String art_group = request.getParameter("art_group");
		String art_img = request.getParameter("art_img");
		
		if(art_name != null) {
			ArtistManagerService service = new ArtistManagerService();
			Artist artist = new Artist();
			artist.setArt_name(art_name);
			artist.setArt_gender(art_gender);
			artist.setArt_group(art_group);
			artist.setArt_img(art_img);
			
			boolean result = service.artistReg(artist);
			request.setAttribute("result", result);
		}
		request.getRequestDispatcher("a00_admin/artistReg.jsp").forward(request, response);
	}
}
