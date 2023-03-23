package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.INoticeService;
import service.NoticeServiceImpl;
import vo.NoticeVO;

@WebServlet("/noticeUpdate.do")
public class NoticeUpdate extends HttpServlet{


	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//파라미터 값 조회
		String noticeCode = req.getParameter("noticeCode");

		// 서비스객체 생성
		INoticeService noticeService = NoticeServiceImpl.getInstance();

		NoticeVO nv = noticeService.getNotice(noticeCode);

		req.setAttribute("nv", nv);

		req.getRequestDispatcher("WEB-INF/views/notice/noticeUpdate.jsp").forward(req, resp);

	}


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8"); 
		resp.setCharacterEncoding("utf-8");

		//파라미터 값 가져오기
		String noticeCode = req.getParameter("noticeCode");
		String noticeTitle = req.getParameter("noticeTitle");
		String adminId = req.getParameter("adminId");	
		String noticeContent = req.getParameter("noticeContent");
	//	String noticeDate = req.getParameter("noticeDate");
		
		// 서비스 객체 생성하기
		INoticeService noticeService = NoticeServiceImpl.getInstance();

		NoticeVO nv = new NoticeVO();
	//	nv.setNoticeDate(noticeDate);
		nv.setNoticeCode(noticeCode);
		nv.setNoticeTitle(noticeTitle);
		nv.setAdminId(adminId);
		nv.setNoticeContent(noticeContent);


		int cnt = noticeService.modifyNotice(nv);

		String msg="";
		if(cnt >0) {
			msg="성공";
		} else {
			msg="실패";
		}

		req.getSession().setAttribute("msg", msg);

		resp.sendRedirect("/tour/notice.do");
	}

}

