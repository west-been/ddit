package dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import vo.ReservationVO;
import vo.TourVO;

public class TourReservationDaoImpl extends TourMyBaitsDao implements ITourReservationDao{

	private static TourReservationDaoImpl dao;
	
	
	public static TourReservationDaoImpl getDao() {
		if(dao == null) dao = new TourReservationDaoImpl();
		return dao;
	}
	

	public List<TourVO> tourList(Map<String, Object> map)throws SQLException{
		return selectList("tour.tourList", map);
	}
	

	@Override
	public TourVO getTour(String tourCode) {
		return selectOne("tour.selectTour", tourCode);
	}

	@Override
	public int countList() throws SQLException {
		return selectOne("tour.countList", null);
	}


	@Override
	public int insertReservation(ReservationVO rv) {
		return insert("reservation.insertreservation",rv);
	}


	@Override
	public ReservationVO getReserv(String resCode) {
		return selectOne("reservation.selectReserv", resCode);
	}

	

	@Override
	public int insertSpot(TourVO tv) {
		return insert("tour.insertSpot", tv);
	}


	@Override
	public boolean countReservation(ReservationVO rv) {
		
		boolean isExist = false;
		
		int cnt = (int) selectOne("reservation.countReserv", rv);
		
		if(cnt > 0) {
			isExist = true;
		}
		return isExist;
	}


	@Override
	public int updateReservState(ReservationVO rv) {
		return update("reservation.updateReservState", rv);
	}


	@Override
	public int updateTourCapacity(TourVO tv) {
		return update("reservation.updateTourCapacity", tv);
	}


	@Override
	public int deleteReserv(String resCode) {
		return delete("reservation.deleteReserv", resCode);
	}


	@Override
	public int updateCancelTourCapacity(String resCode) {
		return update("reservation.updateCancelTourCapacity", resCode);
	}


	@Override
	public String getResCode(ReservationVO rv) {
		return selectOne("reservation.selectResCodeMemIdAndTourCode", rv);
	}


	@Override
	public int updateMileage(ReservationVO rv) {
		return update("reservation.updateMileage", rv);
	}


	@Override
	public int returnMileage(ReservationVO rv) {
		return update("reservation.returnMileage", rv);
	}


	@Override
	public int updateResStatus(ReservationVO rv) {
		return update("reservation.updateResStatus", rv);
	}


	@Override
	public int checkTourEndDate(TourVO tv) {
		return update("tour.checkTourEndDate", tv);
	}


	@Override
	public int refundMileage(Map<String, Object> map) {
		return update("reservation.refundMileage", map);
	}

}



















