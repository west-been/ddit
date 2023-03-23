package service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import dao.ReviewDaoImpl;
import dao.TourMyBaitsDao;
import vo.ReviewVO;

public class ReviewServiceImpl extends TourMyBaitsDao implements IReviewService {

	private ReviewDaoImpl reviewDao;
	private static ReviewServiceImpl reviewService;
	
	private ReviewServiceImpl() {
		reviewDao = ReviewDaoImpl.getDao();
	}
	
	public static ReviewServiceImpl getService() {
		if(reviewService == null) reviewService = new ReviewServiceImpl();
		return reviewService;
	}
	
	
	@Override
	public int reviewWrite(ReviewVO rv) {
	
		int cnt = reviewDao.reviewWrite(rv);
		
		return cnt;
	}

	@Override
	public List<ReviewVO> selectAllReview(Map<String, Object> map) {
		
		List<ReviewVO> reviewList = reviewDao.selectAllReview(map);
		
		return reviewList;
	}

	@Override
	public int countList() {
		int cnt = 0;
		try {
			cnt = reviewDao.countList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public ReviewVO getReview(String revCode) {
		
		return reviewDao.getReview(revCode);
	}

	@Override
	public int updateReview(ReviewVO rv) {
		int cnt = reviewDao.updateReview(rv);
				
		return cnt;
	}
	public int deleteReview(String revCode) {
		int cnt = reviewDao.deleteReview(revCode);

		return cnt;
	}

	@Override
	public int updateHits(ReviewVO rv) {
		int cnt = reviewDao.updateHits(rv);
		
		return cnt;
	}

	@Override
	public ReviewVO scoreAvg(String tourCode) {
		return reviewDao.scoreAvg(tourCode);
	
	}

	@Override
	public List<ReviewVO> tourReview(String tourCode) {
		
		List<ReviewVO> tourReviewList = reviewDao.tourReview(tourCode);
		
		return tourReviewList;
	}
}
