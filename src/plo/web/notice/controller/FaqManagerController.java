package plo.web.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import plo.web.notice.entity.Faq;
import plo.web.notice.service.FaqService;


@WebServlet("/faq")
public class FaqManagerController extends HttpServlet {

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
		String title = request.getParameter("title");
		String faq_name = request.getParameter("faq_name");
		
		if(title == null) title="";
		if(faq_name == null) faq_name="";
		FaqService service = new FaqService();
		ArrayList<Faq> faqList = service.getFaqList(strToInt(page), 10, title, faq_name);
		int faqCnt = service.countFaq();
		
		request.setAttribute("list", faqList);
		request.setAttribute("cnt", faqCnt);
		
		request.getRequestDispatcher("a06_notice/faq.jsp").forward(request, response);
	}
}
