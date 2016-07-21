package com.to.cdp.info.model;

public class InfoSchool {
	private String infoSchoolCode;
	private String infoSchoolBigCode;
	private String infoSchoolBigName;
	private String infoSchoolMiddleCode;
	private String infoSchoolMiddleName;
	private String infoSchoolName;
	
	public String getInfoSchoolCode() {
		return infoSchoolCode;
	}
	public void setInfoSchoolCode(String infoSchoolCode) {
		this.infoSchoolCode = infoSchoolCode;
	}
	public String getInfoSchoolBigCode() {
		return infoSchoolBigCode;
	}
	public void setInfoSchoolBigCode(String infoSchoolBigCode) {
		this.infoSchoolBigCode = infoSchoolBigCode;
	}
	public String getInfoSchoolBigName() {
		return infoSchoolBigName;
	}
	public void setInfoSchoolBigName(String infoSchoolBigName) {
		this.infoSchoolBigName = infoSchoolBigName;
	}
	public String getInfoSchoolMiddleCode() {
		return infoSchoolMiddleCode;
	}
	public void setInfoSchoolMiddleCode(String infoSchoolMiddleCode) {
		this.infoSchoolMiddleCode = infoSchoolMiddleCode;
	}
	public String getInfoSchoolMiddleName() {
		return infoSchoolMiddleName;
	}
	public void setInfoSchoolMiddleName(String infoSchoolMiddleName) {
		this.infoSchoolMiddleName = infoSchoolMiddleName;
	}
	public String getInfoSchoolName() {
		return infoSchoolName;
	}
	public void setInfoSchoolName(String infoSchoolName) {
		this.infoSchoolName = infoSchoolName;
	}
	
	@Override
	public String toString() {
		return "InfoSchool [infoSchoolCode=" + infoSchoolCode + ", infoSchoolBigCode=" + infoSchoolBigCode
				+ ", infoSchoolBigName=" + infoSchoolBigName + ", infoSchoolMiddleCode=" + infoSchoolMiddleCode
				+ ", infoSchoolMiddleName=" + infoSchoolMiddleName + ", infoSchoolName=" + infoSchoolName + "]";
	}
	
}