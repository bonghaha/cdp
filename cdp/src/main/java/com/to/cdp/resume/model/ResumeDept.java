package com.to.cdp.resume.model;

public class ResumeDept {
	private String resumeDeptCode;
	private String infoMemberId;
	private String majorSeq;		// 학과코드
	private String mClass;			// 학과명
	private String svcCode;			// MAJOR api url 파라미터
	public String getResumeDeptCode() {
		return resumeDeptCode;
	}
	public void setResumeDeptCode(String resumeDeptCode) {
		this.resumeDeptCode = resumeDeptCode;
	}
	public String getInfoMemberId() {
		return infoMemberId;
	}
	public void setInfoMemberId(String infoMemberId) {
		this.infoMemberId = infoMemberId;
	}
	public String getMajorSeq() {
		return majorSeq;
	}
	public void setMajorSeq(String majorSeq) {
		this.majorSeq = majorSeq;
	}
	public String getmClass() {
		return mClass;
	}
	public void setmClass(String mClass) {
		this.mClass = mClass;
	}
	public String getSvcCode() {
		return svcCode;
	}
	public void setSvcCode(String svcCode) {
		this.svcCode = svcCode;
	}
	@Override
	public String toString() {
		return "ResumeDept [resumeDeptCode=" + resumeDeptCode + ", infoMemberId=" + infoMemberId + ", majorSeq="
				+ majorSeq + ", mClass=" + mClass + ", svcCode=" + svcCode + "]";
	}
}
