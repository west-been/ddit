package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import service.IMemberService;
import service.MemberServiceImpl;
import service.SurveyServiceImpl;
import vo.AdminVO;
import vo.MemberVO;
import vo.QnaVO;
import vo.ReservationVO;
import vo.SurveyVO;

@WebServlet("/mypageAdmin.do")
public class MypageAdmin extends HttpServlet {
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//파라미터 값 조회
		//String memId = req.getParameter("memId");
		String adminId = req.getParameter("adminId");

		//서비스 객체 생성하기
		IMemberService service = MemberServiceImpl.getService();
		SurveyServiceImpl surveyService = SurveyServiceImpl.getService();
		
		int end = surveyService.countList();
		int start = 1;
		MemberVO mv = new MemberVO();
		//MemberVO mv = service.getMember(memId);
		AdminVO av = service.getAdminLogin(adminId);
		
		
		List<ReservationVO> rvList = service.getAdminReserv(adminId);
		List<QnaVO> qvList = service.getAdminQna(adminId);
		
		req.setAttribute("mv", mv);
		req.setAttribute("av", av);
		req.setAttribute("rvList", rvList);
		req.setAttribute("qvList", qvList);
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		
		List<SurveyVO> surveyList = surveyService.surveyList(map);
		req.setAttribute("surveyList", surveyList);
		
		//회원목록  화면 처리하기 
		RequestDispatcher disp = req.getRequestDispatcher("/WEB-INF/views/mypage/mypageAdmin.jsp");
		disp.forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}

