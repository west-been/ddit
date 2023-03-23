package service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import dao.RandomTourDaoImpl;
import vo.TourVO;

public class RandomTourServiceImpl implements IRandomTourService{

	private RandomTourDaoImpl dao;
	private static RandomTourServiceImpl service;
	
	private RandomTourServiceImpl() {
		dao = RandomTourDaoImpl.getDao();
	}
	
	public static RandomTourServiceImpl getService() {
		if(service == null) service = new RandomTourServiceImpl();
		return service;
	}
	
	public List<TourVO> randomTourList(Map<String, Object> map){
		List<TourVO> list = null;
		try {
			list = dao.randomTourList(map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<TourVO> randomPickList(Map<String, Object> map) {
		List<TourVO> list = null;
		try {
			list = dao.randomPickList(map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
