package plo.web.admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import plo.web.admin.entity.User;
import plo.web.admin.service.MyPageService;

/**
 * Servlet implementation class MyPageController
 */
@WebServlet(name = "mypage", urlPatterns = { "/mypage" })
public class MyPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("u");
		
		String proc = request.getParameter("proc");
		String newPass = request.getParameter("new_pass");
//		String u_noS = request.getParameter("u_no");
//		if(u_noS==null) u_noS="0";
//		int u_no = Integer.parseInt(u_noS);
		
		MyPageService ms = new MyPageService();
		
		if(proc!=null) {
			if(proc.equals("update")) {
				System.out.println("비밀번호 변경");
				ms.updatePass(u.getU_no(), newPass);
				u.setU_pass(newPass);
				session.setAttribute("u", u);
			}
			if(proc.equals("del")) {
				System.out.println("삭제");
				ms.userDel(u.getU_no());
				session.invalidate();
			}
		}
		
		String page="a02_mypage\\mypage.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
	}

}
