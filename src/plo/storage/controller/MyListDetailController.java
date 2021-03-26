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
import plo.storage.entity.Mylist;
import plo.storage.service.StorageService;
import plo.web.admin.entity.User;

/**
 * Servlet implementation class MyListDetailController
 */
@WebServlet(name = "MyListDetail.do", urlPatterns = { "/MyListDetail.do" })
public class MyListDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyListDetailController() {
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
		/*
		String mylist_name=request.getParameter("listname");
		int mylist_no=dao.mylist_no(mylist_name, u.getU_no());
		*/
		ArrayList<Mylist> mylist = dao.mylist_Info(u.getU_no());
		String idxS=request.getParameter("idx");
		int idx=Integer.parseInt(idxS);
		int mylist_no=mylist.get(idx).getMylist_no();
		
		ArrayList<MusicChart> mdchartlist=dao.myListDetaillist(u.getU_no(), mylist_no);
		request.setAttribute("mdchartlist", mdchartlist);
		request.setAttribute("size", mdchartlist.size());
		String ld_img = dao.mylist_Img(u.getU_no(), mylist_no);
		request.setAttribute("ld_img", ld_img);
		
		int list_cnt = dao.mylist_Mcnt(u.getU_no(), mylist_no);
		request.setAttribute("list_cnt", list_cnt);
		
		Mylist mdlinfo=dao.mylist_detail_Info(u.getU_no(), mylist_no);
		request.setAttribute("mdlinfo", mdlinfo);
		
		String page="a10_storage\\store_list_detail.jsp";
		RequestDispatcher rd=request.getRequestDispatcher(page);
		rd.forward(request, response);
		
	}

}
