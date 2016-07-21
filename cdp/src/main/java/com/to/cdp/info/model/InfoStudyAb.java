package com.to.cdp.info.model;

public class InfoStudyAb {
	private String infoStudyAbCode;
	private String infoStudyAbLocation;
	private String infoStudyAbInstitute;
	private String infoStudyAbLang;
	public String getInfoStudyAbCode() {
		return infoStudyAbCode;
	}
	public void setInfoStudyAbCode(String infoStudyAbCode) {
		this.infoStudyAbCode = infoStudyAbCode;
	}
	public String getInfoStudyAbLocation() {
		return infoStudyAbLocation;
	}
	public void setInfoStudyAbLocation(String infoStudyAbLocation) {
		this.infoStudyAbLocation = infoStudyAbLocation;
	}
	public String getInfoStudyAbInstitute() {
		return infoStudyAbInstitute;
	}
	public void setInfoStudyAbInstitute(String infoStudyAbInstitute) {
		this.infoStudyAbInstitute = infoStudyAbInstitute;
	}
	public String getInfoStudyAbLang() {
		return infoStudyAbLang;
	}
	public void setInfoStudyAbLang(String infoStudyAbLang) {
		this.infoStudyAbLang = infoStudyAbLang;
	}
	@Override
	public String toString() {
		return "InfoStudyAb [infoStudyAbCode=" + infoStudyAbCode + ", infoStudyAbLocation=" + infoStudyAbLocation
				+ ", infoStudyAbInstitute=" + infoStudyAbInstitute + ", infoStudyAbLang=" + infoStudyAbLang + "]";
	}
	
}