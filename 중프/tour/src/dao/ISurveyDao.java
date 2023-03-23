package dao;

import java.util.List;
import java.util.Map;

import vo.SurveyVO;

public interface ISurveyDao {

	public int insertSurvey(SurveyVO sv);
	
	public List<SurveyVO> surveyList(Map<String, Object>map);
}
