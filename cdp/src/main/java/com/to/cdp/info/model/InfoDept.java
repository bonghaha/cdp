package com.to.cdp.info.model;

public class InfoDept {
	private String totalCount;	// 전체 검색 결과수
	private String majorSeq;	// 학과코드
	private String lClass;		// 계열
	private String mClass;		// 학과명
	private String facilName;	// 세부학과명
	
	public String getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(String totalCount) {
		this.totalCount = totalCount;
	}
	public String getMajorSeq() {
		return majorSeq;
	}
	public void setMajorSeq(String majorSeq) {
		this.majorSeq = majorSeq;
	}
	public String getlClass() {
		return lClass;
	}
	public void setlClass(String lClass) {
		this.lClass = lClass;
	}
	public String getmClass() {
		return mClass;
	}
	public void setmClass(String mClass) {
		this.mClass = mClass;
	}
	public String getFacilName() {
		return facilName;
	}
	public void setFacilName(String facilName) {
		this.facilName = facilName;
	}
	@Override
	public String toString() {
		return "InfoDept [totalCount=" + totalCount + ", majorSeq=" + majorSeq + ", lClass=" + lClass + ", mClass="
				+ mClass + ", facilName=" + facilName + "]";
	}
}