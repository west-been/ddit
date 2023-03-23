

package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.INoticeService;
import service.NoticeServiceImpl;
import vo.NoticeVO;


@WebServlet("/noticeDetail.do")
public class NoticeDetail extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 파라미터 값 조회
		String noticeCode = req.getParameter("noticeCode");

		// 서비스 객체 생성
		INoticeService noticeService = NoticeServiceImpl.getInstance();

		NoticeVO  nv = noticeService.getNotice(noticeCode);
		
		noticeService.updateHits(nv);

		//글 상세 보기 조회
		req.setAttribute("nv", nv);


		// JSP에게 포워딩 처리
		RequestDispatcher disp = req.getRequestDispatcher("WEB-INF/views/notice/noticeDetail.jsp");
		disp.forward(req, resp);

	}


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


		doGet(req, resp);


	}






}
