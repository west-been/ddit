package service;

import java.util.List;
import java.util.Map;

import vo.ReviewVO;
import vo.TourVO;

public interface IReviewService {

	  /**
     * 리뷰등록 위한 메서드
     * @param rv 등록할 데이터가 저장된  ReviewVO객체
     * @return 리뷰등록이 성공하면 1이상의 값이 반환됨
     * 
     */
    public int reviewWrite(ReviewVO rv);
	
	/**
	 *  리뷰리스트를 출력하기 위한 메서드
	 */
    public List<ReviewVO> selectAllReview(Map<String, Object>map);
	
    /**
     * 전체 글 갯수 조회하기
     */
    public int countList();
    
    /**
     * 리뷰 상세조회
     */
    public ReviewVO getReview(String revCode);
    /**
     * 리뷰업데이트
     */
    public int updateReview(ReviewVO rv);
    /**
     * 리뷰삭제
     */
    public int deleteReview(String revCode);
    /**
     * 조회수올리기
     */
    public int updateHits(ReviewVO rv);
    /**
     * 여행지별 평점 조회
     */
    public ReviewVO scoreAvg(String tourCode);
    /**
     * 여행지별 리뷰 조회
     */
    public List<ReviewVO> tourReview(String tourCode);
    
}
    
    
    

