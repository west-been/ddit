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

@WebServlet("/qnaUpdate.do")
public class QnaUpdate extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 파라미터 값 조회
		String qnaCode = req.getParameter("qnaCode");

		// 서비스객체 생성
		IQnaService qnaService = QnaServiceImpl.getInstance();

		QnaVO qv = qnaService.selectQna(qnaCode);

		req.setAttribute("qv", qv);
		req.getRequestDispatcher("WEB-INF/views/qna/qnaUpdate.jsp").forward(req, resp);


	}


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("utf-8"); 
		resp.setCharacterEncoding("utf-8");


		// 파라미터 값 가져오기
		String qnaCode = req.getParameter("qnaCode");
		String qnaTitle = req.getParameter("qnaTitle");
		String memId = req.getParameter("memId");
		String qnaContent = req.getParameter("qnaContent");

		// 서비스 객체 생성하기
		
		IQnaService qnaService = QnaServiceImpl.getInstance();
		
		QnaVO qv = new QnaVO();
		qv.setQnaCode(qnaCode);
		qv.setMemId(memId);
		qv.setQnaTitle(qnaTitle);
		qv.setQnaContent(qnaContent);
		
		
		int cnt = qnaService.updateQna(qv);
		
		String msg = "";
		if(cnt > 0 ){
			msg="성공";
		}else {
			msg="실패";
		}
		
		req.getSession().setAttribute("msg", msg);
		resp.sendRedirect("/tour/qna.do");

	}
}
