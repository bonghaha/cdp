package com.to.cdp.rec.model;

public class RecContest {
	
	
	private String recContestCode; 			//추천공모전코드
	//private String recUniteCode;			//추천통합코드
	private String infoContestCode;			//공모전분류번호
	private String recContestReason;		//추천이유
	private String recContestContent;		//내용 및 절자
	private String recContestCondition;		//구분(상태)
	private String recContestRegisterDate;	//적용년도
	private String infoJobCode;
	public String getRecContestCode() {
		return recContestCode;
	}
	public void setRecContestCode(String recContestCode) {
		this.recContestCode = recContestCode;
	}
	public String getInfoContestCode() {
		return infoContestCode;
	}
	public void setInfoContestCode(String infoContestCode) {
		this.infoContestCode = infoContestCode;
	}
	public String getRecContestReason() {
		return recContestReason;
	}
	public void setRecContestReason(String recContestReason) {
		this.recContestReason = recContestReason;
	}
	public String getRecContestContent() {
		return recContestContent;
	}
	public void setRecContestContent(String recContestContent) {
		this.recContestContent = recContestContent;
	}
	public String getRecContestCondition() {
		return recContestCondition;
	}
	public void setRecContestCondition(String recContestCondition) {
		this.recContestCondition = recContestCondition;
	}
	public String getRecContestRegisterDate() {
		return recContestRegisterDate;
	}
	public void setRecContestRegisterDate(String recContestRegisterDate) {
		this.recContestRegisterDate = recContestRegisterDate;
	}
	public String getInfoJobCode() {
		return infoJobCode;
	}
	public void setInfoJobCode(String infoJobCode) {
		this.infoJobCode = infoJobCode;
	}
	@Override
	public String toString() {
		return "RecContest [recContestCode=" + recContestCode + ", infoContestCode=" + infoContestCode
				+ ", recContestReason=" + recContestReason + ", recContestContent=" + recContestContent
				+ ", recContestCondition=" + recContestCondition + ", recContestRegisterDate=" + recContestRegisterDate
				+ ", infoJobCode=" + infoJobCode + "]";
	}
	
}
