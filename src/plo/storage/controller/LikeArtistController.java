package plo.storage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import plo.storage.entity.LikeArtist;
import plo.storage.service.StorageService;
import plo.web.admin.entity.User;

/**
 * Servlet implementation class LikeArtistController
 */
@WebServlet(name = "LikeArtist.do", urlPatterns = { "/LikeArtist.do" })
public class LikeArtistController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LikeArtistController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		StorageService dao=new StorageService();
		
		HttpSession session = request.getSession();
		User u=(User)session.getAttribute("u");
		
		String page="";
		
		if(u==null) {
			page="a10_storage\\store_no_login.jsp";
		} else {
			ArrayList<LikeArtist> artlist=dao.likeArtistList(u.getU_no());
			request.setAttribute("artslist", artlist);
			ArrayList<Integer> artistno=new ArrayList<Integer>();
			ArrayList<ArrayList<String>> glist=new ArrayList<ArrayList<String>>();
			for(int a=0;a<artlist.size();a++) {
				artistno.add(artlist.get(a).getArt_no());
				glist.add(dao.artGenreList(artistno.get(a), u.getU_no()));
			}
			request.setAttribute("glist", glist);
			
			if(artlist.size()==0) {
				page="a10_storage\\store_4_real_no.jsp";
			}else{
				
				String idxS=request.getParameter("idx");
				if(idxS!=null) {
					int idx=Integer.parseInt(idxS);
					String art_name=artlist.get(idx).getArt_name();
					int art_no=dao.likeNoArt_name(art_name);
					dao.likeNoArtist(u.getU_no(), art_no);
				
					// 한번더
					artlist=dao.likeArtistList(u.getU_no());
					request.setAttribute("artslist", artlist);
					for(int a=0;a<artlist.size();a++) {
						artistno.add(artlist.get(a).getArt_no());
						glist.add(dao.artGenreList(artistno.get(a), u.getU_no()));
					}
					request.setAttribute("glist", glist);
				}
				page="a10_storage\\store_4_real.jsp";
			}
		}
		RequestDispatcher rd=request.getRequestDispatcher(page);
		rd.forward(request, response);
	
	
	}

}
