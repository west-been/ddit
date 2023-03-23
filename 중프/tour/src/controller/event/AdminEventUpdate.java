package controller.event;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.FileUploadServiceImpl;
import common.IFileUploadService;
import service.EventServiceImpl;
import service.IEventService;
import vo.EventVO;

@MultipartConfig
@WebServlet("/adminEventUpdate.do")
public class AdminEventUpdate extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String eventCode = request.getParameter("eventCode");

		IEventService evService = EventServiceImpl.getInstance();
		EventVO ev = evService.getEvent(eventCode);
		
		request.setAttribute("ev", ev);

		request.getRequestDispatcher("/WEB-INF/views/event/adminUpdate.jsp").forward(request, response);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");

		// 파라미터 값 가져오기 : 사용자가 작성할 내용
		String eventCode = req.getParameter("eventCode");
		String eventNm = req.getParameter("eventNm");
		String eventLocation = req.getParameter("eventLocation");
		String eventPeriod = req.getParameter("eventPeriod");
		String eventHost = req.getParameter("eventHost");
		String eventTel = req.getParameter("eventTel");
		String atchFile = req.getParameter("atchFile");

		IEventService evService = EventServiceImpl.getInstance();
		EventVO ev = new EventVO();

		FileUploadServiceImpl fileService = new FileUploadServiceImpl();
		boolean isOk = fileService.saveAtchFilePhoto(req, ev.getAtchFile());
		
		if(isOk) {
			ev.setAtchFile(fileService.getFilePath());
		}
		
			
		ev.setEventCode(eventCode);
		ev.setEventNm(eventNm);
		ev.setEventLocation(eventLocation);
		ev.setEventHost(eventHost);
		ev.setEvertPeriod(eventPeriod);
		ev.setEventTel(eventTel);
//		ev.setAtchFile(fileService.getSavePath());
		
		int cnt = evService.modifyEvent(ev);
		
		resp.sendRedirect(req.getContextPath() + "/adminEvent.do");

	}

}
