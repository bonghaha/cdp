package com.to.cdp.rec.model;

public class RecCert {

	
	private String recCertCode; 		//��õ�ڰ����ڵ�
	//private String recUniteCode;		//��õ�����ڵ�
	private String infoCertCode;		//�ڰ����з���ȣ
	private String recCertReason;		//��õ����
	private String recCertContent;		//���� �� ����
	private String recCertCondition;	//����(����)
	private String recCertRegisterDate;	//����⵵
	private String infoJobCode;
	public String getRecCertCode() {
		return recCertCode;
	}
	public void setRecCertCode(String recCertCode) {
		this.recCertCode = recCertCode;
	}
	public String getInfoCertCode() {
		return infoCertCode;
	}
	public void setInfoCertCode(String infoCertCode) {
		this.infoCertCode = infoCertCode;
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
	public String getInfoJobCode() {
		return infoJobCode;
	}
	public void setInfoJobCode(String infoJobCode) {
		this.infoJobCode = infoJobCode;
	}
	@Override
	public String toString() {
		return "RecCert [recCertCode=" + recCertCode + ", infoCertCode=" + infoCertCode + ", recCertReason="
				+ recCertReason + ", recCertContent=" + recCertContent + ", recCertCondition=" + recCertCondition
				+ ", recCertRegisterDate=" + recCertRegisterDate + ", infoJobCode=" + infoJobCode + "]";
	}
}
