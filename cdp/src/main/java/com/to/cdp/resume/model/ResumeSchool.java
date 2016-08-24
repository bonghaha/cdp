package com.to.cdp.resume.model;

public class ResumeSchool {
	private String resumeSchoolCode;
	private String infoMemberId;
	private String gubun;		// 초,중,고,대 구분
	private String seq;			// 학교코드
	private String schoolName;	// 학교명
	private String resumeSchoolCondition;	// 신분상태
	private String startDate;	// 입학일
	private String endDate;		// 졸업(예정)일
	private String svcCode;		// SCHOOL api url에 필요한 파라미터
	private String resumeSchoolRegisterDate;
	public String getResumeSchoolCode() {
		return resumeSchoolCode;
	}
	public void setResumeSchoolCode(String resumeSchoolCode) {
		this.resumeSchoolCode = resumeSchoolCode;
	}
	public String getInfoMemberId() {
		return infoMemberId;
	}
	public void setInfoMemberId(String infoMemberId) {
		this.infoMemberId = infoMemberId;
	}
	public String getGubun() {
		return gubun;
	}
	public void setGubun(String gubun) {
		this.gubun = gubun;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getSchoolName() {
		return schoolName;
	}
	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}
	public String getResumeSchoolCondition() {
		return resumeSchoolCondition;
	}
	public void setResumeSchoolCondition(String resumeSchoolCondition) {
		this.resumeSchoolCondition = resumeSchoolCondition;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getSvcCode() {
		return svcCode;
	}
	public void setSvcCode(String svcCode) {
		this.svcCode = svcCode;
	}
	public String getResumeSchoolRegisterDate() {
		return resumeSchoolRegisterDate;
	}
	public void setResumeSchoolRegisterDate(String resumeSchoolRegisterDate) {
		this.resumeSchoolRegisterDate = resumeSchoolRegisterDate;
	}
	@Override
	public String toString() {
		return "ResumeSchool [resumeSchoolCode=" + resumeSchoolCode + ", infoMemberId=" + infoMemberId + ", gubun="
				+ gubun + ", seq=" + seq + ", schoolName=" + schoolName + ", resumeSchoolCondition="
				+ resumeSchoolCondition + ", startDate=" + startDate + ", endDate=" + endDate + ", svcCode=" + svcCode
				+ ", resumeSchoolRegisterDate=" + resumeSchoolRegisterDate + "]";
	}
	
}
