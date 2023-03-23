package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.jasper.tagplugins.jstl.core.Remove;

import service.TourMemberServiceImpl;
import vo.MemberVO;

@MultipartConfig
@WebServlet("/findPwRe.do")
//비밀번호 찾기
public class FindPwRe extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/logIn/findPwRe.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("hello");
		req.setCharacterEncoding("UTF-8");
		
		String memPw = req.getParameter("memPw");
		
		 HttpSession session = req.getSession();
		 
		String memId = (String) session.getAttribute("memId");
		String memNm = (String)session.getAttribute("memNm");
		String memTel = (String)session.getAttribute("memTel");
		
		System.out.println("memId: " + memId +"memNm: " + memNm + "memTel: " + memTel );
		   
		TourMemberServiceImpl service = TourMemberServiceImpl.getService();
		   MemberVO memberVO = new MemberVO();
		   memberVO.setMemId(memId);
		   memberVO.setMemNm(memNm);
		   memberVO.setMemTel(memTel);
		   memberVO.setMemPw(memPw);
		   System.out.println(memberVO);
		   
		   System.out.println("123");
		   int cnt = service.findPwRe(memberVO);
		   System.out.println(cnt);
		   System.out.println("너냐?");
		   
		   session.removeAttribute("memId");
		  
		   resp.sendRedirect(req.getContextPath()+"/login.do");
	}
}
