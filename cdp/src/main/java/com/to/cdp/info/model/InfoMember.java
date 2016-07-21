package com.to.cdp.info.model;

public class InfoMember {
	private String infoMemberCode;
	private String infoMemberId;
	private String infoMemberPw;
	private String infoMemberName;
	private int infoMemberPhone;
	private String infoMemberEmail;
	private int infoMemberBirth;
	private int infoMemberLevel;
	private String infoMemberJoinDate;
	
	public String getInfoMemberCode() {
		return infoMemberCode;
	}
	public void setInfoMemberCode(String infoMemberCode) {
		this.infoMemberCode = infoMemberCode;
	}
	public String getInfoMemberId() {
		return infoMemberId;
	}
	public void setInfoMemberId(String infoMemberId) {
		this.infoMemberId = infoMemberId;
	}
	public String getInfoMemberPw() {
		return infoMemberPw;
	}
	public void setInfoMemberPw(String infoMemberPw) {
		this.infoMemberPw = infoMemberPw;
	}
	public String getInfoMemberName() {
		return infoMemberName;
	}
	public void setInfoMemberName(String infoMemberName) {
		this.infoMemberName = infoMemberName;
	}
	public int getInfoMemberPhone() {
		return infoMemberPhone;
	}
	public void setInfoMemberPhone(int infoMemberPhone) {
		this.infoMemberPhone = infoMemberPhone;
	}
	public String getInfoMemberEmail() {
		return infoMemberEmail;
	}
	public void setInfoMemberEmail(String infoMemberEmail) {
		this.infoMemberEmail = infoMemberEmail;
	}
	public int getInfoMemberBirth() {
		return infoMemberBirth;
	}
	public void setInfoMemberBirth(int infoMemberBirth) {
		this.infoMemberBirth = infoMemberBirth;
	}
	public int getInfoMemberLevel() {
		return infoMemberLevel;
	}
	public void setInfoMemberLevel(int infoMemberLevel) {
		this.infoMemberLevel = infoMemberLevel;
	}
	public String getInfoMemberJoinDate() {
		return infoMemberJoinDate;
	}
	public void setInfoMemberJoinDate(String infoMemberJoinDate) {
		this.infoMemberJoinDate = infoMemberJoinDate;
	}
	
	@Override
	public String toString() {
		return "InfoMember [infoMemberCode=" + infoMemberCode + ", infoMemberId=" + infoMemberId + ", infoMemberPw="
				+ infoMemberPw + ", infoMemberName=" + infoMemberName + ", infoMemberPhone=" + infoMemberPhone
				+ ", infoMemberEmail=" + infoMemberEmail + ", infoMemberBirth=" + infoMemberBirth + ", infoMemberLevel="
				+ infoMemberLevel + ", infoMemberJoinDate=" + infoMemberJoinDate + "]";
	}
}