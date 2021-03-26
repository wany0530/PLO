package plo.web.chart.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import plo.web.chart.DTO.Mylist;
import plo.web.chart.service.chartService;

/**
 * Servlet implementation class mylist_PopupController
 */
@WebServlet(name = "mylistPopup.do", urlPatterns = { "/mylistPopup.do" })
public class mylist_PopupController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mylist_PopupController() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		chartService dao = new chartService();
		
		String u_noS = request.getParameter("u_no");
		int u_no = 0;
		if(u_noS != null && !u_noS.equals("")) {
			u_no = Integer.parseInt(u_noS);
		}
		ArrayList<Mylist> mylist = dao.mylist(u_no);
		request.setAttribute("mylist", mylist);
		
		String page="a05_music\\mylist-popup.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
	}

}
