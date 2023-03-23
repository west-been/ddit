package service;

import java.util.List;
import java.util.Map;

import dao.SurveyDaoImpl;
import dao.TourMyBaitsDao;
import vo.SurveyVO;

public class SurveyServiceImpl extends TourMyBaitsDao implements ISurveyService {
	
	private SurveyDaoImpl surveyDao;
	private static SurveyServiceImpl surveyService;
	
	private SurveyServiceImpl() {
		surveyDao = SurveyDaoImpl.getSurveyDao();
	}
	
	public static SurveyServiceImpl getService() {
		if(surveyService == null) surveyService = new SurveyServiceImpl();
		return surveyService;
	}
	
	@Override
	public int insertSurvey(SurveyVO sv) {
		
		int cnt = surveyDao.insertSurvey(sv);
		
		return cnt;
	}

	@Override
	public List<SurveyVO> surveyList(Map<String, Object> map) {
		
		List<SurveyVO> surveyList = surveyDao.surveyList(map);
		
		return surveyList;
	}
	
	@Override
	public int countList() {
		int cnt = 0;
		cnt = surveyDao.countList();
		return cnt;
	}

}
