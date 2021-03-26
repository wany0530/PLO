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

import plo.storage.entity.ManyPlay;
import plo.storage.entity.MusicChart;
import plo.storage.service.StorageService;
import plo.web.admin.entity.User;

/**
 * Servlet implementation class ManyMusicPlayController
 */
@WebServlet(name = "ManyMusicPlay.do", urlPatterns = { "/ManyMusicPlay.do" })
public class ManyMusicPlayController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManyMusicPlayController() {
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
		System.out.println("#####################################");
		String page="";
		
		if(u==null) {
			page="a10_storage\\store_no_login.jsp";
		} else {	
		
			ArrayList<ManyPlay> mlist = dao.manyPlaylist(u.getU_no());
			request.setAttribute("mlist", mlist);
			request.setAttribute("size", mlist.size());
			
			ArrayList<MusicChart> rinfolist=new ArrayList<MusicChart>();
			ArrayList<Integer> mcntlist=new ArrayList<Integer>();
			
			
			for(int idx=0;idx<mlist.size();idx++) {
				rinfolist.add(dao.musicInfolist(u.getU_no(), mlist.get(idx).getM_no()));
				mcntlist.add(dao.musicPlayCnt(u.getU_no(), mlist.get(idx).getM_no()));
			}
			
			request.setAttribute("rinfolist", rinfolist);
			request.setAttribute("mcntlist", mcntlist);
			
			if(mlist.size()==0) {
				page="a10_storage\\store_5_real_no.jsp";
			}else{
				page="a10_storage\\store_5_real.jsp";
			}
		}
		RequestDispatcher rd=request.getRequestDispatcher(page);
		rd.forward(request, response);
	}

}
