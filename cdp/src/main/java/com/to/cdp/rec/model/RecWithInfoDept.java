package com.to.cdp.rec.model;

public class RecWithInfoDept {
	private String totalCount;			// 전체 검색 결과수
	private String majorSeq;			// 학과코드
	private String lClass;				// 계열
	private String mClass;				// 학과
	private String facilName;			// 세부학과명
	private String recDeptCode; 		// 추천학과코드
	private String jobdicSeq;			// 직업코드
	private String recDeptReason;		// 추천학과이유
	private String recDeptContent;		// 추천학과내용
	private String recDeptCondition;	// 추천학과상태
	private String recDeptRegisterDate;	// 추천학과등록일
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
	public String getRecDeptCode() {
		return recDeptCode;
	}
	public void setRecDeptCode(String recDeptCode) {
		this.recDeptCode = recDeptCode;
	}
	public String getJobdicSeq() {
		return jobdicSeq;
	}
	public void setJobdicSeq(String jobdicSeq) {
		this.jobdicSeq = jobdicSeq;
	}
	public String getRecDeptReason() {
		return recDeptReason;
	}
	public void setRecDeptReason(String recDeptReason) {
		this.recDeptReason = recDeptReason;
	}
	public String getRecDeptContent() {
		return recDeptContent;
	}
	public void setRecDeptContent(String recDeptContent) {
		this.recDeptContent = recDeptContent;
	}
	public String getRecDeptCondition() {
		return recDeptCondition;
	}
	public void setRecDeptCondition(String recDeptCondition) {
		this.recDeptCondition = recDeptCondition;
	}
	public String getRecDeptRegisterDate() {
		return recDeptRegisterDate;
	}
	public void setRecDeptRegisterDate(String recDeptRegisterDate) {
		this.recDeptRegisterDate = recDeptRegisterDate;
	}
	@Override
	public String toString() {
		return "RecWithInfoDept [totalCount=" + totalCount + ", majorSeq=" + majorSeq + ", lClass=" + lClass
				+ ", mClass=" + mClass + ", facilName=" + facilName + ", recDeptCode=" + recDeptCode + ", jobdicSeq="
				+ jobdicSeq + ", recDeptReason=" + recDeptReason + ", recDeptContent=" + recDeptContent
				+ ", recDeptCondition=" + recDeptCondition + ", recDeptRegisterDate=" + recDeptRegisterDate + "]";
	}	
}
