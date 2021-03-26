package plo.web.album.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import plo.web.album.entity.AlbumDetail2;
import plo.web.album.service.AlbumDetailService;

@WebServlet(name = "albumdetail2", urlPatterns = { "/albumdetail2" })
public class AlbumDetailController2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AlbumDetailController2() {
        super();
       
    }


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String alb_noS = request.getParameter("alb_no");
		
		if(alb_noS==null) alb_noS="";
		int alb_no = Integer.parseInt(alb_noS);
		
		AlbumDetailService service = new AlbumDetailService(); 
		AlbumDetail2 ad2 = service.getAlbumDetail2(alb_no);	
		ad2.setAlb_intro(ad2.getAlb_intro().replaceAll("\r\n", "<br>"));
		
		String page = "\\a04_artist\\albumDetail_1.jsp";
		
		if(ad2 != null) {
			
			request.setAttribute("isSuccess", true);
			HttpSession session = request.getSession();
			session.setAttribute("album2", ad2);
			page = "\\a04_artist\\albumDetail_2.jsp";
			
		} else {
			request.setAttribute("isSuccess", false);
		}
		
		RequestDispatcher rd = 
				request.getRequestDispatcher(page);
		rd.forward(request, response);
		
	}

}
