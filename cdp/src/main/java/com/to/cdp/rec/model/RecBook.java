package com.to.cdp.rec.model;

public class RecBook {
	private String recBookCode; 		//추천도서코드
//	private String recUniteCode;		//추천통합코드
	private String infoBookCode;		//도서분류번호
	private String recBookReason;		//추천이유
	private String recBookContent;		//내용 및 절차
	private String recBookCondition;	//구분(상태)
	private String recBookRegisterDate;	//적용년도
	private String infoJobCode;
	public String getRecBookCode() {
		return recBookCode;
	}
	public void setRecBookCode(String recBookCode) {
		this.recBookCode = recBookCode;
	}
	public String getInfoBookCode() {
		return infoBookCode;
	}
	public void setInfoBookCode(String infoBookCode) {
		this.infoBookCode = infoBookCode;
	}
	public String getRecBookReason() {
		return recBookReason;
	}
	public void setRecBookReason(String recBookReason) {
		this.recBookReason = recBookReason;
	}
	public String getRecBookContent() {
		return recBookContent;
	}
	public void setRecBookContent(String recBookContent) {
		this.recBookContent = recBookContent;
	}
	public String getRecBookCondition() {
		return recBookCondition;
	}
	public void setRecBookCondition(String recBookCondition) {
		this.recBookCondition = recBookCondition;
	}
	public String getRecBookRegisterDate() {
		return recBookRegisterDate;
	}
	public void setRecBookRegisterDate(String recBookRegisterDate) {
		this.recBookRegisterDate = recBookRegisterDate;
	}
	public String getInfoJobCode() {
		return infoJobCode;
	}
	public void setInfoJobCode(String infoJobCode) {
		this.infoJobCode = infoJobCode;
	}
	@Override
	public String toString() {
		return "RecBook [recBookCode=" + recBookCode + ", infoBookCode=" + infoBookCode + ", recBookReason="
				+ recBookReason + ", recBookContent=" + recBookContent + ", recBookCondition=" + recBookCondition
				+ ", recBookRegisterDate=" + recBookRegisterDate + ", infoJobCode=" + infoJobCode + "]";
	}

}