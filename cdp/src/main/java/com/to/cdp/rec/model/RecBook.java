package com.to.cdp.rec.model;

public class RecBook {
	private String recBookCode; 		//��õ�����ڵ�
//	private String recUniteCode;		//��õ�����ڵ�
	private String infoBookCode;		//�����з���ȣ
	private String recBookReason;		//��õ����
	private String recBookContent;		//���� �� ����
	private String recBookCondition;	//����(����)
	private String recBookRegisterDate;	//����⵵
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