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

import service.TourReservationServiceImpl;
import vo.TourVO;


@WebServlet("/introduce.do")
public class Introduce extends HttpServlet{
	
	public Introduce() {
		super();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		TourReservationServiceImpl service = TourReservationServiceImpl.getService();
		
		int count = service.countList();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", 1);
		map.put("end", count);
		
		List<TourVO> list = service.tourList(map);
		
		req.setAttribute("list", list);
		
		
		RequestDispatcher disp = req.getRequestDispatcher("WEB-INF/views/introduce/introduce.jsp");
		disp.forward(req, resp);
	
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doGet(req, resp);
	}

}
