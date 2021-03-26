package plo.web.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import plo.web.admin.service.DashboardService;

@WebServlet("/admin")
public class DashboardController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		DashboardService service = new DashboardService();
		ArrayList<Integer> cnts = new ArrayList<>();
		cnts.add(service.count("P_USER"));
		cnts.add(service.count("P_NOTICE"));
		cnts.add(service.count("P_FAQ"));
		cnts.add(service.count("P_ARTIST"));
		cnts.add(service.count("P_ALBUM"));
		cnts.add(service.count("P_MUSIC"));
		
		request.setAttribute("cnts", cnts);
		request.getRequestDispatcher("a00_admin/index.jsp").forward(request, response);
	}
}
