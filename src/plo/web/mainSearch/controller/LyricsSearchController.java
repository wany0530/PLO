package plo.web.mainSearch.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import plo.web.mainSearch.service.ArtistSearchService;

/**
 * Servlet implementation class LyricsSearchController
 */
@WebServlet(name = "LyricsSearch", urlPatterns = { "/LyricsSearch" })
public class LyricsSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LyricsSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }
  //http://localhost:7080/plo/LyricsSearch
	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");
		String keyword=request.getParameter("keyword");
		
		//keyword가 없을 때 값이 뜨지 않도록
		if(keyword==null)keyword="";
		
		
		ArtistSearchService ser =new ArtistSearchService();
		
		//request 써야함 ex)request.setAttribute("calcu", new Calcu(num01,num02));
		
		request.setAttribute("lyricsList",ser.lyrics(keyword));
		// 전체화면  a01_main\main_search_artist_test.jsp
		String page="a01_main\\main_search_lyrics.jsp";
		RequestDispatcher rd=request.getRequestDispatcher(page);
		rd.forward(request,response);
		
	}

}
