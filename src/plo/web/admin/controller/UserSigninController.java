package plo.web.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import plo.web.admin.entity.RegUser;
import plo.web.admin.service.UserManagerService;



@WebServlet(name = "signin_2", urlPatterns = { "/signin_2" })
public class UserSigninController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

    public UserSigninController() {
        super();
    }
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
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("utf-8");
    	String id = request.getParameter("id");
		if(id == null) id=""; System.out.println("##id : "+id);
		String pass = request.getParameter("pass");
		if(pass == null) pass=""; System.out.println("##pass : "+pass);
		String name = request.getParameter("name");
		if(name == null) name=""; System.out.println("##name : "+name);
		String mail = request.getParameter("mail");
		if(mail == null) mail=""; System.out.println("##mail : "+mail);
		String date = request.getParameter("date");
		if(date == null) date=""; System.out.println("##date : "+date);
		
		if(id != null) {
			UserManagerService service = new UserManagerService();
			RegUser user = new RegUser(date);
			user.setU_id(id);
			user.setU_pass(pass);
			user.setU_name(name);
			user.setU_mail(mail);
			System.out.println("#######");
			boolean result = service.userSignin(user);
			request.setAttribute("result", result);
		}
		request.getRequestDispatcher("a03_login/signin_2.jsp").forward(request, response);
	}

}
