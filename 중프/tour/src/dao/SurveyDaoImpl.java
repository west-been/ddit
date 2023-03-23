package dao;

import java.util.List;
import java.util.Map;

import vo.SurveyVO;

public class SurveyDaoImpl extends TourMyBaitsDao implements ISurveyDao {

	private static SurveyDaoImpl surveyDao;
	
	public static SurveyDaoImpl getSurveyDao() {
		if(surveyDao == null) {
			surveyDao = new SurveyDaoImpl();
		}
		return surveyDao;
		
	}
	
	@Override
	public int insertSurvey(SurveyVO sv) {
		
		return insert("survey.insertSurvey", sv);
	}

	@Override
	public List<SurveyVO> surveyList(Map<String, Object> map) {
		
		return selectList("survey.surveyList", map);
	}

	public int countList() {
		
		return selectOne("survey.surveyCountList", null);
	}

}
