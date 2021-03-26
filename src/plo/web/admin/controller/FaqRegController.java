package plo.web.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import plo.web.admin.entity.Faq;
import plo.web.admin.service.FaqManagerService;

@WebServlet("/faqReg")
public class FaqRegController extends HttpServlet {

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
		
		String f_title = request.getParameter("f_title");
		
		if(f_title != null) {
			String f_content = request.getParameter("f_content");
			String f_pub = request.getParameter("f_pub");
			String fc_no = request.getParameter("fc_no");
			
			if(f_pub == null) f_pub = "0";
			else f_pub = "1";
			System.out.println(f_content);
			FaqManagerService service = new FaqManagerService();
			
			Faq faq = new Faq();
			
			faq.setF_title(f_title);
			faq.setF_content(f_content);
			faq.setF_pub(strToInt(f_pub));
			faq.setFc_no(strToInt(fc_no));
			
			boolean result = service.faqReg(faq);
			request.setAttribute("result", result);
		}
		
		request.getRequestDispatcher("a00_admin/faqReg.jsp").forward(request, response);
	}
	
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("a00_admin/faqReg.jsp").forward(request, response);
	}
}
