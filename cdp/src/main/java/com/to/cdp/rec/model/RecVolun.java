package com.to.cdp.rec.model;

public class RecVolun {

	
	private String recVolunCode; 			//��õ����Ȱ���ڵ�
	//private String recUniteCode;			//��õ�����ڵ�
	private String infoVolunCode;			//����Ȱ���з���ȣ
	private String recVolunReason;			//��õ����
	private String recVolunContent;			//���� �� ����
	private String recVolunCondition;		//����(����)
	private String recVolunRegisterDate;	//����⵵
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
