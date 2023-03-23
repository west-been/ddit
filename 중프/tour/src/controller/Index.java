package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.EventServiceImpl;
import service.IEventService;
import service.INoticeService;
import service.IPhotoService;
import service.NoticeServiceImpl;
import service.PhotoServiceImpl;
import vo.EventVO;
import vo.NoticeVO;
import vo.PhotoVO;


@WebServlet("/index.do")
public class Index extends HttpServlet{
 
	private static final long serialVersionUID = 1L;
	
	public Index() {
		super();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//파라미터값조회
		//String pv = req.getParameter("pv");
		//String ev = req.getParameter("ev");
		
		//서비스 객체 생성하기
		IPhotoService photoService = PhotoServiceImpl.getInstance();
		IEventService eventService = EventServiceImpl.getInstance();
		INoticeService noticeService = NoticeServiceImpl.getInstance();
		
		Map<String, Object> map = new HashMap<String, Object>();
		

		//req.setAttribute("pv", pv);
		//req.setAttribute("ev", ev);
		
		
		//포토갤러리
		List<PhotoVO> PhotoAll = photoService.PhotoAll(map);
		req.setAttribute("PhotoAll", PhotoAll);
		
		//축제행사
		List<EventVO> EventAll = eventService.EventAll(map);
		req.setAttribute("EventAll", EventAll);
		
		//공지사항 
		List<NoticeVO> NoticeAll = noticeService.NoticeAll(map);
		req.setAttribute("NoticeAll", NoticeAll);
		
		
		
		//화면처리
		RequestDispatcher disp = req.getRequestDispatcher("WEB-INF/index.jsp");
		disp.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
}



