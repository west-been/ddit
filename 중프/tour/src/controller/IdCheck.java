package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.TourMemberServiceImpl;

//221117_14:44 진짜 아이디 중복검사
@WebServlet("/idCheck.do")
public class IdCheck extends HttpServlet {
	
	
	TourMemberServiceImpl service = TourMemberServiceImpl.getService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		   String memId = req.getParameter("id");
		   int result = service.idCheck(memId);
		   
		   PrintWriter pw = resp.getWriter();
		   pw.print(result);
	}
}
