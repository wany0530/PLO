package plo.web.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import plo.web.admin.entity.Artist;
import plo.web.admin.entity.RegUser;
import plo.web.admin.entity.User;
import plo.web.admin.service.ArtistManagerService;
import plo.web.admin.service.DashboardService;
import plo.web.admin.service.UserManagerService;

@WebServlet("/userManager")
public class UserManagerController extends HttpServlet {

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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String isUpdate = request.getParameter("isUpdate");
		String isDelete = request.getParameter("isDelete");
		
		if(isUpdate != null) {
			if(isUpdate.equals("true")) {
				String u_no = request.getParameter("u_no");
				String u_pass = request.getParameter("u_pass");
				String u_name = request.getParameter("u_name");
				String u_mail = request.getParameter("u_mail");
				String u_date = request.getParameter("u_date");
				
				RegUser user = new RegUser();
				user.setU_no(strToInt(u_no));
				user.setU_pass(u_pass);
				user.setU_name(u_name);
				user.setU_mail(u_mail);
				user.setU_date_s(u_date);
				
				UserManagerService service = new UserManagerService();
				service.userUpdate(user);
			}
		}
		System.out.println("##########"+isDelete);
		if(isDelete != null) {
			if(isDelete.equals("true")) {
				String[] checkId = request.getParameterValues("checkId");
				
				UserManagerService service = new UserManagerService();
				for(String id : checkId)
					service.userDel(strToInt(id));
			}
		}
		response.sendRedirect("userManager");
		
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String page = request.getParameter("p");
		
		
		UserManagerService service = new UserManagerService();
		ArrayList<User> userList = service.getUserList(strToInt(page), 10);
		int userCnt = service.count();
		
		request.setAttribute("userList", userList);
		request.setAttribute("userCnt", userCnt);
		
		request.getRequestDispatcher("a00_admin/userManager.jsp").forward(request, response);
	}
}
