package plo.web.notice.controller;

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
import plo.web.notice.entity.Notice;
import plo.web.notice.service.NoticeService;

@WebServlet("/notice")
public class NoticeManagerController extends HttpServlet {

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
		
		String page = request.getParameter("p");
		
		
		NoticeService service = new NoticeService();
		ArrayList<Notice> noticeList = service.getNoticeList(strToInt(page), 10);
		int noticeCnt = service.countNotice();
		
		request.setAttribute("list", noticeList);
		request.setAttribute("cnt", noticeCnt);
		
		request.getRequestDispatcher("a06_notice/notice.jsp").forward(request, response);
	}
}
