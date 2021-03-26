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

import plo.storage.entity.LikeAlbum;
import plo.storage.service.StorageService;
import plo.web.admin.entity.User;

/**
 * Servlet implementation class LikeAlbumController
 */
@WebServlet(name = "LikeAlbum.do", urlPatterns = { "/LikeAlbum.do" })
public class LikeAlbumController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LikeAlbumController() {
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
			ArrayList<LikeAlbum> alist=dao.likeAlbumList(u.getU_no());
			request.setAttribute("alist", alist);
			
			if(alist.size()==0) {
				page="a10_storage\\store_3_real_no.jsp";
			}else{
				String idxS=request.getParameter("idx");
				if(idxS!=null) {
					int idx=Integer.parseInt(idxS);
					String alb_name=alist.get(idx).getAlb_name();
					int alb_no=dao.likeNoAlb_name(alb_name);
					dao.likeNoAlbum(u.getU_no(), alb_no);
					
					alist=dao.likeAlbumList(u.getU_no());
					request.setAttribute("alist", alist);
				}
				page="a10_storage\\store_3_real.jsp";
				
			}
		}
		RequestDispatcher rd=request.getRequestDispatcher(page);
		rd.forward(request, response);
	}

}
