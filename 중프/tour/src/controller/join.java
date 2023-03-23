package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.Response;

import service.IMemberService;
import service.ITourReservationService;
import service.MemberServiceImpl;
import service.TourMemberService;
import service.TourMemberServiceImpl;
import sun.print.resources.serviceui;
import vo.MemberVO;


@MultipartConfig
@WebServlet("/join.do")
public class join extends HttpServlet {
	
	TourMemberServiceImpl service = TourMemberServiceImpl.getService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	req.getRequestDispatcher("/WEB-INF/views/join/join.jsp").forward(req, resp);
	}

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String memId = req.getParameter("memId");     
		String memNm = req.getParameter("memNm");     
		String memRegno1 = req.getParameter("memRegno1"); 
		String memRegno2 = req.getParameter("memRegno2") ; 
		String memPw = req.getParameter("memPw");     
		String memTel = req.getParameter("memTel") ;    
		String memAddr = req.getParameter("memAddr") ;   
		String memAddr2 = req.getParameter("memAddr2") ;   
		String memEmail = req.getParameter("memEmail")  ;  
		
		System.out.println(memId + memNm + memRegno1 + memRegno2 + memPw + memTel + memAddr + memAddr2+ memEmail);
		
		//서비스 객체 생성하기
		TourMemberService service = TourMemberServiceImpl.getInstance();

		MemberVO memberVO = new MemberVO();
		
		memberVO.setMemId(memId);
		memberVO.setMemNm(memNm);
		memberVO.setMemRegno1(memRegno1);
		memberVO.setMemRegno2(memRegno2);
		memberVO.setMemPw(memPw);
		memberVO.setMemTel(memTel);
		memberVO.setMemAddr(memAddr);
		memberVO.setMemAddr2(memAddr2);
		memberVO.setMemEmail(memEmail);
		
		int cnt = service.joinMember(memberVO);
		
		
		if(cnt>0) {
			req.getRequestDispatcher("/login.do").forward(req, resp);
			System.out.println("가입성공");
			req.getSession().setAttribute("msg", "가입성공! ");
		}else {
			req.getRequestDispatcher("/join.do").forward(req, resp);
			System.out.println("가입실패");
			req.getSession().setAttribute("msg", "가입실패!!!");
		}
//		if(msg.equals("가입이 완료 되었습니다. 로그인 창으로 이동합니다")) {
//			req.getRequestDispatcher("/tour/login.do");
//		} else {
//			req.getRequestDispatcher("/tour/join.do");
//			
//		}
		  
		 

		
		
		
	}
}
