package controller.event;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.EventServiceImpl;
import service.IEventService;
import vo.EventVO;

@WebServlet("/eventDetail.do")
public class EventDetail extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//파라미터 값 조회
		String eventCode = req.getParameter("eventCode");
		
		//서비스 객체 생성하기
		IEventService evService = EventServiceImpl.getInstance();
		
		EventVO ev = evService.getEvent(eventCode);
		
		req.setAttribute("ev", ev);
		
		
		//화면목록 화면 처리하기 
		RequestDispatcher disp = req.getRequestDispatcher("WEB-INF/views/event/eventDetail.jsp");
		disp.forward(req, resp);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
