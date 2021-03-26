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

import plo.storage.entity.Mylist;
import plo.storage.service.StorageService;
import plo.web.admin.entity.User;

/**
 * Servlet implementation class MyListController
 */
@WebServlet(name = "MyList.do", urlPatterns = { "/MyList.do" })
public class MyListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyListController() {
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
			ArrayList<Mylist> mylist = dao.mylist_Info(u.getU_no());
			request.setAttribute("mylist", mylist);
			
			ArrayList<String> mylist_imglist=new ArrayList<String>();
			ArrayList<Integer> mcntlist=new ArrayList<Integer>();
			
			
			for(int idx=0;idx<mylist.size();idx++) {
				mylist_imglist.add(dao.mylist_Img(u.getU_no(), mylist.get(idx).getMylist_no()));
				mcntlist.add(dao.mylist_Mcnt(u.getU_no(),mylist.get(idx).getMylist_no()));
			}
			
			request.setAttribute("mylist_imglist", mylist_imglist);
			request.setAttribute("mcntlist", mcntlist);
			page="a10_storage\\store_1_real.jsp";
		}
		RequestDispatcher rd=request.getRequestDispatcher(page);
		rd.forward(request, response);
		
		
	}

}
