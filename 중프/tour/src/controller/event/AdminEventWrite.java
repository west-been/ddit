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
@WebServlet("/adminEventWrite.do")
public class AdminEventWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminEventWrite() {
        super();
    }
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/event/adminWrite.jsp").forward(request, response);
		
	}
    @Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	System.out.println("왔다");
		
		resp.setCharacterEncoding("utf-8");
		req.setCharacterEncoding("utf-8");
		
		EventVO ev = new EventVO();
		
		// 사용자가 입력한 것
		String adminId = req.getParameter("adminId");		
		String eventNm = req.getParameter("eventNm");
		String eventLocation = req.getParameter("eventLocation");
		String eventHost = req.getParameter("eventHost");
		String eventPeriod = req.getParameter("eventPeriod");
		String eventTel = req.getParameter("eventTel");
		
		IEventService evService = EventServiceImpl.getInstance();
		IFileUploadService fileService = new FileUploadServiceImpl();

		fileService.saveAtchFilePhoto(req, ev.getAtchFile());
		
		ev.setAdminId(adminId);
		ev.setEventNm(eventNm);
		ev.setEventLocation(eventLocation);
		ev.setEventHost(eventHost);
		ev.setEvertPeriod(eventPeriod);
		ev.setAtchFile(fileService.getSavePath());
		ev.setEventTel(eventTel);

		//오라클에 insert
		int cnt = evService.registEvent(ev);
		
		System.out.println("EventWrite -> cnt : " + cnt);
		
		String msg = "";
		
		// 잘 됐는지 확인
		if (cnt > 0) {
			// 성공
			msg = "성공";
		} else {
			// 실패
			msg = "실패";
		}
		//세션객체의 msg 속성의 값에 msg 값 넣기
		req.getSession().setAttribute("msg", msg);
		
		resp.sendRedirect(req.getContextPath() + "/adminEvent.do");
	}

}
