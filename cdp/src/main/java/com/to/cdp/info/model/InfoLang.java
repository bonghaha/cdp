package com.to.cdp.info.model;

public class InfoLang {
	private String infoLangCode;
	private String infoLangName;
	private String infoLangTestName;
	public String getInfoLangCode() {
		return infoLangCode;
	}
	public void setInfoLangCode(String infoLangCode) {
		this.infoLangCode = infoLangCode;
	}
	public String getInfoLangName() {
		return infoLangName;
	}
	public void setInfoLangName(String infoLangName) {
		this.infoLangName = infoLangName;
	}
	public String getInfoLangTestName() {
		return infoLangTestName;
	}
	public void setInfoLangTestName(String infoLangTestName) {
		this.infoLangTestName = infoLangTestName;
	}
	@Override
	public String toString() {
		return "InfoLang [infoLangCode=" + infoLangCode + ", infoLangName=" + infoLangName + ", infoLangTestName="
				+ infoLangTestName + "]";
	}
	
}