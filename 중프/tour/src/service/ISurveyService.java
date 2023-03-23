package service;

import java.util.List;
import java.util.Map;

import vo.SurveyVO;

public interface ISurveyService {

	public int insertSurvey(SurveyVO sv);
	
	public List<SurveyVO> surveyList(Map<String, Object>map);
	/**
     * 전체 글 갯수 조회하기
     */
    public int countList();
}
