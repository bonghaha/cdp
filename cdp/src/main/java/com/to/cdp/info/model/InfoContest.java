package com.to.cdp.info.model;

public class InfoContest {
	private String infoContestCode;
	private String infoContestInstitute;
	private String infoContestPrize;
	private String infoContestContent;
	private String infoContestName;
	public String getInfoContestCode() {
		return infoContestCode;
	}
	public void setInfoContestCode(String infoContestCode) {
		this.infoContestCode = infoContestCode;
	}
	public String getInfoContestInstitute() {
		return infoContestInstitute;
	}
	public void setInfoContestInstitute(String infoContestInstitute) {
		this.infoContestInstitute = infoContestInstitute;
	}
	public String getInfoContestPrize() {
		return infoContestPrize;
	}
	public void setInfoContestPrize(String infoContestPrize) {
		this.infoContestPrize = infoContestPrize;
	}
	public String getInfoContestContent() {
		return infoContestContent;
	}
	public void setInfoContestContent(String infoContestContent) {
		this.infoContestContent = infoContestContent;
	}
	public String getInfoContestName() {
		return infoContestName;
	}
	public void setInfoContestName(String infoContestName) {
		this.infoContestName = infoContestName;
	}
	@Override
	public String toString() {
		return "InfoContest [infoContestCode=" + infoContestCode + ", infoContestInstitute=" + infoContestInstitute
				+ ", infoContestPrize=" + infoContestPrize + ", infoContestContent=" + infoContestContent
				+ ", infoContestName=" + infoContestName + "]";
	}
	
	
}