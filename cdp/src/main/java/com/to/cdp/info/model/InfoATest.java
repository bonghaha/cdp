package com.to.cdp.info.model;

public class InfoATest {
	private String infoATestCode;
	private String myPageCode;
	private String infoMemberCode;
	private String infoJobCode;
	
	public String getInfoATestCode() {
		return infoATestCode;
	}
	public void setInfoATestCode(String infoATestCode) {
		this.infoATestCode = infoATestCode;
	}
	public String getMyPageCode() {
		return myPageCode;
	}
	public void setMyPageCode(String myPageCode) {
		this.myPageCode = myPageCode;
	}
	public String getInfoMemberCode() {
		return infoMemberCode;
	}
	public void setInfoMemberCode(String infoMemberCode) {
		this.infoMemberCode = infoMemberCode;
	}
	public String getInfoJobCode() {
		return infoJobCode;
	}
	public void setInfoJobCode(String infoJobCode) {
		this.infoJobCode = infoJobCode;
	}
	
	@Override
	public String toString() {
		return "InfoATest [infoATestCode=" + infoATestCode + ", myPageCode=" + myPageCode + ", infoMemberCode="
				+ infoMemberCode + ", infoJobCode=" + infoJobCode + "]";
	}
}