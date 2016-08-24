package com.to.cdp.plan.model;

public class PlanSchool {
	private String planSchoolCode;			// 계획학교코드
	private String planUniteCode;			// 계획통합코드
	private String infoMemberId;			// 회원아이디(로그인아이디)
	private String recSchoolCode;			// 추천학교코드
	private String schoolName;				// 학교명
	private String planSchoolCondition;		// 계획학교상태
	private String planSchoolContent;		// 계획학교내용
	private int planSchoolCount;			// 계획학교차수
	private String planSchoolRegisterDate;	// 계획학교등록일
	private String planSchoolStartDate;		// 계획학교시작일
	private String planSchoolEndDate;		// 계획학교종료일
	public String getPlanSchoolCode() {
		return planSchoolCode;
	}
	public void setPlanSchoolCode(String planSchoolCode) {
		this.planSchoolCode = planSchoolCode;
	}
	public String getPlanUniteCode() {
		return planUniteCode;
	}
	public void setPlanUniteCode(String planUniteCode) {
		this.planUniteCode = planUniteCode;
	}
	public String getInfoMemberId() {
		return infoMemberId;
	}
	public void setInfoMemberId(String infoMemberId) {
		this.infoMemberId = infoMemberId;
	}
	public String getRecSchoolCode() {
		return recSchoolCode;
	}
	public void setRecSchoolCode(String recSchoolCode) {
		this.recSchoolCode = recSchoolCode;
	}
	public String getPlanSchoolCondition() {
		return planSchoolCondition;
	}
	public void setPlanSchoolCondition(String planSchoolCondition) {
		this.planSchoolCondition = planSchoolCondition;
	}
	public String getPlanSchoolContent() {
		return planSchoolContent;
	}
	public void setPlanSchoolContent(String planSchoolContent) {
		this.planSchoolContent = planSchoolContent;
	}
	public int getPlanSchoolCount() {
		return planSchoolCount;
	}
	public void setPlanSchoolCount(int planSchoolCount) {
		this.planSchoolCount = planSchoolCount;
	}
	public String getPlanSchoolRegisterDate() {
		return planSchoolRegisterDate;
	}
	public void setPlanSchoolRegisterDate(String planSchoolRegisterDate) {
		this.planSchoolRegisterDate = planSchoolRegisterDate;
	}
	public String getPlanSchoolStartDate() {
		return planSchoolStartDate;
	}
	public void setPlanSchoolStartDate(String planSchoolStartDate) {
		this.planSchoolStartDate = planSchoolStartDate;
	}
	public String getPlanSchoolEndDate() {
		return planSchoolEndDate;
	}
	public void setPlanSchoolEndDate(String planSchoolEndDate) {
		this.planSchoolEndDate = planSchoolEndDate;
	}
	public String getSchoolName() {
		return schoolName;
	}
	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}
	@Override
	public String toString() {
		return "PlanSchool [planSchoolCode=" + planSchoolCode + ", planUniteCode=" + planUniteCode + ", infoMemberId="
				+ infoMemberId + ", recSchoolCode=" + recSchoolCode + ", schoolName=" + schoolName
				+ ", planSchoolCondition=" + planSchoolCondition + ", planSchoolContent=" + planSchoolContent
				+ ", planSchoolCount=" + planSchoolCount + ", planSchoolRegisterDate=" + planSchoolRegisterDate
				+ ", planSchoolStartDate=" + planSchoolStartDate + ", planSchoolEndDate=" + planSchoolEndDate + "]";
	}
}
