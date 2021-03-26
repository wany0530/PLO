package plo.web.musicdetail.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import plo.web.admin.entity.User;
import plo.web.musicdetail.entity.PlayLog;
import plo.web.musicdetail.service.MusicDetailService;

/**
 * Servlet implementation class PlaylogController
 */
@WebServlet(name = "playlog", urlPatterns = { "/playlog" })
public class PlaylogController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlaylogController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("u");
		String m_noS = request.getParameter("m_no");
		if(m_noS==null) m_noS="0";
		int m_no = Integer.parseInt(m_noS);
		
		PlayLog pl = new PlayLog();
		pl.setU_no(u.getU_no());
		pl.setM_no(m_no);
		
		MusicDetailService mds = new MusicDetailService();
		mds.insPlayLog(pl);
		
	}

}
