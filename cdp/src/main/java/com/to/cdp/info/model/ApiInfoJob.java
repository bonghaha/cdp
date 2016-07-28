package com.to.cdp.info.model;

public class ApiInfoJob {
	private Object infoJobCode;
	private Object infoJobUnitName;
	public Object getInfoJobCode() {
		return infoJobCode;
	}
	public void setInfoJobCode(Object infoJobCode) {
		this.infoJobCode = infoJobCode;
	}
	public Object getInfoJobUnitName() {
		return infoJobUnitName;
	}
	public void setInfoJobUnitName(Object infoJobUnitName) {
		this.infoJobUnitName = infoJobUnitName;
	}
	@Override
	public String toString() {
		return "ApiInfoJob [infoJobCode=" + infoJobCode + ", infoJobUnitName=" + infoJobUnitName + "]";
	}
	
}
