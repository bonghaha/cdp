package com.to.cdp.plan.model;

public class PlanUnite {
	private String planUniteCode;
	private String infoMemberId;
	private String planUniteTitle;
	private String planUniteContent;
	private String planUniteRegisterDate;
	private String infoJobCode;
	private String planMentoid;
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
	public String getPlanUniteTitle() {
		return planUniteTitle;
	}
	public void setPlanUniteTitle(String planUniteTitle) {
		this.planUniteTitle = planUniteTitle;
	}
	public String getPlanUniteContent() {
		return planUniteContent;
	}
	public void setPlanUniteContent(String planUniteContent) {
		this.planUniteContent = planUniteContent;
	}
	public String getPlanUniteRegisterDate() {
		return planUniteRegisterDate;
	}
	public void setPlanUniteRegisterDate(String planUniteRegisterDate) {
		this.planUniteRegisterDate = planUniteRegisterDate;
	}
	public String getInfoJobCode() {
		return infoJobCode;
	}
	public void setInfoJobCode(String infoJobCode) {
		this.infoJobCode = infoJobCode;
	}
	public String getPlanMentoid() {
		return planMentoid;
	}
	public void setPlanMentoid(String planMentoid) {
		this.planMentoid = planMentoid;
	}
	@Override
	public String toString() {
		return "PlanUnite [planUniteCode=" + planUniteCode + ", infoMemberId=" + infoMemberId + ", planUniteTitle="
				+ planUniteTitle + ", planUniteContent=" + planUniteContent + ", planUniteRegisterDate="
				+ planUniteRegisterDate + ", infoJobCode=" + infoJobCode + ", planMentoid=" + planMentoid + "]";
	}
}