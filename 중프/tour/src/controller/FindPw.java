package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.TourMemberServiceImpl;
import vo.MemberVO;

//비밀번호 찾기
@MultipartConfig
@WebServlet("/findPw.do")
public class FindPw extends HttpServlet{

	TourMemberServiceImpl service = TourMemberServiceImpl.getService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/logIn/findPw.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String memId = req.getParameter("memId");
		String memNm = req.getParameter("memNm");
		String memTel = req.getParameter("memTel");
		   
		   MemberVO memberVO = new MemberVO();
		   memberVO.setMemId(memId);
		   memberVO.setMemNm(memNm);
		   memberVO.setMemTel(memTel);
		   System.out.println(memberVO);
		   
		   //1)비밀번호 찾기
		   MemberVO findPw = service.findPw(memberVO);
		   System.out.println("1");
		   System.out.println("findpw -> memberVO: " + findPw);
		   String pmsg = "";
		  
		   
		   
		   System.out.println("2");
		   if(findPw != null && findPw.getMemId().length() > 0) {
			   req.getSession().setAttribute("memPw", findPw);
			   resp.sendRedirect("/tour/findPwRe.do");
			   System.out.println("비밀번호 매칭 성공");
			   req.getSession().setAttribute("memId", memId);
			   req.getSession().setAttribute("memNm", memNm);
			   req.getSession().setAttribute("memTel", memTel);
		   }else {
			   req.getSession().setAttribute("memPw", "NOPW");
			   resp.sendRedirect("/tour/login.do");
			   System.out.println("비밀번호 매칭 실패");
			   pmsg = "실패"; 
		   }
		   HttpSession session = req.getSession();
			session.setAttribute("pmsg", pmsg);
//		   req.getRequestDispatcher("/findPwRe.do").forward(req, resp);
	}
}
