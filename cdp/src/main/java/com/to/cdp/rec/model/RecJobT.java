package com.to.cdp.rec.model;

public class RecJobT {
	
	
	private String recJobTCode; 		//��õ�����Ʒ��ڵ�
	//private String recUniteCode;		//��õ�����ڵ�
	private String infoJobTCode;		//�����Ʒúз���ȣ
	private String recJobTReason;		//��õ����
	private String recJobTContent;		//���� �� ����
	private String recJobTCondition;	//����(����)
	private String recJobTRegisterDate;	//����⵵
	private String infoJobCode;
	public String getRecRecJobTCode() {
		return recJobTCode;
	}
	public void setRecJobTCode(String recJobTCode) {
		this.recJobTCode = recJobTCode;
	}
	public String getInfoJobTCode() {
		return infoJobTCode;
	}
	public void setInfoJobTCode(String infoJobTCode) {
		this.infoJobTCode = infoJobTCode;
	}
	public String getRecJobTReason() {
		return recJobTReason;
	}
	public void setRecJobTReason(String recJobTReason) {
		this.recJobTReason = recJobTReason;
	}
	public String getRecJobTContent() {
		return recJobTContent;
	}
	public void setRecJobTContent(String recJobTContent) {
		this.recJobTContent = recJobTContent;
	}
	public String getRecJobTCondition() {
		return recJobTCondition;
	}
	public void setRecJobTCondition(String recJobTCondition) {
		this.recJobTCondition = recJobTCondition;
	}
	public String getRecJobTRegisterDate() {
		return recJobTRegisterDate;
	}
	public void setRecJobTRegisterDate(String recJobTRegisterDate) {
		this.recJobTRegisterDate = recJobTRegisterDate;
	}
	public String getInfoJobCode() {
		return infoJobCode;
	}
	public void setInfoJobCode(String infoJobCode) {
		this.infoJobCode = infoJobCode;
	}
	@Override
	public String toString() {
		return "RecJobT [recJobTCode=" + recJobTCode + ", infoJobTCode=" + infoJobTCode + ", recJobTReason="
				+ recJobTReason + ", recJobTContent=" + recJobTContent + ", recJobTCondition=" + recJobTCondition
				+ ", recJobTRegisterDate=" + recJobTRegisterDate + ", infoJobCode=" + infoJobCode + "]";
	}
}
