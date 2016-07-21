package com.to.cdp.info.model;

public class InfoJobT {
	private String infoJobTCode;
	private String infoJobTTarget;
	private String infoJobTLocation;
	private String infoJobTInstitute;
	private String infoJobTCourse;
	private String infoJobTStartDate;
	private String infoJobTEndDate;
	public String getInfoJobTCode() {
		return infoJobTCode;
	}
	public void setInfoJobTCode(String infoJobTCode) {
		this.infoJobTCode = infoJobTCode;
	}
	public String getInfoJobTTarget() {
		return infoJobTTarget;
	}
	public void setInfoJobTTarget(String infoJobTTarget) {
		this.infoJobTTarget = infoJobTTarget;
	}
	public String getInfoJobTLocation() {
		return infoJobTLocation;
	}
	public void setInfoJobTLocation(String infoJobTLocation) {
		this.infoJobTLocation = infoJobTLocation;
	}
	public String getInfoJobTInstitute() {
		return infoJobTInstitute;
	}
	public void setInfoJobTInstitute(String infoJobTInstitute) {
		this.infoJobTInstitute = infoJobTInstitute;
	}
	public String getInfoJobTCourse() {
		return infoJobTCourse;
	}
	public void setInfoJobTCourse(String infoJobTCourse) {
		this.infoJobTCourse = infoJobTCourse;
	}
	public String getInfoJobTStartDate() {
		return infoJobTStartDate;
	}
	public void setInfoJobTStartDate(String infoJobTStartDate) {
		this.infoJobTStartDate = infoJobTStartDate;
	}
	public String getInfoJobTEndDate() {
		return infoJobTEndDate;
	}
	public void setInfoJobTEndDate(String infoJobTEndDate) {
		this.infoJobTEndDate = infoJobTEndDate;
	}
	@Override
	public String toString() {
		return "InfoJobT [infoJobTCode=" + infoJobTCode + ", infoJobTTarget=" + infoJobTTarget + ", infoJobTLocation="
				+ infoJobTLocation + ", infoJobTInstitute=" + infoJobTInstitute + ", infoJobTCourse=" + infoJobTCourse
				+ ", infoJobTStartDate=" + infoJobTStartDate + ", infoJobTEndDate=" + infoJobTEndDate + "]";
	}
	
}