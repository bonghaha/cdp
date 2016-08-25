package com.to.cdp.plan.model;

public class PlanDeptDetail {
	private String planDeptDetailCode;
	private String planDeptCode;
	private String infoMemberId;
	private String planDeptDetailContent;
	private String planDeptDetailStartDate;
	private String planDeptDetailEndDate;
	private String planDeptDetailCondition;
	public String getPlanDeptDetailCode() {
		return planDeptDetailCode;
	}
	public void setPlanDeptDetailCode(String planDeptDetailCode) {
		this.planDeptDetailCode = planDeptDetailCode;
	}
	public String getPlanDeptCode() {
		return planDeptCode;
	}
	public void setPlanDeptCode(String planDeptCode) {
		this.planDeptCode = planDeptCode;
	}
	public String getInfoMemberId() {
		return infoMemberId;
	}
	public void setInfoMemberId(String infoMemberId) {
		this.infoMemberId = infoMemberId;
	}
	public String getPlanDeptDetailContent() {
		return planDeptDetailContent;
	}
	public void setPlanDeptDetailContent(String planDeptDetailContent) {
		this.planDeptDetailContent = planDeptDetailContent;
	}
	public String getPlanDeptDetailStartDate() {
		return planDeptDetailStartDate;
	}
	public void setPlanDeptDetailStartDate(String planDeptDetailStartDate) {
		this.planDeptDetailStartDate = planDeptDetailStartDate;
	}
	public String getPlanDeptDetailEndDate() {
		return planDeptDetailEndDate;
	}
	public void setPlanDeptDetailEndDate(String planDeptDetailEndDate) {
		this.planDeptDetailEndDate = planDeptDetailEndDate;
	}
	public String getPlanDeptDetailCondition() {
		return planDeptDetailCondition;
	}
	public void setPlanDeptDetailCondition(String planDeptDetailCondition) {
		this.planDeptDetailCondition = planDeptDetailCondition;
	}
	@Override
	public String toString() {
		return "PlanDeptDetail [planDeptDetailCode=" + planDeptDetailCode + ", planDeptCode=" + planDeptCode
				+ ", infoMemberId=" + infoMemberId + ", planDeptDetailContent=" + planDeptDetailContent
				+ ", planDeptDetailStartDate=" + planDeptDetailStartDate + ", planDeptDetailEndDate="
				+ planDeptDetailEndDate + ", planDeptDetailCondition=" + planDeptDetailCondition + "]";
	}
	
}
