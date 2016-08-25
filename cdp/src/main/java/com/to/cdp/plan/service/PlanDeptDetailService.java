package com.to.cdp.plan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.to.cdp.plan.dao.PlanDeptDetailDao;
import com.to.cdp.plan.model.PlanDeptDetail;

@Service
public class PlanDeptDetailService {
	@Autowired
	private PlanDeptDetailDao planDeptDetailDao;
	
	public int planDeptDetailInsert(PlanDeptDetail planDeptDetail) {
		String planDeptDetailLastKey = "";
		String planDeptDetailCode = "";
		String planDeptDetailPre = "plan_dept_detail_";
		// 마지막으로 생성된 plan_dept_detail_code 번호 select
		planDeptDetailLastKey = planDeptDetailDao.planDeptDetailLastKey();
		
		int lastKeyNum = 0;
		if(planDeptDetailLastKey == null){
			lastKeyNum = lastKeyNum+1;
		}else{
			// resume_dept_을 제외한 번호만 뽑아내서 +1 시킴
			lastKeyNum = Integer.parseInt(planDeptDetailLastKey.substring(planDeptDetailPre.length()))+1;
		}
		
		// resume_dept_번호 셋팅
		planDeptDetailCode = planDeptDetailPre + lastKeyNum;
		planDeptDetail.setPlanDeptDetailCode(planDeptDetailCode);
		return planDeptDetailDao.planDeptDetailInsert(planDeptDetail);
	}

	public List<PlanDeptDetail> planDeptDetailList(PlanDeptDetail planDeptDetail) {
		return planDeptDetailDao.planDeptDetailList(planDeptDetail);
	}

	// 완료버튼 클릭시 condition 1로 바꾸기
	public int planDeptDetailComplete(PlanDeptDetail planDeptDetail) {
		return planDeptDetailDao.planDeptDetailComplete(planDeptDetail);
	}

	// planDeptDetailCode에 해당하는 planDeptCode받기
	public String pdCodeByPddCode(PlanDeptDetail planDeptDetail) {
		return planDeptDetailDao.pdCodeByPddCode(planDeptDetail);
	}
}
