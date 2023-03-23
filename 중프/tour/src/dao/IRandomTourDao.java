package dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import vo.TourVO;

public interface IRandomTourDao {
	// 랜덤추천 페이지 검색기능
	public List<TourVO> randomTourList(Map<String, Object> map) throws SQLException;
	
	// 랜덤추천 기능
	public List<TourVO> randomPickList(Map<String, Object> map) throws SQLException;
}
