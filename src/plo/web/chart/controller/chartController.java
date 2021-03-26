package plo.web.chart.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import plo.web.admin.entity.User;
import plo.web.chart.DTO.Genre;
import plo.web.chart.DTO.Music;
import plo.web.chart.DTO.Mylist;

import plo.web.chart.service.chartService;

/**
 * Servlet implementation class chartController
 */
@WebServlet(name = "chart.do", urlPatterns = { "/chart.do" })
public class chartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public chartController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		chartService dao = new chartService();
		
		// 많이들은 곡
		ArrayList<Music> dlist = dao.defaultchart();
		// 최근등록된 곡
		ArrayList<Music> recentlist = dao.recentlychart();
		// 장르별 곡
		ArrayList<Music> genre_chartlist = null;
		
		// 장르출력물의 리스트선언
		ArrayList<ArrayList<Music>> listkind = new ArrayList<ArrayList<Music>>();
		listkind.add(dlist);
		listkind.add(recentlist);
		
		// 테이블 목록들을 테이블에 넣음.
		request.setAttribute("listkind", listkind);
		int size = dlist.size();
		request.setAttribute("size", size);
		
		
		HttpSession session = request.getSession();
		User u = (User)session.getAttribute("u");
		
		//회원번호
		int u_no = 0;
		if(u != null) {
			u_no = u.getU_no();
		}
		request.setAttribute("u_no", u_no);
		
		// 내 리스트 생성할떄.
				String Addmylist_title = request.getParameter("Addmylist_title");
				if(Addmylist_title != null) {
					dao.create_Mylist(Addmylist_title, u_no);
				}
				
				String mylist_noS = request.getParameter("mylist_no");
				int mylist_no = 0;
				String mylist_m_noS = request.getParameter("mylist_m_no");
				int mylist_m_no =0;
				if(mylist_noS != null && mylist_m_noS !=null) {
					mylist_no = Integer.parseInt(mylist_noS);
					mylist_m_no = Integer.parseInt(mylist_m_noS);
					dao.insMylist(mylist_no, mylist_m_no);
				}
		
		
		
		//개인 내 보관함 목록출력
		ArrayList<Mylist> mylist = dao.mylist(u_no);
		request.setAttribute("mylist", mylist);
		
		//장르 목록 출력
		ArrayList<Genre> genre_list = dao.genre_list();
		request.setAttribute("genre_list", genre_list);
		
		//테이블 출력시 장르세션 유지.
		int chartcnt=0;
		int chartid = 0;
		String chartids = request.getParameter("genre_icons_value");
		// chartids이 없을때 + 세션이 존재하지않을때 (초기 설정)
		if(chartids == null && session.getAttribute("chartcnt") == null) {
			session.setAttribute("chartcnt", chartid);
			chartcnt = (Integer) session.getAttribute("chartcnt");
			request.setAttribute("chartcnt", chartcnt);
			// chartids == null && 세션 존재할떄 (그대로)
		}else if(chartids == null && session.getAttribute("chartcnt") != null){
			// 시작하자마자 재생목록 클릭시 session.getAttribute("chartid")값이 null이기때문에 처리
			if( session.getAttribute("chartid") != null) {
				int a = (Integer) session.getAttribute("chartid");
				if(a > 1) {
					genre_chartlist = dao.genre_chartList(a-1);
					listkind.add(genre_chartlist);
					request.setAttribute("chartcnt", 2);
				}else {
					session.setAttribute("chartcnt", a);
					chartcnt = (Integer) session.getAttribute("chartcnt");
					request.setAttribute("chartcnt", chartcnt);
				}
			}
			// chartids == null && 장르세션 존재할떄 (재 세션설정)
		}else if(chartids != null  && session.getAttribute("chartcnt") != null) {
			chartid = Integer.parseInt(chartids);
			if(chartid > 1) {
				genre_chartlist = dao.genre_chartList(chartid-1);
				listkind.add(genre_chartlist);
				session.setAttribute("chartid", chartid);
				request.setAttribute("chartcnt", 2);
			} else {
			session.setAttribute("chartid", chartid);
			session.setAttribute("chartcnt", chartid);
			chartcnt = (Integer) session.getAttribute("chartcnt");
			request.setAttribute("chartcnt", chartcnt);
			}
		}
		
		//차트내 재생버튼 클릭시 재생목록 추가.
		request.setAttribute("playbuttonM_no",request.getParameter("playbuttonM_no"));
		String playbuttonM_noS = request.getParameter("playbuttonM_no");
		int playbuttonM_no = 0;
		if(playbuttonM_noS != null) {
			playbuttonM_no = Integer.parseInt(playbuttonM_noS);
			dao.delPlaylist(u_no, playbuttonM_no);
			dao.insPlaylist(u_no, playbuttonM_no);
		}
		//차트내 재생목록 클릭시 음원번호
		request.setAttribute("playlistbuttonM_no",request.getParameter("playlistbuttonM_no"));
		String playlistbuttonM_noS = request.getParameter("playlistbuttonM_no");
		int playlistbuttonM_no = 0;
		if(playlistbuttonM_noS != null) {
			playbuttonM_no = Integer.parseInt(playbuttonM_noS);
			dao.delPlaylist(u_no, playlistbuttonM_no);
			dao.insPlaylist(u_no, playlistbuttonM_no);
		}
		//체크박스내 재생버튼 클릭시 음원번호
		request.setAttribute("chkboxListen",request.getParameter("chkboxListen"));
		String chkboxListenS = request.getParameter("chkboxListen");
		int chkboxListen = 0;
		if(chkboxListenS != null) {
			playbuttonM_no = Integer.parseInt(chkboxListenS);
			dao.delPlaylist(u_no, chkboxListen);
			dao.insPlaylist(u_no, chkboxListen);
		}
		//체크박스내 재생목록 클릭시 음원번호
		request.setAttribute("chkboxListenlist",request.getParameter("chkboxListenlist"));
		String chkboxListenlistS = request.getParameter("chkboxListenlist");
		int chkboxListenlist = 0;
		if(chkboxListenlistS != null) {
			playbuttonM_no = Integer.parseInt(chkboxListenlistS);
			dao.delPlaylist(u_no, chkboxListenlist);
			dao.insPlaylist(u_no, chkboxListenlist);
		}
		// 좋아요 처리
		String likeSong_noS = request.getParameter("thisHeartInfo");
		int likeSong_no = 0;
		if(likeSong_noS != null) {
			likeSong_no = Integer.parseInt(likeSong_noS);
			dao.LikeFunc(u_no, likeSong_no);
		}
		
		//내 리스트 -> 리스트 추가할 리스트명
		request.setAttribute("Addmylist_title",request.getParameter("Addmylist_title"));
		
		
		String page="a05_music\\chart.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
	}

}
