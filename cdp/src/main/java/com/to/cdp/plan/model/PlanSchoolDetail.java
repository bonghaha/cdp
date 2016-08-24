package com.to.cdp.plan.model;

public class PlanSchoolDetail {
	private String planSchoolDetailCode;
	private String planSchoolCode;
	private String infoMemberId;
	private String planSchoolDetailNo;
	private String planSchoolDetailContent;
	private String planSchoolDetailStartDate;
	private String planSchoolDetailEndDate;
	public String getPlanSchoolDetailCode() {
		return planSchoolDetailCode;
	}
	public void setPlanSchoolDetailCode(String planSchoolDetailCode) {
		this.planSchoolDetailCode = planSchoolDetailCode;
	}
	public String getPlanSchoolDetailNo() {
		return planSchoolDetailNo;
	}
	public void setPlanSchoolDetailNo(String planSchoolDetailNo) {
		this.planSchoolDetailNo = planSchoolDetailNo;
	}
	public String getPlanSchoolDetailContent() {
		return planSchoolDetailContent;
	}
	public void setPlanSchoolDetailContent(String planSchoolDetailContent) {
		this.planSchoolDetailContent = planSchoolDetailContent;
	}
	public String getPlanSchoolDetailStartDate() {
		return planSchoolDetailStartDate;
	}
	public void setPlanSchoolDetailStartDate(String planSchoolDetailStartDate) {
		this.planSchoolDetailStartDate = planSchoolDetailStartDate;
	}
	public String getPlanSchoolDetailEndDate() {
		return planSchoolDetailEndDate;
	}
	public void setPlanSchoolDetailEndDate(String planSchoolDetailEndDate) {
		this.planSchoolDetailEndDate = planSchoolDetailEndDate;
	}
	public String getPlanSchoolCode() {
		return planSchoolCode;
	}
	public void setPlanSchoolCode(String planSchoolCode) {
		this.planSchoolCode = planSchoolCode;
	}
	public String getInfoMemberId() {
		return infoMemberId;
	}
	public void setInfoMemberId(String infoMemberId) {
		this.infoMemberId = infoMemberId;
	}
	@Override
	public String toString() {
		return "PlanSchoolDetail [planSchoolDetailCode=" + planSchoolDetailCode + ", planSchoolCode=" + planSchoolCode
				+ ", infoMemberId=" + infoMemberId + ", planSchoolDetailNo=" + planSchoolDetailNo
				+ ", planSchoolDetailContent=" + planSchoolDetailContent + ", planSchoolDetailStartDate="
				+ planSchoolDetailStartDate + ", planSchoolDetailEndDate=" + planSchoolDetailEndDate + "]";
	}
}
