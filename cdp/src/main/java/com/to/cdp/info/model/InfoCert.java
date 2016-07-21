package com.to.cdp.info.model;

public class InfoCert {
	private String infoCertCode;
	private String infoCertType;
	private String infoCertInstitute;
	private String infoCertName;
	public String getInfoCertCode() {
		return infoCertCode;
	}
	public void setInfoCertCode(String infoCertCode) {
		this.infoCertCode = infoCertCode;
	}
	public String getInfoCertType() {
		return infoCertType;
	}
	public void setInfoCertType(String infoCertType) {
		this.infoCertType = infoCertType;
	}
	public String getInfoCertInstitute() {
		return infoCertInstitute;
	}
	public void setInfoCertInstitute(String infoCertInstitute) {
		this.infoCertInstitute = infoCertInstitute;
	}
	public String getInfoCertName() {
		return infoCertName;
	}
	public void setInfoCertName(String infoCertName) {
		this.infoCertName = infoCertName;
	}
	@Override
	public String toString() {
		return "InfoCert [infoCertCode=" + infoCertCode + ", infoCertType=" + infoCertType + ", infoCertInstitute="
				+ infoCertInstitute + ", infoCertName=" + infoCertName + "]";
	}
	
}