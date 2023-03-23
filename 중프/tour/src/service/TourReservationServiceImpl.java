package service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import dao.TourReservationDaoImpl;
import vo.ReservationVO;
import vo.TourVO;

public class TourReservationServiceImpl implements ITourReservationService{

	private TourReservationDaoImpl dao;
	private static TourReservationServiceImpl service;
	
	private TourReservationServiceImpl() {
		dao = TourReservationDaoImpl.getDao();
	}
	
	public static TourReservationServiceImpl getService() {
		if(service == null) service = new TourReservationServiceImpl();
		return service;
	}
	
	public List<TourVO> tourList(Map<String, Object> map){
		List<TourVO> list = null;
		try {
			list = dao.tourList(map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public TourVO getTour(String tourCode) {
		return dao.getTour(tourCode);
	}

	@Override
	public int countList() {
		int cnt = 0;
		try {
			cnt = dao.countList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	public int insertSpot(TourVO tv) {
		int cnt = dao.insertSpot(tv);
		return cnt;
	}

	@Override
	public int reservationTour(ReservationVO rv) {
		int cnt = dao.insertReservation(rv);
		if(cnt>0) {
			// 메일발송기능 호출....
		}
		return cnt;
	}

	@Override
	public ReservationVO getReserv(String resCode) {
		return dao.getReserv(resCode);
	}

	@Override
	public boolean countReservation(ReservationVO rv) {
		boolean exist = dao.countReservation(rv);
		return exist;
	}

	@Override
	public int updateReservState(ReservationVO rv) {
		 int cnt = dao.updateReservState(rv);
		return cnt;
	}

	@Override
	public int updateTourCapacity(TourVO tv) {
		int cnt = dao.updateTourCapacity(tv);
		return cnt;
	}

	@Override
	public int cancelReserv(String resCode) {
		int cnt = dao.deleteReserv(resCode);
		return cnt;
	}

	@Override
	public int updateCancelTourCapacity(String resCode) {
		int cnt = dao.updateCancelTourCapacity(resCode);
		return cnt;
	}

	@Override
	public String getResCode(ReservationVO rv) {
		return dao.getResCode(rv);
	}

	@Override
	public int updateMileage(ReservationVO rv) {
		int cnt = dao.updateMileage(rv);
		return cnt;
	}

	@Override
	public int returnMileage(ReservationVO rv) {
		int cnt = dao.returnMileage(rv);
		return cnt;
	}

	
	@Override
	public int updateResStatus(ReservationVO rv) {
		int cnt = dao.updateResStatus(rv);
		return cnt;
	}

	@Override
	public int checkTourEndDate(TourVO tv) {
		int cnt = dao.checkTourEndDate(tv);
		return cnt;
	}

	@Override
	public int refundMileage(Map<String, Object> map) {
		int cnt = dao.refundMileage(map);
		return cnt;
	}
}



















