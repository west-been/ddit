package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.IQnaService;
import service.QnaServiceImpl;

@WebServlet("/qnaDelete.do")
public class QnaDelete extends HttpServlet{ 



	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String qnaCode = req.getParameter("qnaCode");

		IQnaService qnaService = QnaServiceImpl.getInstance();

		int cnt = qnaService.deleteQna(qnaCode);

		String msg = "";
		if(cnt>0) {
			msg = "성공";
		}else {
			msg = "실패";
		}

		req.getSession().setAttribute("msg", msg);

		resp.sendRedirect(req.getContextPath() + "/qna.do");

	}


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		doGet(req, resp);

	}
}
