package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.TourMemberServiceImpl;
import vo.MemberVO;

//아이디 체크
@WebServlet("/idCheckForm.do")
public class IdCheckForm extends HttpServlet {
	
	
	TourMemberServiceImpl service = TourMemberServiceImpl.getService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("WEB-INF/views/logIn/login.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		   String id = req.getParameter("id");
		   System.out.println("id : " + id );
		   
		   MemberVO memberVO = new MemberVO();
		   memberVO.setMemId(id);
		 
		   
		   //1)
		   memberVO = service.loginMember(memberVO);
		   
//		   System.out.println("memberVO : " + memberVO.toString());
		   
		   if(memberVO !=null) {
			   
			   HttpSession session = req.getSession();
			   session.setAttribute("memberVO", memberVO);
			   resp.sendRedirect("/tour/index.do"); 
			   
			   
		   } else {
			   resp.sendRedirect("/tour/login.do"); 
			   
		   }
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
