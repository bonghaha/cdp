package com.to.cdp.plan.model;

public class PlanCertDetail {
	private String planCertDetailCode;
	private String planCertCode;
	private String infoMemberId;
	private String planCertDetailContent;
	private String planCertDetailStartDate;
	private String planCertDetailEndDate;
	private String planCertDetailCondition;
	public String getPlanCertDetailCode() {
		return planCertDetailCode;
	}
	public void setPlanCertDetailCode(String planCertDetailCode) {
		this.planCertDetailCode = planCertDetailCode;
	}
	public String getPlanCertCode() {
		return planCertCode;
	}
	public void setPlanCertCode(String planCertCode) {
		this.planCertCode = planCertCode;
	}
	public String getInfoMemberId() {
		return infoMemberId;
	}
	public void setInfoMemberId(String infoMemberId) {
		this.infoMemberId = infoMemberId;
	}
	public String getPlanCertDetailContent() {
		return planCertDetailContent;
	}
	public void setPlanCertDetailContent(String planCertDetailContent) {
		this.planCertDetailContent = planCertDetailContent;
	}
	public String getPlanCertDetailStartDate() {
		return planCertDetailStartDate;
	}
	public void setPlanCertDetailStartDate(String planCertDetailStartDate) {
		this.planCertDetailStartDate = planCertDetailStartDate;
	}
	public String getPlanCertDetailEndDate() {
		return planCertDetailEndDate;
	}
	public void setPlanCertDetailEndDate(String planCertDetailEndDate) {
		this.planCertDetailEndDate = planCertDetailEndDate;
	}
	public String getPlanCertDetailCondition() {
		return planCertDetailCondition;
	}
	public void setPlanCertDetailCondition(String planCertDetailCondition) {
		this.planCertDetailCondition = planCertDetailCondition;
	}
	@Override
	public String toString() {
		return "PlanCertDetail [planCertDetailCode=" + planCertDetailCode + ", planCertCode=" + planCertCode
				+ ", infoMemberId=" + infoMemberId + ", planCertDetailContent=" + planCertDetailContent
				+ ", planCertDetailStartDate=" + planCertDetailStartDate + ", planCertDetailEndDate="
				+ planCertDetailEndDate + ", planCertDetailCondition=" + planCertDetailCondition + "]";
	}
}
