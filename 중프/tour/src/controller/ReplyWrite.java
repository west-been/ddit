package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.IQnaService;
import service.QnaServiceImpl;
import vo.QnaVO;

@WebServlet("/replyWrite.do")
public class ReplyWrite extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//파라미터 값 조회
		String qnaCode = req.getParameter("qnaCode");

		//서비스 객체 생성
		IQnaService qnaService = QnaServiceImpl.getInstance();

		QnaVO qv = qnaService.selectQna(qnaCode);

		req.setAttribute("qv", qv);
		
		req.getRequestDispatcher("WEB-INF/views/qna/replyWrite.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 파라미터 값 
		req.setCharacterEncoding("utf-8");	
		resp.setCharacterEncoding("utf-8");	

		String qnaStatus = req.getParameter("qnaStatus");
		String adminId = req.getParameter("adminId");
		String adminNm = req.getParameter("adminNm");
		String replyTitle = req.getParameter("replyTitle");
		String replyContent = req.getParameter("replyContent");
		// 	String replyDate = req.getParameter("replyDate");
		String qnaCode = req.getParameter("qnaCode");
		String replyStatus = req.getParameter("replyStatus");

		IQnaService qnaService = QnaServiceImpl.getInstance();

		QnaVO qv = new QnaVO();
		qv.setQnaStatus(qnaStatus);
		qv.setAdminId(adminId);
		qv.setAdminNm(adminNm);
		qv.setReplyTitle(replyTitle);
		qv.setReplyContent(replyContent);
		// qv.setReplyDate(replyDate);
		qv.setQnaCode(qnaCode);
		qv.setReplyStatus(replyStatus);

		
		qnaService.insertReply(qv);

		
		resp.sendRedirect("/tour/qna.do");
	}
}
