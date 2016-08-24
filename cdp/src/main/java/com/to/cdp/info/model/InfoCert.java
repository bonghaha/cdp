package com.to.cdp.info.model;

public class InfoCert {
	private String jmCd;		// 종목코드
	private String jmFldNm;		// 종목명
	private String mdobligFldCd;// 중직무분야코드
	private String mdobligFldNm;// 중직무분야명
	private String obligFldCd;	// 대직무분야코드
	private String obligFldNm;	// 대직무분야명
	private String qualgbCd;	// 자격구분
	private String qualgbNm;	// 자격구분명
	private String seriesCd;	// 계열코드
	private String seriesNm;	// 계열명
	public String getJmCd() {
		return jmCd;
	}
	public void setJmCd(String jmCd) {
		this.jmCd = jmCd;
	}
	public String getJmFldNm() {
		return jmFldNm;
	}
	public void setJmFldNm(String jmFldNm) {
		this.jmFldNm = jmFldNm;
	}
	public String getMdobligFldCd() {
		return mdobligFldCd;
	}
	public void setMdobligFldCd(String mdobligFldCd) {
		this.mdobligFldCd = mdobligFldCd;
	}
	public String getMdobligFldNm() {
		return mdobligFldNm;
	}
	public void setMdobligFldNm(String mdobligFldNm) {
		this.mdobligFldNm = mdobligFldNm;
	}
	public String getObligFldCd() {
		return obligFldCd;
	}
	public void setObligFldCd(String obligFldCd) {
		this.obligFldCd = obligFldCd;
	}
	public String getObligFldNm() {
		return obligFldNm;
	}
	public void setObligFldNm(String obligFldNm) {
		this.obligFldNm = obligFldNm;
	}
	public String getQualgbCd() {
		return qualgbCd;
	}
	public void setQualgbCd(String qualgbCd) {
		this.qualgbCd = qualgbCd;
	}
	public String getQualgbNm() {
		return qualgbNm;
	}
	public void setQualgbNm(String qualgbNm) {
		this.qualgbNm = qualgbNm;
	}
	public String getSeriesCd() {
		return seriesCd;
	}
	public void setSeriesCd(String seriesCd) {
		this.seriesCd = seriesCd;
	}
	public String getSeriesNm() {
		return seriesNm;
	}
	public void setSeriesNm(String seriesNm) {
		this.seriesNm = seriesNm;
	}
	@Override
	public String toString() {
		return "InfoCert [jmCd=" + jmCd + ", jmFldNm=" + jmFldNm + ", mdobligFldCd=" + mdobligFldCd + ", mdobligFldNm="
				+ mdobligFldNm + ", obligFldCd=" + obligFldCd + ", obligFldNm=" + obligFldNm + ", qualgbCd=" + qualgbCd
				+ ", qualgbNm=" + qualgbNm + ", seriesCd=" + seriesCd + ", seriesNm=" + seriesNm + "]";
	}
	
}