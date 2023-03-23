package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.IMemberService;
import service.IQnaService;
import service.MemberServiceImpl;
import service.QnaServiceImpl;
import vo.MemberVO;
import vo.QnaVO;

@WebServlet("/qnaDetail.do")
public class QnaDetail extends HttpServlet{

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 파라미터 값 조회
		String qnaCode = req.getParameter("qnaCode");
		
		// 서비스 객체 생성하기
		IQnaService qnaService = QnaServiceImpl.getInstance();

		QnaVO qv = qnaService.selectQna(qnaCode);


		
		
		// 글 상세보기 조회
		req.setAttribute("qv", qv);
		
		// jsp에게 포워딩 처리
		RequestDispatcher disp = req.getRequestDispatcher("WEB-INF/views/qna/qnaDetail.jsp");
		disp.forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
}
