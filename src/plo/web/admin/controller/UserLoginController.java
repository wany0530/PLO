package plo.web.admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import plo.web.admin.service.UserManagerService;


@WebServlet("/login.do")
public class UserLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public UserLoginController() {
        super();
        
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/a03_login/login.jsp");
		
		HttpSession inSession = request.getSession();
		
		if(inSession != null) {
			System.out.println(inSession);
			inSession.invalidate();
		}
		
		rd.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		UserManagerService service = new UserManagerService();
		int loginResult = service.login(id, pass);
		
		if(loginResult == 1) {
			request.setAttribute("loginResult", loginResult);
			HttpSession session = request.getSession();
			session.setAttribute("u", service.userSearch(id));
			RequestDispatcher rd = request.getRequestDispatcher("/a01_main/main.jsp");
			rd.forward(request, response);			
		} else {
			request.setAttribute("loginResult", loginResult);
			RequestDispatcher rd = request.getRequestDispatcher("/a03_login/login.jsp");
			rd.forward(request, response);	
		}
	}

}
