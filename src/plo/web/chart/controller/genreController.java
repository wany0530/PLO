package plo.web.chart.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import plo.web.chart.DTO.Genre_Info;
import plo.web.chart.service.chartService;
import plo.web.chart.service.genreService;

/**
 * Servlet implementation class genreController
 */
@WebServlet(name = "genre.do", urlPatterns = { "/genre.do" })
public class genreController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public genreController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		genreService dao = new genreService();
		ArrayList<Genre_Info> gilist = new ArrayList<Genre_Info>(); 
		String g_nos = request.getParameter("P_GENRE_code");
		int g_no = 0;
		if(g_nos != null) {
			g_no = Integer.parseInt(g_nos);
		}
		gilist = dao.GenrePage_list(g_no);
		request.setAttribute("gilist", gilist);
		
		String page="a05_music\\genre.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
	}

}
