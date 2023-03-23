package vo;

public class ReviewVO {
	
	private String revCode; 
	private String revTitle; 
	private String revContent;
	private String revDate; 
	private String revLike; 
	private String memId; 
	private String atchFile;
	private String tourCode;
	private String memNm;
	private String tourNm;
	private String revHits;
	private String score;
	private String scoreAvg;
	
	public String getScoreAvg() {
		return scoreAvg;
	}
	public void setScoreAvg(String scoreAvg) {
		this.scoreAvg = scoreAvg;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public String getRevHits() {
		return revHits;
	}
	public void setRevHits(String revHits) {
		this.revHits = revHits;
	}
	public String getRevCode() {
		return revCode;
	}
	public void setRevCode(String revCode) {
		this.revCode = revCode;
	}
	public String getRevTitle() {
		return revTitle;
	}
	public void setRevTitle(String revTitle) {
		this.revTitle = revTitle;
	}
	public String getRevContent() {
		return revContent;
	}
	public void setRevContent(String revContent) {
		this.revContent = revContent;
	}
	public String getRevDate() {
		return revDate;
	}
	public void setRevDate(String revDate) {
		this.revDate = revDate;
	}
	public String getRevLike() {
		return revLike;
	}
	public void setRevLike(String revLike) {
		this.revLike = revLike;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getAtchFile() {
		return atchFile;
	}
	public void setAtchFile(String atchFile) {
		this.atchFile = atchFile;
	}
	public String getTourCode() {
		return tourCode;
	}
	public void setTourCode(String tourCode) {
		this.tourCode = tourCode;
	}
	public String getMemNm() {
		return memNm;
	}
	public void setMemNm(String memNm) {
		this.memNm = memNm;
	}
	public String getTourNm() {
		return tourNm;
	}
	public void setTourNm(String tourNm) {
		this.tourNm = tourNm;
	}
	@Override
	public String toString() {
		return "ReviewVO [revCode=" + revCode + ", revTitle=" + revTitle + ", revContent=" + revContent + ", revDate="
				+ revDate + ", revLike=" + revLike + ", memId=" + memId + ", atchFile=" + atchFile + ", tourCode="
				+ tourCode + ", memNm=" + memNm + ", tourNm=" + tourNm + "]";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
}

