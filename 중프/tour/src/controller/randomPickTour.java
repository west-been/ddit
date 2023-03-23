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

import service.RandomTourServiceImpl;
import vo.TourVO;


@WebServlet("/randomPickTour.do")
public class randomPickTour extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		
    	RandomTourServiceImpl service = RandomTourServiceImpl.getService();
    	String ranCnt = req.getParameter("randomCount");
    	
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("ranCnt", ranCnt);
    	
    	List<TourVO> list = service.randomPickList(map);
		
		req.setAttribute("list", list);
		
		RequestDispatcher disp = req.getRequestDispatcher("WEB-INF/views/tourHelp/randomTour.jsp");
		disp.forward(req, resp);
    	
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	doGet(req, resp);
    }
}
