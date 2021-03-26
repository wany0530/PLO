package plo.web.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import plo.web.admin.entity.Faq;
import plo.web.admin.service.FaqManagerService;

@WebServlet("/faqManager")
public class FaqManagerController extends HttpServlet {

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
				String f_no = request.getParameter("f_no");
				String f_title = request.getParameter("f_title");
				String f_content = request.getParameter("f_content");
				String f_pub = request.getParameter("f_pub");
				String fc_no = request.getParameter("fc_no");
				if(f_pub == null || f_pub.equals("")) f_pub = "0";
				
				
				FaqManagerService service = new FaqManagerService();
				Faq faq = new Faq();
				faq.setF_no(strToInt(f_no));
				faq.setF_title(f_title);
				faq.setF_content(f_content);
				faq.setF_pub(strToInt(f_pub));
				faq.setFc_no(strToInt(fc_no));
				
				service.faqUpdate(faq);
			}
		}
		if(isDelete != null) {
			if(isDelete.equals("true")) {
				String[] checkId = request.getParameterValues("checkId");
				
				FaqManagerService service = new FaqManagerService();
				for(String id : checkId)
					service.faqDel(strToInt(id));
			}
		}
		response.sendRedirect("faqManager");
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String page = request.getParameter("p");
		
		FaqManagerService service = new FaqManagerService();
		ArrayList<Faq> faqList = service.getFaqList(strToInt(page), 10, "", "");
		int faqCnt = service.countFaq();
		
		request.setAttribute("list", faqList);
		request.setAttribute("cnt", faqCnt);
		
		request.getRequestDispatcher("a00_admin/faqManager.jsp").forward(request, response);
	}
}
