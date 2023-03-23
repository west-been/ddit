package controller.survey;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.SurveyServiceImpl;
import vo.SurveyVO;



@WebServlet("/surveyInsert.do")
public class SurveyInsert extends HttpServlet {

	public SurveyInsert() {
		super();
	}
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		
		
		
		req.getRequestDispatcher("WEB-INF/views/survey/survey.jsp").forward(req, resp);
	
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");	
		resp.setCharacterEncoding("utf-8");	
		
		String memId = req.getParameter("memId");
		String first = req.getParameter("first");
		String second = req.getParameter("second");
		String third = req.getParameter("third");
		String fourth = req.getParameter("fourth");
		String fifth = req.getParameter("fifth");
		
		SurveyServiceImpl surveyService = SurveyServiceImpl.getService();
		
		SurveyVO sv = new SurveyVO();
		sv.setMemId(memId);
		sv.setFirst(first);
		sv.setSecond(second);
		sv.setThird(third);
		sv.setFourth(fourth);
		sv.setFifth(fifth);
		
		int cnt = surveyService.insertSurvey(sv);
		
		resp.sendRedirect("/tour/index.do");
	}
	
	
}
