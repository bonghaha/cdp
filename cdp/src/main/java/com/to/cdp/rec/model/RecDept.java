package com.to.cdp.rec.model;

public class RecDept {
	private String recDeptCode; 		// 추천학과코드
	private String jobdicSeq;			// 직업코드
	private String job;
	private String majorSeq;			// 학과코드
	private String mClass;				// 학과명
	private String recDeptReason;		// 추천학과이유
	private String recDeptContent;		// 추천학과내용
	private String recDeptCondition;	// 추천학과상태
	private String recDeptRegisterDate;	// 추천학과등록일
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
	public String getMajorSeq() {
		return majorSeq;
	}
	public void setMajorSeq(String majorSeq) {
		this.majorSeq = majorSeq;
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
	public String getmClass() {
		return mClass;
	}
	public void setmClass(String mClass) {
		this.mClass = mClass;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	@Override
	public String toString() {
		return "RecDept [recDeptCode=" + recDeptCode + ", jobdicSeq=" + jobdicSeq + ", job=" + job + ", majorSeq="
				+ majorSeq + ", mClass=" + mClass + ", recDeptReason=" + recDeptReason + ", recDeptContent="
				+ recDeptContent + ", recDeptCondition=" + recDeptCondition + ", recDeptRegisterDate="
				+ recDeptRegisterDate + "]";
	}
}
