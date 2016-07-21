package com.to.cdp.info.model;

public class InfoVolun {
	private String infoVolunCode;
	private String infoVolunContinent;
	private String infoVolunCountry;
	private String infoVolunTitle;
	private String infoVolunName;
	public String getInfoVolunCode() {
		return infoVolunCode;
	}
	public void setInfoVolunCode(String infoVolunCode) {
		this.infoVolunCode = infoVolunCode;
	}
	public String getInfoVolunContinent() {
		return infoVolunContinent;
	}
	public void setInfoVolunContinent(String infoVolunContinent) {
		this.infoVolunContinent = infoVolunContinent;
	}
	public String getInfoVolunCountry() {
		return infoVolunCountry;
	}
	public void setInfoVolunCountry(String infoVolunCountry) {
		this.infoVolunCountry = infoVolunCountry;
	}
	public String getInfoVolunTitle() {
		return infoVolunTitle;
	}
	public void setInfoVolunTitle(String infoVolunTitle) {
		this.infoVolunTitle = infoVolunTitle;
	}
	public String getInfoVolunName() {
		return infoVolunName;
	}
	public void setInfoVolunName(String infoVolunName) {
		this.infoVolunName = infoVolunName;
	}
	@Override
	public String toString() {
		return "InfoVolun [infoVolunCode=" + infoVolunCode + ", infoVolunContinent=" + infoVolunContinent
				+ ", infoVolunCountry=" + infoVolunCountry + ", infoVolunTitle=" + infoVolunTitle + ", infoVolunName="
				+ infoVolunName + "]";
	}
	
}