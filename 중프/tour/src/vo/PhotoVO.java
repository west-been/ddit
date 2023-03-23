package vo;

import java.sql.Date;

/**
 * DB테이블에 존재하는 컬럼이름을 기준으로 데이터를 객체화한 클래스
 */
public class PhotoVO {
	private String photoCode; // 사진코드
	private String adminId; // 관리자아이디
	private int photoNum; // 사진번호
	private String photoTitle; // 사진제목
	private Date photoDate; // 등록일
	private int photoHits; // 조회수
	private String atchFile;// 첨부파일
	private long atchFileId = -1;

	public String getAtchFile() {
		return atchFile;
	}

	public void setAtchFile(String atchFile) {
		this.atchFile = atchFile;
	}

	public long getAtchFileId() {
		return atchFileId;
	}

	public void setAtchFileId(long atchFileId) {
		this.atchFileId = atchFileId;
	}

	public String getPhotoCode() {
		return photoCode;
	}

	public void setPhotoCode(String photoCode) {
		this.photoCode = photoCode;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public int getPhotoNum() {
		return photoNum;
	}

	public void setPhotoNum(int photoNum) {
		this.photoNum = photoNum;
	}

	public String getPhotoTitle() {
		return photoTitle;
	}

	public void setPhotoTitle(String photoTitle) {
		this.photoTitle = photoTitle;
	}

	public Date getPhotoDate() {
		return photoDate;
	}

	public void setPhotoDate(Date photoDate) {
		this.photoDate = photoDate;
	}

	public int getPhotoHits() {
		return photoHits;
	}

	public void setPhotoHits(int photoHits) {
		this.photoHits = photoHits;
	}

	@Override
	public String toString() {
		return "PhotoVO [photoCode=" + photoCode + ", adminId=" + adminId + ", photoNum=" + photoNum + ", photoTitle="
				+ photoTitle + ", photoDate=" + photoDate + ", photoHits=" + photoHits + ", atchFile=" + atchFile
				+ ", atchFileId=" + atchFileId + "]";
	}

}
