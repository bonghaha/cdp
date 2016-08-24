package com.to.cdp.plan.model;

public class PlanCert {
	private String planCertCode;
	private String planUniteCode;
	private String planCertCondition;
	private String planCertContent;
	private int planCertCount;
	private String planCertRegisterDate;
	private String planCertStartDate;
	private String planCertEndDate;
	private String recCertCode;
	private String jmFldNm;
	private String infoMemberId;
	public String getPlanCertCode() {
		return planCertCode;
	}
	public void setPlanCertCode(String planCertCode) {
		this.planCertCode = planCertCode;
	}
	public String getPlanUniteCode() {
		return planUniteCode;
	}
	public void setPlanUniteCode(String planUniteCode) {
		this.planUniteCode = planUniteCode;
	}
	public String getPlanCertCondition() {
		return planCertCondition;
	}
	public void setPlanCertCondition(String planCertCondition) {
		this.planCertCondition = planCertCondition;
	}
	public String getPlanCertContent() {
		return planCertContent;
	}
	public void setPlanCertContent(String planCertContent) {
		this.planCertContent = planCertContent;
	}
	public int getPlanCertCount() {
		return planCertCount;
	}
	public void setPlanCertCount(int planCertCount) {
		this.planCertCount = planCertCount;
	}
	public String getPlanCertRegisterDate() {
		return planCertRegisterDate;
	}
	public void setPlanCertRegisterDate(String planCertRegisterDate) {
		this.planCertRegisterDate = planCertRegisterDate;
	}
	public String getPlanCertStartDate() {
		return planCertStartDate;
	}
	public void setPlanCertStartDate(String planCertStartDate) {
		this.planCertStartDate = planCertStartDate;
	}
	public String getPlanCertEndDate() {
		return planCertEndDate;
	}
	public void setPlanCertEndDate(String planCertEndDate) {
		this.planCertEndDate = planCertEndDate;
	}
	public String getRecCertCode() {
		return recCertCode;
	}
	public void setRecCertCode(String recCertCode) {
		this.recCertCode = recCertCode;
	}
	public String getInfoMemberId() {
		return infoMemberId;
	}
	public void setInfoMemberId(String infoMemberId) {
		this.infoMemberId = infoMemberId;
	}
	public String getJmFldNm() {
		return jmFldNm;
	}
	public void setJmFldNm(String jmFldNm) {
		this.jmFldNm = jmFldNm;
	}
	@Override
	public String toString() {
		return "PlanCert [planCertCode=" + planCertCode + ", planUniteCode=" + planUniteCode + ", planCertCondition="
				+ planCertCondition + ", planCertContent=" + planCertContent + ", planCertCount=" + planCertCount
				+ ", planCertRegisterDate=" + planCertRegisterDate + ", planCertStartDate=" + planCertStartDate
				+ ", planCertEndDate=" + planCertEndDate + ", recCertCode=" + recCertCode + ", jmFldNm=" + jmFldNm
				+ ", infoMemberId=" + infoMemberId + "]";
	}
}