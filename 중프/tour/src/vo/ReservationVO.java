package vo;

import java.util.Date;

public class ReservationVO {

	private String resCode;
	private String resDate;
	private String resPrice;
	private String resQty;
	private String resStatus;
	private String adminId;
	private String memId;
	private String tourNm;
	public String tourCode;
	public String visitDate;
	public String useMileage;
	private String 	startTime;
	private String 	endTime;
	private String 	startDate;
	private String 	endDate;
	private String  tourLocation;
	
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getTourLocation() {
		return tourLocation;
	}
	public void setTourLocation(String tourLocation) {
		this.tourLocation = tourLocation;
	}
	public String getUseMileage() {
		return useMileage;
	}
	public void setUseMileage(String useMileage) {
		this.useMileage = useMileage;
	}
	public String getTourNm() {
		return tourNm;
	}
	public void setTourNm(String tourNm) {
		this.tourNm = tourNm;
	}
	
	public String getResCode() {
		return resCode;
	}
	public void setResCode(String resCode) {
		this.resCode = resCode;
	}

	public String getResPrice() {
		return resPrice;
	}
	public void setResPrice(String resPrice) {
		this.resPrice = resPrice;
	}
	public String getResQty() {
		return resQty;
	}
	public void setResQty(String resQty) {
		this.resQty = resQty;
	}
	public String getResStatus() {
		return resStatus;
	}
	public void setResStatus(String resStatus) {
		this.resStatus = resStatus;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getTourCode() {
		return tourCode;
	}
	public void setTourCode(String tourCode) {
		this.tourCode = tourCode;
	}
	public String getResDate() {
		return resDate;
	}
	public void setResDate(String resDate) {
		this.resDate = resDate;
	}
	public String getVisitDate() {
		return visitDate;
	}
	public void setVisitDate(String visitDate) {
		this.visitDate = visitDate;
	}
	@Override
	public String toString() {
		return "ReservationVO [resCode=" + resCode + ", resDate=" + resDate + ", resPrice=" + resPrice + ", resQty="
				+ resQty + ", resStatus=" + resStatus + ", adminId=" + adminId + ", memId=" + memId + ", tourNm="
				+ tourNm + ", tourCode=" + tourCode + ", visitDate=" + visitDate + ", useMileage=" + useMileage
				+ ", startTime=" + startTime + ", endTime=" + endTime + ", startDate=" + startDate + ", endDate="
				+ endDate + ", tourLocation=" + tourLocation + "]";
	}
	
	
	
}
