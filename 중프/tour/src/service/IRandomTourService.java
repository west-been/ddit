package service;

import java.util.List;
import java.util.Map;

import vo.TourVO;

public interface IRandomTourService {
	
	// 랜덤투어 검색기능
	public List<TourVO> randomTourList(Map<String, Object> map);
	
	// 랜덤추천 기능
	public List<TourVO> randomPickList(Map<String, Object> map);
}
