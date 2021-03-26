package plo.web.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import plo.web.admin.entity.RegNotice;
import plo.web.admin.entity.RegUser;
import plo.web.admin.service.NoticeManagerService;

@WebServlet("/noticeReg")
public class NoticeRegController extends HttpServlet {

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
		request.setCharacterEncoding("UTF-8");
		
		String n_title = request.getParameter("n_title");
		
		if(n_title != null) {
			String n_content = request.getParameter("n_content");
			String n_pub = request.getParameter("n_pub");
			if(n_pub == null) n_pub = "0";
			else n_pub = "1";
			System.out.println("공개여부 :"+ n_pub);
			NoticeManagerService service = new NoticeManagerService();
			
			RegNotice notice = new RegNotice();
			notice.setN_title(n_title);
			notice.setN_content(n_content);
			notice.setN_pub(strToInt(n_pub));
			
			
			boolean result = service.noticeReg(notice);
			request.setAttribute("result", result);
		}
		
		request.getRequestDispatcher("a00_admin/noticeReg.jsp").forward(request, response);
	}
	
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("a00_admin/noticeReg.jsp").forward(request, response);
	}
}
