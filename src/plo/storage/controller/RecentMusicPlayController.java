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

import plo.storage.entity.MusicChart;
import plo.storage.entity.RecentPlay;
import plo.storage.service.StorageService;
import plo.web.admin.entity.User;

/**
 * Servlet implementation class RecentMusicPlayController
 */
@WebServlet(name = "RecentMusicPlay.do", urlPatterns = { "/RecentMusicPlay.do" })
public class RecentMusicPlayController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecentMusicPlayController() {
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
				
			ArrayList<RecentPlay> rlist = dao.recentPlaylist(u.getU_no());
			request.setAttribute("rlist", rlist);
			request.setAttribute("size", rlist.size());
			
			ArrayList<MusicChart> rminfolist=new ArrayList<MusicChart>();
			ArrayList<Integer> mpcntlist=new ArrayList<Integer>();
			
			
			for(int idx=0;idx<rlist.size();idx++) {
				rminfolist.add(dao.musicInfolist(u.getU_no(), rlist.get(idx).getM_no()));
				mpcntlist.add(dao.musicPlayCnt(u.getU_no(), rlist.get(idx).getM_no()));
			}
			
			request.setAttribute("rminfolist", rminfolist);
			request.setAttribute("mpcntlist", mpcntlist);
			
			if(rlist.size()==0) {
				page="a10_storage\\store_6_real_no.jsp";
			}else{
				page="a10_storage\\store_6_real.jsp";
			}
		}
		RequestDispatcher rd=request.getRequestDispatcher(page);
		rd.forward(request, response);
		
		
	}

}
