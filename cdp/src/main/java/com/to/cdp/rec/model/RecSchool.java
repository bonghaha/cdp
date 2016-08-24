package com.to.cdp.rec.model;

public class RecSchool {
	private String recSchoolCode; 			//
	private String seq;						// 학교코드
	private String schoolName;				// 학교명
	private String recSchoolReason;			//
	private String recSchoolContent;		//
	private String recSchoolCondition;		//
	private String recSchoolRegisterDate;	//
	private String jobdicSeq;				//
	private String job;
	public String getRecSchoolCode() {
		return recSchoolCode;
	}
	public void setRecSchoolCode(String recSchoolCode) {
		this.recSchoolCode = recSchoolCode;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getRecSchoolReason() {
		return recSchoolReason;
	}
	public void setRecSchoolReason(String recSchoolReason) {
		this.recSchoolReason = recSchoolReason;
	}
	public String getRecSchoolContent() {
		return recSchoolContent;
	}
	public void setRecSchoolContent(String recSchoolContent) {
		this.recSchoolContent = recSchoolContent;
	}
	public String getRecSchoolCondition() {
		return recSchoolCondition;
	}
	public void setRecSchoolCondition(String recSchoolCondition) {
		this.recSchoolCondition = recSchoolCondition;
	}
	public String getRecSchoolRegisterDate() {
		return recSchoolRegisterDate;
	}
	public void setRecSchoolRegisterDate(String recSchoolRegisterDate) {
		this.recSchoolRegisterDate = recSchoolRegisterDate;
	}
	public String getJobdicSeq() {
		return jobdicSeq;
	}
	public void setJobdicSeq(String jobdicSeq) {
		this.jobdicSeq = jobdicSeq;
	}
	public String getSchoolName() {
		return schoolName;
	}
	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	@Override
	public String toString() {
		return "RecSchool [recSchoolCode=" + recSchoolCode + ", seq=" + seq + ", schoolName=" + schoolName
				+ ", recSchoolReason=" + recSchoolReason + ", recSchoolContent=" + recSchoolContent
				+ ", recSchoolCondition=" + recSchoolCondition + ", recSchoolRegisterDate=" + recSchoolRegisterDate
				+ ", jobdicSeq=" + jobdicSeq + ", job=" + job + "]";
	}
}
