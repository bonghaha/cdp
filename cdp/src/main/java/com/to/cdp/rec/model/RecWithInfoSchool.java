package com.to.cdp.rec.model;

public class RecWithInfoSchool {
	private String totalCount;		// 전체 검색 결과수
	private String schoolName;		// 학교명
	private String schoolType;		// 학교유형
	private String schoolGubun;		// 학교종류
	private String estType;			// 설립유형
	private String region;			// 지역
	private String adres;			// 주소
	private String collegeinfourl;	// mycollege 접속 정보(대학교)
	private String link;			// 링크 link:상세페이지 링크, open:새창으로 띄움
	private String seq;				// 학교코드?
	private String recSchoolCode; 			//
	//private String recUniteCode;			//
	private String recSchoolReason;			//
	private String recSchoolContent;		//
	private String recSchoolCondition;		//
	private String recSchoolRegisterDate;	//
	private String jobdicSeq;				//
	public String getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(String totalCount) {
		this.totalCount = totalCount;
	}
	public String getSchoolName() {
		return schoolName;
	}
	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}
	public String getSchoolType() {
		return schoolType;
	}
	public void setSchoolType(String schoolType) {
		this.schoolType = schoolType;
	}
	public String getSchoolGubun() {
		return schoolGubun;
	}
	public void setSchoolGubun(String schoolGubun) {
		this.schoolGubun = schoolGubun;
	}
	public String getEstType() {
		return estType;
	}
	public void setEstType(String estType) {
		this.estType = estType;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getAdres() {
		return adres;
	}
	public void setAdres(String adres) {
		this.adres = adres;
	}
	public String getCollegeinfourl() {
		return collegeinfourl;
	}
	public void setCollegeinfourl(String collegeinfourl) {
		this.collegeinfourl = collegeinfourl;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getRecSchoolCode() {
		return recSchoolCode;
	}
	public void setRecSchoolCode(String recSchoolCode) {
		this.recSchoolCode = recSchoolCode;
	}
	public String getRecSchoolReason() {
		return recSchoolReason;
	}
	public void setRecSchoolReason(String recSchoolReason) {
		this.recSchoolReason = recSchoolReason;
	}
	public String getRecSchoolContent() {
		return recSchoolContent;
	}
	public void setRecSchoolContent(String recSchoolContent) {
		this.recSchoolContent = recSchoolContent;
	}
	public String getRecSchoolCondition() {
		return recSchoolCondition;
	}
	public void setRecSchoolCondition(String recSchoolCondition) {
		this.recSchoolCondition = recSchoolCondition;
	}
	public String getRecSchoolRegisterDate() {
		return recSchoolRegisterDate;
	}
	public void setRecSchoolRegisterDate(String recSchoolRegisterDate) {
		this.recSchoolRegisterDate = recSchoolRegisterDate;
	}
	public String getJobdicSeq() {
		return jobdicSeq;
	}
	public void setJobdicSeq(String jobdicSeq) {
		this.jobdicSeq = jobdicSeq;
	}
	@Override
	public String toString() {
		return "RecWithInfoSchool [totalCount=" + totalCount + ", schoolName=" + schoolName + ", schoolType="
				+ schoolType + ", schoolGubun=" + schoolGubun + ", estType=" + estType + ", region=" + region
				+ ", adres=" + adres + ", collegeinfourl=" + collegeinfourl + ", link=" + link + ", seq=" + seq
				+ ", recSchoolCode=" + recSchoolCode + ", recSchoolReason=" + recSchoolReason + ", recSchoolContent="
				+ recSchoolContent + ", recSchoolCondition=" + recSchoolCondition + ", recSchoolRegisterDate="
				+ recSchoolRegisterDate + ", jobdicSeq=" + jobdicSeq + "]";
	}
}
