package dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import vo.ReviewVO;

public class ReviewDaoImpl extends TourMyBaitsDao implements IReviewDao {

	private static ReviewDaoImpl reviewDao;
	
	public static ReviewDaoImpl getDao() {
		if(reviewDao == null) {
			reviewDao = new ReviewDaoImpl();
		}
		return reviewDao;
	}
	
	@Override
	public int reviewWrite(ReviewVO rv) {
		
		return insert("review.reviewWrite",rv);
	}

	@Override
	public List<ReviewVO> selectAllReview(Map<String, Object> map) {
		
		return selectList("review.reviewList", map);
	}

	public int countList() throws SQLException{
		
		return selectOne("review.reviewCountList", null);
	}

	@Override
	public ReviewVO getReview(String revCode) {
		
		return selectOne("review.reviewDetail", revCode);
	}

	@Override
	public int updateReview(ReviewVO rv) {
		
		return update("review.updateReview", rv);
	}

	@Override
	public int deleteReview(String revCode) {
		
		return delete("review.deleteReview", revCode);
	}

	@Override
	public int updateHits(ReviewVO rv) {
		
		return update("review.reviewUpdateHits", rv);
	}

	@Override
	public ReviewVO scoreAvg(String tourCode) {
		return selectOne("review.scoreAvg",tourCode);
	}


	@Override
	public List<ReviewVO>tourReview(String tourCode) {
		
		return selectList("review.tourReview", tourCode);
	}

}
