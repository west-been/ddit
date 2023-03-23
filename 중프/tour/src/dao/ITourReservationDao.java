package dao;

import java.sql.SQLException;
import java.util.Map;

import vo.ReservationVO;
import vo.TourVO;

public interface ITourReservationDao {

	//전체 글 갯수 조회하기
		public int countList() throws SQLException;
		
		/**
		 * 주어진 tourCode에 해당하는 여행정보 알아내기 위한 메서드
		 * @param tourCode 확인대상 여행코드
		 * @return 해당 투어코드에 맞는 여행정보
		 */
		public TourVO getTour(String tourCode);
		
		/**
		 * 결제시 결제상태를 변경해주는 메서드
		 */
		public int updateResStatus(ReservationVO rv);
		
		public boolean countReservation(ReservationVO rv);
		
		/**
		 * 예약코드를 매개변수로 받아서 해당 예약 정보를 삭제하는 메서드
		 * @param resCode 삭제할 예약코드
		 * @return 작업성공: 1 , 작업실패: 0
		 */
		public int deleteReserv(String resCode);
		
		/**
		 *  유료 관광지 추가 하는 메서드
		 */
		public int insertSpot(TourVO tv);
		
		
		public int insertReservation(ReservationVO rv);
		
		/**
		 * 주어진 투어코드에 해당하는 예약정보를 알아내기 위한 메서드
		 * @param tourCode 확인대상 투어코드
		 * @return 해당 투어코드에 맞는 예약정보
		 */
		public ReservationVO getReserv(String resCode);
		
		
		public int updateReservState(ReservationVO rv);
		
		// 예약하면 관광지 예약가능수 -1
		public int updateTourCapacity(TourVO tv);
		
		// 예약취소하면 관광지 예약가능수 +1
		public int updateCancelTourCapacity(String resCode);
		
		// 예약코드와 회원아이디를 통해 예약코드를 조회(select)
		public String getResCode(ReservationVO rv);
		
		// 예약시 마일리지 사용량 만큼 회원 마일리지 감소
		public int updateMileage(ReservationVO rv);
		
		// 예약취소시 마일리지 환불 사용량 만큼 회원 마일리지 증가
		public int returnMileage(ReservationVO rv);
		
		// 운영일자가 현재일자를 넘겼을 경우 예약가능인원을 0으로 변경해 예약불가 상태로 만든다.
		public int checkTourEndDate(TourVO tv);
		
		// 결제완료한 사람이 결제취소시 마일리지로 환불해줌
		public int refundMileage(Map<String, Object> map);
}
