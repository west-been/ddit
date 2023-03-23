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

@WebServlet("/qnaWrite.do")
public class QnaWrite extends HttpServlet {


	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/qna/qnaWrite.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("utf-8");	
		resp.setCharacterEncoding("utf-8");	

		String qnaCode = req.getParameter("qnaCode");
		String memId = req.getParameter("memId");
		String qnaTitle = req.getParameter("qnaTitle");
		String qnaContent = req.getParameter("qnaContent");
	//	String qnaDate = req.getParameter("qnaDate");
		String qnaStatus = req.getParameter("qnaStatus");
		

		IQnaService qnaService = QnaServiceImpl.getInstance();

		QnaVO qv = new QnaVO();
		qv.setQnaCode(qnaCode);
		qv.setMemId(memId);
		qv.setQnaTitle(qnaTitle);
		qv.setQnaContent(qnaContent);
		// qv.setQnaDate(qnaDate);
		qv.setQnaStatus(qnaStatus);


		int cnt = qnaService.insertQna(qv);
		String msg = "";
		if(cnt >0) {
			msg="성공";
		} else {
			msg = "실패";
		}

		req.getSession().setAttribute("msg", msg);
		resp.sendRedirect("/tour/qna.do");

	}
}
