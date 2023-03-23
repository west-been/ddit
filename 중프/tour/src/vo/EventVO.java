package vo;

public class EventVO {

	private String adminId; // 관리자아이디
	private String eventCode; // 축제코드
	private String eventNm; // 축제명
	private String eventLocation; // 축제장소
	private String eventPeriod; // 축제기간
	private String eventHost; // 주최자
	private String eventTel; // 문의전화
	private String atchFile;// 첨부파일
	private int eventNum; // 축제번호
	// private int eventHits; // 조회수

//	public int getEventHits() {
//		return eventHits;
//	}
//
//	public void setEventHits(int eventHits) {
//		this.eventHits = eventHits;
//	}

	public String getAdminId() {
		return adminId;
	}

	public String getEventPeriod() {
		return eventPeriod;
	}

	public void setEventPeriod(String eventPeriod) {
		this.eventPeriod = eventPeriod;
	}

	public int getEventNum() {
		return eventNum;
	}

	public void setEventNum(int eventNum) {
		this.eventNum = eventNum;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getEventCode() {
		return eventCode;
	}

	public void setEventCode(String eventCode) {
		this.eventCode = eventCode;
	}

	public String getEventNm() {
		return eventNm;
	}

	public void setEventNm(String eventNm) {
		this.eventNm = eventNm;
	}

	public String getEventLocation() {
		return eventLocation;
	}

	public void setEventLocation(String eventLocation) {
		this.eventLocation = eventLocation;
	}

	public String getEvertPeriod() {
		return eventPeriod;
	}

	public void setEvertPeriod(String eventPeriod) {
		this.eventPeriod = eventPeriod;
	}

	public String getEventHost() {
		return eventHost;
	}

	public void setEventHost(String eventHost) {
		this.eventHost = eventHost;
	}

	public String getEventTel() {
		return eventTel;
	}

	public void setEventTel(String eventTel) {
		this.eventTel = eventTel;
	}

	public String getAtchFile() {
		return atchFile;
	}

	public void setAtchFile(String atchFile) {
		this.atchFile = atchFile;
	}

	@Override
	public String toString() {
		return "EventVO [adminId=" + adminId + ", eventCode=" + eventCode + ", eventNm=" + eventNm + ", eventLocation="
				+ eventLocation + ", eventPeriod=" + eventPeriod + ", eventHost=" + eventHost + ", eventTel=" + eventTel
				+ ", atchFile=" + atchFile + ", eventNum=" + eventNum + "]";
	}

}
