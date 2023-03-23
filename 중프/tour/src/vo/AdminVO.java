package vo;

import java.util.Date;

public class AdminVO {
	private String adminId;
    private String adminNm;
    private String adminPw;
    private String adminTel;
    private String adminEmail;
    private String adminAddr;
    private String adminAdd2;
	private String atchFile;// 첨부파일

	private String qnaCode;
	private String memId;
	private String qnaTitle;
	private String qnaContent;
	private String qnaDate;
	private String qnaStatus; 
	
	private String resCode;
	private String resDate;
	private String resPrice;
	private String resQty;
	private String resStatus;
	private String tourNm;
	public String tourCode;
	public Date visitDate;
	public String useMileage;

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
	public String getTourNm() {
		return tourNm;
	}
	public void setTourNm(String tourNm) {
		this.tourNm = tourNm;
	}
	public String getTourCode() {
		return tourCode;
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
	public String getUseMileage() {
		return useMileage;
	}
	public void setUseMileage(String useMileage) {
		this.useMileage = useMileage;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getQnaTitle() {
		return qnaTitle;
	}
	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}
	public String getQnaContent() {
		return qnaContent;
	}
	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}

	public String getQnaStatus() {
		return qnaStatus;
	}
	public void setQnaStatus(String qnaStatus) {
		this.qnaStatus = qnaStatus;
	}
	public String getReplyTitle() {
		return replyTitle;
	}
	public void setReplyTitle(String replyTitle) {
		this.replyTitle = replyTitle;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public Date getReplyDate() {
		return replyDate;
	}
	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}
	public String getReplyStatus() {
		return replyStatus;
	}
	public void setReplyStatus(String replyStatus) {
		this.replyStatus = replyStatus;
	}
	public String getMemNm() {
		return memNm;
	}
	public void setMemNm(String memNm) {
		this.memNm = memNm;
	}

	private String replyTitle;
	private String replyContent;
	private Date replyDate;
	private String replyStatus;
	private String memNm;
	

	public String getQnaCode() {
		return qnaCode;
	}
	public void setQnaCode(String qnaCode) {
		this.qnaCode = qnaCode;
	}
	public String getAtchFile() {
		return atchFile;
	}
	public void setAtchFile(String atchFile) {
		this.atchFile = atchFile;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getAdminNm() {
		return adminNm;
	}
	public void setAdminNm(String adminNm) {
		this.adminNm = adminNm;
	}
	public String getAdminPw() {
		return adminPw;
	}
	public void setAdminPw(String adminPw) {
		this.adminPw = adminPw;
	}
	public String getAdminTel() {
		return adminTel;
	}
	public void setAdminTel(String adminTel) {
		this.adminTel = adminTel;
	}
	public String getAdminEmail() {
		return adminEmail;
	}
	public void setAdminEmail(String adminEmail) {
		this.adminEmail = adminEmail;
	}
	public String getAdminAddr() {
		return adminAddr;
	}
	public void setAdminAddr(String adminAddr) {
		this.adminAddr = adminAddr;
	}

    public String getAdminAdd2() {
		return adminAdd2;
	}
	public void setAdminAdd2(String adminAdd2) {
		this.adminAdd2 = adminAdd2;
	}

	public String getQnaDate() {
		return qnaDate;
	}
	public void setQnaDate(String qnaDate) {
		this.qnaDate = qnaDate;
	}
	public String getResDate() {
		return resDate;
	}
	public void setResDate(String resDate) {
		this.resDate = resDate;
	}
	@Override
	public String toString() {
		return "AdminVO [adminId=" + adminId + ", adminNm=" + adminNm + ", adminPw=" + adminPw + ", adminTel="
				+ adminTel + ", adminEmail=" + adminEmail + ", adminAddr=" + adminAddr + ", adminAddr=" + adminAddr + "]";
	}

	
	
}
