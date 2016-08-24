package com.to.cdp.resume.model;

public class ResumeCert {
	private String resumeCertCode;
	private String infoMemberId;
	private String jmCd;			// 자격증코드
	private String jmFldNm;			// 자격증명
	private String acquireDate;		// 취득일
	public String getResumeCertCode() {
		return resumeCertCode;
	}
	public void setResumeCertCode(String resumeCertCode) {
		this.resumeCertCode = resumeCertCode;
	}
	public String getInfoMemberId() {
		return infoMemberId;
	}
	public void setInfoMemberId(String infoMemberId) {
		this.infoMemberId = infoMemberId;
	}
	public String getJmCd() {
		return jmCd;
	}
	public void setJmCd(String jmCd) {
		this.jmCd = jmCd;
	}
	public String getJmFldNm() {
		return jmFldNm;
	}
	public void setJmFldNm(String jmFldNm) {
		this.jmFldNm = jmFldNm;
	}
	public String getAcquireDate() {
		return acquireDate;
	}
	public void setAcquireDate(String acquireDate) {
		this.acquireDate = acquireDate;
	}
	@Override
	public String toString() {
		return "ResumeCert [resumeCertCode=" + resumeCertCode + ", infoMemberId=" + infoMemberId + ", jmCd=" + jmCd
				+ ", jmFldNm=" + jmFldNm + ", acquireDate=" + acquireDate + "]";
	}
}
