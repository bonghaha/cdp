package com.to.cdp.info.model;

public class InfoSchool {
	private String totalCount;		// 전체 검색 결과수
	private String schoolName;		// 학교명
	private String schoolType;		// 학교유형(일반대학, 전문대학, 사이버대학(4년제), 교육대학, 각종대학(대학), 등)
	private String schoolGubun;		// 학교종류(대학(4년제), 전문대학 등)
	private String estType;			// 설립유형(사립,국립)
	private String region;			// 지역
	private String adres;			// 주소
	private String collegeinfourl;	// mycollege 접속 정보(대학교)
	private String link;			// 링크 link:상세페이지 링크, open:새창으로 띄움
	private String seq;				// 학교코드?
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
	@Override
	public String toString() {
		return "InfoSchool [totalCount=" + totalCount + ", schoolName=" + schoolName + ", schoolType=" + schoolType
				+ ", schoolGubun=" + schoolGubun + ", estType=" + estType + ", region=" + region + ", adres=" + adres
				+ ", collegeinfourl=" + collegeinfourl + ", link=" + link + ", seq=" + seq + "]";
	}
}