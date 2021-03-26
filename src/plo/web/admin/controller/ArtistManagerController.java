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

@WebServlet("/artistManager")
public class ArtistManagerController extends HttpServlet {

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
		System.out.println("아티스트 post 호출됨");
		request.setCharacterEncoding("utf-8");
		
		String isUpdate = request.getParameter("isUpdate");
		String isDelete = request.getParameter("isDelete");
		
		if(isUpdate != null) {
			if(isUpdate.equals("true")) {
				String art_no = request.getParameter("art_no");
				String art_name = request.getParameter("art_name");
				String art_gender = request.getParameter("art_gender");
				String art_group = request.getParameter("art_group");
				String art_img = request.getParameter("art_img");
				
				ArtistManagerService service = new ArtistManagerService();
				service.artistUpdate(new Artist(strToInt(art_no), art_name, art_gender, art_group, art_img));
			}
		}
		if(isDelete != null) {
			if(isDelete.equals("true")) {
				String[] checkId = request.getParameterValues("checkId");
				
				ArtistManagerService service = new ArtistManagerService();
				for(String id : checkId)
					service.artistDel(strToInt(id));
			}
		}
		
		response.sendRedirect("artistManager");
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("아티스트 get 호출됨");
		String page = request.getParameter("p");
		
		ArtistManagerService service = new ArtistManagerService();
		ArrayList<Artist> artistList = service.getArtistList(strToInt(page), 10);
		int artistCnt = service.countArtist();
		
		request.setAttribute("list", artistList);
		request.setAttribute("cnt", artistCnt);
		
		request.getRequestDispatcher("a00_admin/artistManager.jsp").forward(request, response);
	}
}
