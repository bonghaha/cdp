package com.to.cdp.act.model;

public class ActMento {
	private String actMentoCode;
	private String actMentoId;
	private String actMentoCheckCondition;
	private String actMentoCheckContent;
	
	public String getActMentoCode() {
		return actMentoCode;
	}
	public void setActMentoCode(String actMentoCode) {
		this.actMentoCode = actMentoCode;
	}
	public String getactMentoId() {
		return actMentoId;
	}
	public void setactMentoId(String actMentoId) {
		this.actMentoId = actMentoId;
	}
	public String getActMentoCheckCondition() {
		return actMentoCheckCondition;
	}
	public void setActMentoCheckCondition(String actMentoCheckCondition) {
		this.actMentoCheckCondition = actMentoCheckCondition;
	}
	public String getActMentoCheckContent() {
		return actMentoCheckContent;
	}
	public void setActMentoCheckContent(String actMentoCheckContent) {
		this.actMentoCheckContent = actMentoCheckContent;
	}
	
	@Override
	public String toString() {
		return "ActMento [actMentoCode=" + actMentoCode + ", actMentoId=" + actMentoId + ", actMentoCheckCondition="
				+ actMentoCheckCondition + ", actMentoCheckContent=" + actMentoCheckContent + "]";
	}
}