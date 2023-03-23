package controller.event;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.EventServiceImpl;
import service.IEventService;
import vo.EventVO;

@WebServlet("/adminEventDetail.do")
public class AdminEventDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminEventDetail() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String eventCode = request.getParameter("eventCode");
//		System.out.println("너 들어왔어?");
//		
//		System.out.println(eventCode);

		IEventService evService = EventServiceImpl.getInstance();
		
		EventVO ev = evService.getEvent(eventCode);

//		List<EventVO> evList = evService.selectEvent(eventCode);
		

		request.setAttribute("ev", ev);

		RequestDispatcher disp = request.getRequestDispatcher("WEB-INF/views/event/adminDetail.jsp");
		disp.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
