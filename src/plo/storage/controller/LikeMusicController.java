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
import plo.storage.service.StorageService;
import plo.web.admin.entity.User;

/**
 * Servlet implementation class LikeMusicController
 */
@WebServlet(name = "LikeMusic.do", urlPatterns = { "/LikeMusic.do" })
public class LikeMusicController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LikeMusicController() {
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
		}
		else {
			ArrayList<MusicChart> lmlist=dao.likeMusicList(u.getU_no());
	
			request.setAttribute("lmlist", lmlist);		
			request.setAttribute("size", lmlist.size());
			
			if(lmlist.size()==0) {
				page="a10_storage\\store_2_real_no.jsp";
			}else{
				page="a10_storage\\store_2_real.jsp";
			}
		}
		RequestDispatcher rd=request.getRequestDispatcher(page);
		rd.forward(request, response);
	}

}
