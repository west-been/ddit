package dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import vo.TourVO;

public class RandomTourDaoImpl extends TourMyBaitsDao implements IRandomTourDao{
	
	private static RandomTourDaoImpl dao;
	
	public static RandomTourDaoImpl getDao() {
		if(dao == null) dao = new RandomTourDaoImpl();
		return dao;
	}
	
	public List<TourVO> randomTourList(Map<String, Object> map)throws SQLException{
		return selectList("randomtour.randomtourList", map);
	}

	@Override
	public List<TourVO> randomPickList(Map<String, Object> map) throws SQLException {
		return selectList("randomtour.randomPickList", map);
	}
}
