package com.to.cdp.rec.model;

public class RecVolun {

	
	private String recVolunCode; 			//추천봉사활동코드
	//private String recUniteCode;			//추천통합코드
	private String infoVolunCode;			//봉사활동분류번호
	private String recVolunReason;			//추천이유
	private String recVolunContent;			//내용 및 절자
	private String recVolunCondition;		//구분(상태)
	private String recVolunRegisterDate;	//적용년도
	private String infoJobCode;
	public String getRecVolunCode() {
		return recVolunCode;
	}
	public void setRecVolunCode(String recVolunCode) {
		this.recVolunCode = recVolunCode;
	}
	public String getInfoVolunCode() {
		return infoVolunCode;
	}
	public void setInfoVolunCode(String infoVolunCode) {
		this.infoVolunCode = infoVolunCode;
	}
	public String getRecVolunReason() {
		return recVolunReason;
	}
	public void setRecVolunReason(String recVolunReason) {
		this.recVolunReason = recVolunReason;
	}
	public String getRecVolunContent() {
		return recVolunContent;
	}
	public void setRecVolunContent(String recVolunContent) {
		this.recVolunContent = recVolunContent;
	}
	public String getRecVolunCondition() {
		return recVolunCondition;
	}
	public void setRecVolunCondition(String recVolunCondition) {
		this.recVolunCondition = recVolunCondition;
	}
	public String getRecVolunRegisterDate() {
		return recVolunRegisterDate;
	}
	public void setRecVolunRegisterDate(String recVolunRegisterDate) {
		this.recVolunRegisterDate = recVolunRegisterDate;
	}
	public String getInfoJobCode() {
		return infoJobCode;
	}
	public void setInfoJobCode(String infoJobCode) {
		this.infoJobCode = infoJobCode;
	}
	@Override
	public String toString() {
		return "RecVolun [recVolunCode=" + recVolunCode + ", infoVolunCode=" + infoVolunCode + ", recVolunReason="
				+ recVolunReason + ", recVolunContent=" + recVolunContent + ", recVolunCondition=" + recVolunCondition
				+ ", recVolunRegisterDate=" + recVolunRegisterDate + ", infoJobCode=" + infoJobCode + "]";
	}
}
