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


@WebServlet("/replyDelete.do")
public class ReplyDelete extends HttpServlet{

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//파라미터 값 조회
		String qnaCode = req.getParameter("qnaCode");

		//서비스 객체 생성
		IQnaService qnaService = QnaServiceImpl.getInstance();

		QnaVO qv = qnaService.selectQna(qnaCode);

		req.setAttribute("qv", qv);

		
		req.getRequestDispatcher("WEB-INF/views/qna/replyDelete.jsp").forward(req, resp);

	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8"); 
		resp.setCharacterEncoding("utf-8");
		
	
		// 파라미터 값 가져오기
		String qnaCode = req.getParameter("qnaCode");
		String qnaStatus = req.getParameter("qnaStatus");
		String replyTitle = req.getParameter("replyTitle");
		String replyContent = req.getParameter("replyContent");
	//	String replyDate = req.getParameter("replyDate");
		String adminId = req.getParameter("adminId");
		String replyStatus = req.getParameter("replyStatus");
	

		//서비스 객체 생성하기
		IQnaService qnaService = QnaServiceImpl.getInstance();

		QnaVO qv = new QnaVO();
		qv.setQnaCode(qnaCode);
		qv.setQnaStatus(qnaStatus);
		qv.setReplyTitle(replyTitle);
		qv.setReplyContent(replyContent);
		// qv.setReplyDate(replyDate);
		qv.setAdminId(adminId);
		qv.setReplyStatus(replyStatus);


		qnaService.deleteReply(qv);

	resp.sendRedirect("/tour/qna.do");
		

	}
}
