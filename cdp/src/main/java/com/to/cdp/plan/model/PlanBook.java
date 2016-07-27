package com.to.cdp.plan.model;

public class PlanBook {
	private String planBookCode;
	private String planUniteCode;
	private String infoMemberCode;
	private String recBookCode;
	private String planBookCondition;
	private String planBookContent;
	private int planBookCount;
	private String planBookRegisterDate;
	private String planBookStartDate;
	private String planBookEndDate;
	public String getPlanBookCode() {
		return planBookCode;
	}
	public void setPlanBookCode(String planBookCode) {
		this.planBookCode = planBookCode;
	}
	public String getPlanUniteCode() {
		return planUniteCode;
	}
	public void setPlanUniteCode(String planUniteCode) {
		this.planUniteCode = planUniteCode;
	}
	public String getInfoMemberCode() {
		return infoMemberCode;
	}
	public void setInfoMemberCode(String infoMemberCode) {
		this.infoMemberCode = infoMemberCode;
	}
	public String getRecBookCode() {
		return recBookCode;
	}
	public void setRecBookCode(String recBookCode) {
		this.recBookCode = recBookCode;
	}
	public String getPlanBookCondition() {
		return planBookCondition;
	}
	public void setPlanBookCondition(String planBookCondition) {
		this.planBookCondition = planBookCondition;
	}
	public String getPlanBookContent() {
		return planBookContent;
	}
	public void setPlanBookContent(String planBookContent) {
		this.planBookContent = planBookContent;
	}
	public int getPlanBookCount() {
		return planBookCount;
	}
	public void setPlanBookCount(int planBookCount) {
		this.planBookCount = planBookCount;
	}
	public String getPlanBookRegisterDate() {
		return planBookRegisterDate;
	}
	public void setPlanBookRegisterDate(String planBookRegisterDate) {
		this.planBookRegisterDate = planBookRegisterDate;
	}
	public String getPlanBookStartDate() {
		return planBookStartDate;
	}
	public void setPlanBookStartDate(String planBookStartDate) {
		this.planBookStartDate = planBookStartDate;
	}
	public String getPlanBookEndDate() {
		return planBookEndDate;
	}
	public void setPlanBookEndDate(String planBookEndDate) {
		this.planBookEndDate = planBookEndDate;
	}
	@Override
	public String toString() {
		return "PlanBook [planBookCode=" + planBookCode + ", planUniteCode=" + planUniteCode + ", infoMemberCode="
				+ infoMemberCode + ", recBookCode=" + recBookCode + ", planBookCondition=" + planBookCondition
				+ ", planBookContent=" + planBookContent + ", planBookCount=" + planBookCount
				+ ", planBookRegisterDate=" + planBookRegisterDate + ", planBookStartDate=" + planBookStartDate
				+ ", planBookEndDate=" + planBookEndDate + "]";
	}
}
