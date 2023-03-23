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
import vo.MemberVO;
import vo.QnaVO;
import vo.ReservationVO;

@WebServlet("/mypage.do")
public class Mypage extends HttpServlet {
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//파라미터 값 조회
		String memId = req.getParameter("memId");

		//서비스 객체 생성하기
		IMemberService service = MemberServiceImpl.getService();
		
		
		MemberVO mv = service.getMember(memId);
		
		List<ReservationVO> rvList = service.selectMypageReserv(memId);
		System.out.println(mv.getMemId() + " : " + rvList);
		
		List<QnaVO> qvList = service.mypageQnaList(memId);
		System.out.println(mv.getMemId() + ":" + qvList);
		
		req.setAttribute("mv", mv);
		req.setAttribute("rvList", rvList);
		req.setAttribute("qvList", qvList);
		
		//회원목록  화면 처리하기 
		RequestDispatcher disp = req.getRequestDispatcher("/WEB-INF/views/mypage/mypage.jsp");
		disp.forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}

