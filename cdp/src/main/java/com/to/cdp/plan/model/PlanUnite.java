package com.to.cdp.plan.model;

public class PlanUnite {
	private String planUniteCode;
	private String infoMemberId;
	private String jobdicSeq;
	private String job;
	private String planUniteTitle;
	private String planUniteContent;
	private String planUniteRegisterDate;
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
	public String getJobdicSeq() {
		return jobdicSeq;
	}
	public void setJobdicSeq(String jobdicSeq) {
		this.jobdicSeq = jobdicSeq;
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
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	@Override
	public String toString() {
		return "PlanUnite [planUniteCode=" + planUniteCode + ", infoMemberId=" + infoMemberId + ", jobdicSeq="
				+ jobdicSeq + ", job=" + job + ", planUniteTitle=" + planUniteTitle + ", planUniteContent="
				+ planUniteContent + ", planUniteRegisterDate=" + planUniteRegisterDate + "]";
	}
}