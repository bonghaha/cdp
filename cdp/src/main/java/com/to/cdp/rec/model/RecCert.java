package com.to.cdp.rec.model;

public class RecCert {

	
	private String recCertCode; 		//
	private String jmCd;				// 자격증 분류코드
	private String jmFldNm;				// 자격증명
	private String recCertReason;		//
	private String recCertContent;		//
	private String recCertCondition;	//
	private String recCertRegisterDate;	//
	private String jobdicSeq;
	private String job;
	public String getRecCertCode() {
		return recCertCode;
	}
	public void setRecCertCode(String recCertCode) {
		this.recCertCode = recCertCode;
	}
	public String getJmCd() {
		return jmCd;
	}
	public void setJmCd(String jmCd) {
		this.jmCd = jmCd;
	}
	public String getRecCertReason() {
		return recCertReason;
	}
	public void setRecCertReason(String recCertReason) {
		this.recCertReason = recCertReason;
	}
	public String getRecCertContent() {
		return recCertContent;
	}
	public void setRecCertContent(String recCertContent) {
		this.recCertContent = recCertContent;
	}
	public String getRecCertCondition() {
		return recCertCondition;
	}
	public void setRecCertCondition(String recCertCondition) {
		this.recCertCondition = recCertCondition;
	}
	public String getRecCertRegisterDate() {
		return recCertRegisterDate;
	}
	public void setRecCertRegisterDate(String recCertRegisterDate) {
		this.recCertRegisterDate = recCertRegisterDate;
	}
	public String getJobdicSeq() {
		return jobdicSeq;
	}
	public void setJobdicSeq(String jobdicSeq) {
		this.jobdicSeq = jobdicSeq;
	}
	public String getJmFldNm() {
		return jmFldNm;
	}
	public void setJmFldNm(String jmFldNm) {
		this.jmFldNm = jmFldNm;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	@Override
	public String toString() {
		return "RecCert [recCertCode=" + recCertCode + ", jmCd=" + jmCd + ", jmFldNm=" + jmFldNm + ", recCertReason="
				+ recCertReason + ", recCertContent=" + recCertContent + ", recCertCondition=" + recCertCondition
				+ ", recCertRegisterDate=" + recCertRegisterDate + ", jobdicSeq=" + jobdicSeq + ", job=" + job + "]";
	}
}
