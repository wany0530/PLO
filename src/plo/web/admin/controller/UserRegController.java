package plo.web.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import plo.web.admin.entity.RegUser;
import plo.web.admin.entity.User;
import plo.web.admin.service.DashboardService;
import plo.web.admin.service.UserManagerService;

@WebServlet("/userReg")
public class UserRegController extends HttpServlet {

	int strToInt(String str) {
		int num = 1;
		try {
			num = Integer.parseInt(str);
		} catch(Exception e) {
			num = 1;
		}
		return num;
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String name = request.getParameter("name");
		String mail = request.getParameter("mail");
		String date = request.getParameter("date");
		
		if(id != null) {
			UserManagerService service = new UserManagerService();
			RegUser user = new RegUser(date);
			user.setU_id(id);
			user.setU_pass(pass);
			user.setU_name(name);
			user.setU_mail(mail);
			
			boolean result = service.userReg(user);
			request.setAttribute("result", result);
		}
		request.getRequestDispatcher("a00_admin/userReg.jsp").forward(request, response);
	}
}
