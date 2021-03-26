package plo.web.musicdetail.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import plo.web.musicdetail.entity.MusicDetail;
import plo.web.musicdetail.service.MusicDetailService;

/**
 * Servlet implementation class MusicDetailController
 */
@WebServlet(name = "musicdetail", urlPatterns = { "/musicdetail" })
public class MusicDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MusicDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String m_noS = request.getParameter("m_no");
		String p = request.getParameter("p");
		if(m_noS==null) m_noS="1";
		int m_no = Integer.parseInt(m_noS);
		
		MusicDetailService mds = new MusicDetailService();
		MusicDetail md = mds.getMusicDetail(m_no);
		md.setM_lyrics(md.getM_lyrics().replaceAll("\r\n", "<br>"));
		request.setAttribute("music", md);
		
		String page="\\a11_musicDetail\\musicDetail.jsp";
		if(p!=null) {
			page="\\a09_playList\\musicJSON.jsp";
			System.out.println(page);
		}
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
	}

}
