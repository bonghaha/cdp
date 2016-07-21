package com.to.cdp.info.model;

public class InfoBook {
	private String infoBookCode;
	private String infoBookGenre;
	private String infoBookInstitute;
	private String infoBookWriter;
	private String infoBookName;
	public String getInfoBookCode() {
		return infoBookCode;
	}
	public void setInfoBookCode(String infoBookCode) {
		this.infoBookCode = infoBookCode;
	}
	public String getInfoBookGenre() {
		return infoBookGenre;
	}
	public void setInfoBookGenre(String infoBookGenre) {
		this.infoBookGenre = infoBookGenre;
	}
	public String getInfoBookInstitute() {
		return infoBookInstitute;
	}
	public void setInfoBookInstitute(String infoBookInstitute) {
		this.infoBookInstitute = infoBookInstitute;
	}
	public String getInfoBookWriter() {
		return infoBookWriter;
	}
	public void setInfoBookWriter(String infoBookWriter) {
		this.infoBookWriter = infoBookWriter;
	}
	public String getInfoBookName() {
		return infoBookName;
	}
	public void setInfoBookName(String infoBookName) {
		this.infoBookName = infoBookName;
	}
	@Override
	public String toString() {
		return "InfoBook [infoBookCode=" + infoBookCode + ", infoBookGenre=" + infoBookGenre + ", infoBookInstitute="
				+ infoBookInstitute + ", infoBookWriter=" + infoBookWriter + ", infoBookName=" + infoBookName + "]";
	}
	
}