package dao;

import java.util.List;
import java.util.Map;

import vo.ReviewVO;

public interface IReviewDao {

	//리뷰 등록
	public int reviewWrite(ReviewVO rv);
		
	public List<ReviewVO> selectAllReview(Map<String, Object>map);
	
	public ReviewVO getReview(String revCode);
	
	public int updateReview(ReviewVO rv);
	
	public int deleteReview(String revCode);
	
	public int updateHits(ReviewVO rv);
	
    public ReviewVO scoreAvg(String tourCode);
    
    public List<ReviewVO> tourReview(String tourCode);
    
}
