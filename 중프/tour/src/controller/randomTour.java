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
import javax.servlet.http.HttpSession;

import service.RandomTourServiceImpl;
import service.TourReservationServiceImpl;
import vo.TourVO;


@WebServlet("/randomTour.do")
public class randomTour extends HttpServlet {
	
	public randomTour() {
		super();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		
		RandomTourServiceImpl service = RandomTourServiceImpl.getService();
		String bo_table = req.getParameter("bo_table");
		String sca = req.getParameter("sca");
		String sop = req.getParameter("sop");
		String sfl = req.getParameter("sfl");
		String stx = req.getParameter("stx");
		System.out.println(stx);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bo_table", bo_table);
		map.put("sca", sca);
		map.put("sop", sop);
		map.put("sfl", sfl);
		map.put("stx", stx);
		
		List<TourVO> list = service.randomTourList(map);
		
		req.setAttribute("list", list);
		
		RequestDispatcher disp = req.getRequestDispatcher("WEB-INF/views/tourHelp/randomTour.jsp");
		disp.forward(req, resp);
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
	
	
}
