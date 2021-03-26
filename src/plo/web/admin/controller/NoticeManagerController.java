package plo.web.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import plo.web.admin.entity.Notice;
import plo.web.admin.entity.RegNotice;
import plo.web.admin.service.NoticeManagerService;


@WebServlet("/noticeManager")
public class NoticeManagerController extends HttpServlet {

	int strToInt(String str) {
		int num = 1;
		try {
			num = Integer.parseInt(str);
		} catch(Exception e) {

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
				String n_no = request.getParameter("n_no");
				String n_title = request.getParameter("n_title");
				String n_content = request.getParameter("n_content");
				String n_date = request.getParameter("n_date");
				String n_pub = request.getParameter("n_pub");
				if(n_pub == null || n_pub.equals("")) n_pub = "0";
				
				NoticeManagerService service = new NoticeManagerService();
				RegNotice notice = new RegNotice();
				notice.setN_no(strToInt(n_no));
				notice.setN_title(n_title);
				notice.setN_content(n_content);
				notice.setN_date_s(n_date);
				notice.setN_pub(strToInt(n_pub));
				
				service.noticeUpdate(notice);
			}
		}
		if(isDelete != null) {
			if(isDelete.equals("true")) {
				String[] checkId = request.getParameterValues("checkId");
				
				NoticeManagerService service = new NoticeManagerService();
				for(String id : checkId)
					service.noticeDel(strToInt(id));
			}
		}
		response.sendRedirect("noticeManager");
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String page = request.getParameter("p");
		
		NoticeManagerService service = new NoticeManagerService();
		ArrayList<Notice> noticeList = service.getNoticeList(strToInt(page), 10);
		int noticeCnt = service.countNotice();
		
		request.setAttribute("list", noticeList);
		request.setAttribute("cnt", noticeCnt);
		System.out.println("####"+noticeCnt+"#######");
		request.getRequestDispatcher("a00_admin/noticeManager.jsp").forward(request, response);
	}
}
