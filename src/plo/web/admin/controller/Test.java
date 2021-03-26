package plo.web.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/test")
public class Test extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getParameter("test");
		
		response.sendRedirect("test");
	}
	
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String chartids = request.getParameter("genre_icons_value");
		Object idSession = request.getAttribute("chartcnt");
		
		if(idSession == null) {
			request.setAttribute("chartcnt", 0);
		}
		else if(idSession != null && chartids != null) {
			request.setAttribute("chartcnt", chartids);
		}
		
//		request.getRequestDispatcher("a00_admin/test.jsp").forward(request, response);
	}
}
