package com.to.cdp.info.model;

public class InfoJob {
	private String totalCount;			// 전체 검색 결과수
	private String jobCode;				// 직업코드
	private String jobdicSeq;			// 직업코드ID
	private String job;					// 직업명
	private String profession;			// 직업분야
	private String aptdTypeCode;		// 적성유형별코드
	private String jobCtgCode;			// 직업분류코드
	private String summary;				// 직업설명
	private String similarJob;			// 유사직업
	private String equalemployment;		// 고용평등
	private String possibility;			// 발전가능성
	private String prospect;			// 전망
	private String salery;				// 연봉
	public String getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(String totalCount) {
		this.totalCount = totalCount;
	}
	public String getJobCode() {
		return jobCode;
	}
	public void setJobCode(String jobCode) {
		this.jobCode = jobCode;
	}
	public String getJobdicSeq() {
		return jobdicSeq;
	}
	public void setJobdicSeq(String jobdicSeq) {
		this.jobdicSeq = jobdicSeq;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getProfession() {
		return profession;
	}
	public void setProfession(String profession) {
		this.profession = profession;
	}
	public String getAptdTypeCode() {
		return aptdTypeCode;
	}
	public void setAptdTypeCode(String aptdTypeCode) {
		this.aptdTypeCode = aptdTypeCode;
	}
	public String getJobCtgCode() {
		return jobCtgCode;
	}
	public void setJobCtgCode(String jobCtgCode) {
		this.jobCtgCode = jobCtgCode;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getSimilarJob() {
		return similarJob;
	}
	public void setSimilarJob(String similarJob) {
		this.similarJob = similarJob;
	}
	public String getEqualemployment() {
		return equalemployment;
	}
	public void setEqualemployment(String equalemployment) {
		this.equalemployment = equalemployment;
	}
	public String getPossibility() {
		return possibility;
	}
	public void setPossibility(String possibility) {
		this.possibility = possibility;
	}
	public String getProspect() {
		return prospect;
	}
	public void setProspect(String prospect) {
		this.prospect = prospect;
	}
	public String getSalery() {
		return salery;
	}
	public void setSalery(String salery) {
		this.salery = salery;
	}
	@Override
	public String toString() {
		return "InfoJob [totalCount=" + totalCount + ", jobCode=" + jobCode + ", jobdicSeq=" + jobdicSeq + ", job="
				+ job + ", profession=" + profession + ", aptdTypeCode=" + aptdTypeCode + ", jobCtgCode=" + jobCtgCode
				+ ", summary=" + summary + ", similarJob=" + similarJob + ", equalemployment=" + equalemployment
				+ ", possibility=" + possibility + ", prospect=" + prospect + ", salery=" + salery + "]";
	}
}