package com.to.cdp.info.model;

public class InfoJob {
	private String infoJobCode;			// 직업코드
	private String infoJobdicSeq;		// 직업코드ID
	private String infoJob;				// 직업명
	private String infoProfession;		// 직업분야
	private String infoAptdTypeCode;	// 적성유형별코드
	private String infoJobCtgCode;		// 직업분류코드
	private String infoSummary;			// 직업설명
	private String infoSimilarJob;		// 유사직업
	private String infoEqualemployment;	// 고용평등
	private String infoPossibility;		// 발전가능성
	private String infoProspect;		// 전망
	private String infoSalery;			// 연봉
	public String getInfoJobCode() {
		return infoJobCode;
	}
	public void setInfoJobCode(String infoJobCode) {
		this.infoJobCode = infoJobCode;
	}
	public String getInfoJobdicSeq() {
		return infoJobdicSeq;
	}
	public void setInfoJobdicSeq(String infoJobdicSeq) {
		this.infoJobdicSeq = infoJobdicSeq;
	}
	public String getInfoJob() {
		return infoJob;
	}
	public void setInfoJob(String infoJob) {
		this.infoJob = infoJob;
	}
	public String getInfoProfession() {
		return infoProfession;
	}
	public void setInfoProfession(String infoProfession) {
		this.infoProfession = infoProfession;
	}
	public String getInfoAptdTypeCode() {
		return infoAptdTypeCode;
	}
	public void setInfoAptdTypeCode(String infoAptdTypeCode) {
		this.infoAptdTypeCode = infoAptdTypeCode;
	}
	public String getInfoJobCtgCode() {
		return infoJobCtgCode;
	}
	public void setInfoJobCtgCode(String infoJobCtgCode) {
		this.infoJobCtgCode = infoJobCtgCode;
	}
	public String getInfoSummary() {
		return infoSummary;
	}
	public void setInfoSummary(String infoSummary) {
		this.infoSummary = infoSummary;
	}
	public String getInfoSimilarJob() {
		return infoSimilarJob;
	}
	public void setInfoSimilarJob(String infoSimilarJob) {
		this.infoSimilarJob = infoSimilarJob;
	}
	public String getInfoEqualemployment() {
		return infoEqualemployment;
	}
	public void setInfoEqualemployment(String infoEqualemployment) {
		this.infoEqualemployment = infoEqualemployment;
	}
	public String getInfoPossibility() {
		return infoPossibility;
	}
	public void setInfoPossibility(String infoPossibility) {
		this.infoPossibility = infoPossibility;
	}
	public String getInfoProspect() {
		return infoProspect;
	}
	public void setInfoProspect(String infoProspect) {
		this.infoProspect = infoProspect;
	}
	public String getInfoSalery() {
		return infoSalery;
	}
	public void setInfoSalery(String infoSalery) {
		this.infoSalery = infoSalery;
	}
	@Override
	public String toString() {
		return "InfoJob [infoJobCode=" + infoJobCode + ", infoJobdicSeq=" + infoJobdicSeq + ", infoJob=" + infoJob
				+ ", infoProfession=" + infoProfession + ", infoAptdTypeCode=" + infoAptdTypeCode + ", infoJobCtgCode="
				+ infoJobCtgCode + ", infoSummary=" + infoSummary + ", infoSimilarJob=" + infoSimilarJob
				+ ", infoEqualemployment=" + infoEqualemployment + ", infoPossibility=" + infoPossibility
				+ ", infoProspect=" + infoProspect + ", infoSalery=" + infoSalery + "]";
	}
}