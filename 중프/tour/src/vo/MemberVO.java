package vo;

import java.util.Date;

public class MemberVO {
	private String memId;
	private String memNm;
	private String memRegno1;
	private String memRegno2;
	private String memPw;
	private String memTel;
	private String memAddr;
	private String memAddr2;
	private String memEmail;
	private String memStatus;
	private String memMileage;
	private String atchFile;// 첨부파일
	

	public String getAtchFile() {
		return atchFile;
	}

	public void setAtchFile(String atchFile) {
		this.atchFile = atchFile;
	}

	private String tourNm;
	private String resCode;
	private Date resDate;
	private String resPrice;
	private String resQty;
	private String resStatus;
	private String adminId;
	private String tourCode;
	private Date visitDate;

	
	private long atchFileId = -1;

	public String getTourCode() {
		return tourCode;
	}

	public long getAtchFileId() {
		return atchFileId;
	}

	public void setAtchFileId(long atchFileId) {
		this.atchFileId = atchFileId;
	}

	public void setTourCode(String tourCode) {
		this.tourCode = tourCode;
	}

	public Date getVisitDate() {
		return visitDate;
	}

	public void setVisitDate(Date visitDate) {
		this.visitDate = visitDate;
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

	public Date getResDate() {
		return resDate;
	}

	public void setResDate(Date resDate) {
		this.resDate = resDate;
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


	public String getMemNm() {
		return memNm;
	}

	public void setMemNm(String memNm) {
		this.memNm = memNm;
	}

	public String getMemRegno1() {
		return memRegno1;
	}

	public void setMemRegno1(String memRegno1) {
		this.memRegno1 = memRegno1;
	}

	public String getMemRegno2() {
		return memRegno2;
	}

	public void setMemRegno2(String memRegno2) {
		this.memRegno2 = memRegno2;
	}

	public String getMemPw() {
		return memPw;
	}

	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}

	public String getMemTel() {
		return memTel;
	}

	public void setMemTel(String memTel) {
		this.memTel = memTel;
	}

	public String getMemAddr() {
		return memAddr;
	}
	public String getMemAddr2() {
		return memAddr2;
	}
	
	public void setMemAddr2(String memAddr2) {
		this.memAddr2 = memAddr2;
	}

	public void setMemAddr(String memAddr) {
		this.memAddr = memAddr;
	}

	public String getMemEmail() {
		return memEmail;
	}

	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}

	public String getMemStatus() {
		return memStatus;
	}

	public void setMemStatus(String memStatus) {
		this.memStatus = memStatus;
	}

	public String getMemMileage() {
		return memMileage;
	}

	public void setMemMileage(String memMileage) {
		this.memMileage = memMileage;
	}

	@Override
	public String toString() {
		return "MemberVO [memId=" + memId + ", memNm=" + memNm + ", memRegno1=" + memRegno1 + ", memRegno2=" + memRegno2
				+ ", memPw=" + memPw + ", memTel=" + memTel + ", memAddr=" + memAddr + ", memAddr2=" + memAddr2
				+ ", memEmail=" + memEmail + ", memStatus=" + memStatus + ", memMileage=" + memMileage + "]";
	}

	

}
