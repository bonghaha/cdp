package com.to.cdp.plan.model;

public class PlanDept {
	private String planDeptCode;			// 계획학과코드
	private String planUniteCode;			// 계획통합코드
	private String infoMemberId;			// 회원아이디(로그인아이디)
	private String recDeptCode;				// 추천학과코드
	private String mClass;					// 학과명
	private String planDeptCondition;		// 계획학과상태
	private String planDeptContent;			// 계획학과내용
	private int planDeptCount;				// 계획학과차수
	private String planDeptRegisterDate;	// 계획학과등록일
	private String planDeptStartDate;		// 계획학과시작일
	private String planDeptEndDate;			// 계획학과종료일
	public String getPlanDeptCode() {
		return planDeptCode;
	}
	public void setPlanDeptCode(String planDeptCode) {
		this.planDeptCode = planDeptCode;
	}
	public String getPlanUniteCode() {
		return planUniteCode;
	}
	public void setPlanUniteCode(String planUniteCode) {
		this.planUniteCode = planUniteCode;
	}
	public String getInfoMemberId() {
		return infoMemberId;
	}
	public void setInfoMemberId(String infoMemberId) {
		this.infoMemberId = infoMemberId;
	}
	public String getRecDeptCode() {
		return recDeptCode;
	}
	public void setRecDeptCode(String recDeptCode) {
		this.recDeptCode = recDeptCode;
	}
	public String getPlanDeptCondition() {
		return planDeptCondition;
	}
	public void setPlanDeptCondition(String planDeptCondition) {
		this.planDeptCondition = planDeptCondition;
	}
	public String getPlanDeptContent() {
		return planDeptContent;
	}
	public void setPlanDeptContent(String planDeptContent) {
		this.planDeptContent = planDeptContent;
	}
	public int getPlanDeptCount() {
		return planDeptCount;
	}
	public void setPlanDeptCount(int planDeptCount) {
		this.planDeptCount = planDeptCount;
	}
	public String getPlanDeptRegisterDate() {
		return planDeptRegisterDate;
	}
	public void setPlanDeptRegisterDate(String planDeptRegisterDate) {
		this.planDeptRegisterDate = planDeptRegisterDate;
	}
	public String getPlanDeptStartDate() {
		return planDeptStartDate;
	}
	public void setPlanDeptStartDate(String planDeptStartDate) {
		this.planDeptStartDate = planDeptStartDate;
	}
	public String getPlanDeptEndDate() {
		return planDeptEndDate;
	}
	public void setPlanDeptEndDate(String planDeptEndDate) {
		this.planDeptEndDate = planDeptEndDate;
	}
	public String getmClass() {
		return mClass;
	}
	public void setmClass(String mClass) {
		this.mClass = mClass;
	}
	@Override
	public String toString() {
		return "PlanDept [planDeptCode=" + planDeptCode + ", planUniteCode=" + planUniteCode + ", infoMemberId="
				+ infoMemberId + ", recDeptCode=" + recDeptCode + ", mClass=" + mClass + ", planDeptCondition="
				+ planDeptCondition + ", planDeptContent=" + planDeptContent + ", planDeptCount=" + planDeptCount
				+ ", planDeptRegisterDate=" + planDeptRegisterDate + ", planDeptStartDate=" + planDeptStartDate
				+ ", planDeptEndDate=" + planDeptEndDate + "]";
	}
}
