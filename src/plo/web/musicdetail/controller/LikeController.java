package plo.web.musicdetail.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import plo.web.admin.entity.User;
import plo.web.musicdetail.entity.LikeMusic;
import plo.web.musicdetail.service.LikeService;

/**
 * Servlet implementation class LikeController
 */
@WebServlet(name = "like", urlPatterns = { "/like" })
public class LikeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LikeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String proc = request.getParameter("proc");
		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("u");
		String m_noS = request.getParameter("m_no");
		if(m_noS==null) m_noS="0";
		int m_no = Integer.parseInt(m_noS);
				
		LikeMusic lm = new LikeMusic();
		lm.setM_no(m_no);
		lm.setU_no(u.getU_no());
		
		LikeService li = new LikeService();
		
		if(proc!=null) {
			if(proc.equals("ins")) {
				li.insMusicLike(lm);
			}
			if(proc.equals("del")) {
				li.delMusicLike(lm);				
			}
			if(proc.equals("sel")) {
				PrintWriter out=response.getWriter();
				out.print(li.isLikeMusic(lm));
				System.out.println("좋아요 체크결과 : "+li.isLikeMusic(lm));
			}
		}
	}
}
