package plo.web.album.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import plo.web.album.entity.AlbumDetail;
import plo.web.album.service.AlbumDetailService;

/**
 * Servlet implementation class AlbumDetailComtroller
 */
@WebServlet(name = "albumdetail", urlPatterns = { "/albumdetail" })
public class AlbumDetailComtroller1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AlbumDetailComtroller1() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String alb_noS = request.getParameter("alb_no");
		/* String alb_name = request.getParameter("alb_name"); */
		
		if(alb_noS==null) alb_noS="";
		int alb_no = Integer.parseInt(alb_noS);
		
		AlbumDetailService service = new AlbumDetailService(); 
		ArrayList<AlbumDetail> alblist = service.getAlbumList(alb_no);
		
		AlbumDetail	ad = service.getAlbumDetail(alb_no);	
		System.out.println("테스트" + alblist.size());
		String page = "\\a01_main\\main.jsp";
		
		System.out.println("############"+ad);
		System.out.println("############"+alblist.size());

		if(ad != null && alblist != null) {
			request.setAttribute("isSuccess", true);
			HttpSession session = request.getSession();
			session.setAttribute("albumDetail", ad);
			
			request.setAttribute("alblist", alblist);
			request.setAttribute("size", alblist.size());
			
			page = "\\a04_artist\\albumDetail_1.jsp";			
		} else {
			request.setAttribute("isSuccess", false);
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
		
	}

}
