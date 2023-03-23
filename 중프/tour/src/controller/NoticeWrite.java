package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.INoticeService;
import service.NoticeServiceImpl;
import vo.NoticeVO;

@MultipartConfig
@WebServlet("/noticeInsert.do")
public class NoticeWrite extends HttpServlet{

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/notice/noticeWrite.jsp").forward(req, resp);
	}



	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");	
		
		String noticeTitle = req.getParameter("noticeTitle");
		String adminId = req.getParameter("adminId");	
		String noticeContent = req.getParameter("noticeContent");
		
		INoticeService noticeService = NoticeServiceImpl.getInstance();

		NoticeVO nv = new NoticeVO();
		nv.setNoticeTitle(noticeTitle);
		nv.setAdminId(adminId);
		nv.setNoticeContent(noticeContent);

		int cnt = noticeService.registNotice(nv);
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
