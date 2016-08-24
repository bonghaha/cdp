package com.to.cdp.plan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.to.cdp.plan.dao.PlanSchoolDetailDao;
import com.to.cdp.plan.model.PlanSchoolDetail;

@Service
public class PlanSchoolDetailService {
	@Autowired
	private PlanSchoolDetailDao planSchoolDetailDao;
	
	public int planSchoolDetailInsert(PlanSchoolDetail planSchoolDetail) {
		String planSchoolDetailLastKey = "";
		String planSchoolDetailCode = "";
		String planSchoolDetailPre = "plan_school_detail_";
		// 마지막으로 생성된 plan_school_detail_code 번호 select
		planSchoolDetailLastKey = planSchoolDetailDao.planSchoolDetailLastKey();
		
		int lastKeyNum = 0;
		if(planSchoolDetailLastKey == null){
			lastKeyNum = lastKeyNum+1;
		}else{
			// resume_school_을 제외한 번호만 뽑아내서 +1 시킴
			lastKeyNum = Integer.parseInt(planSchoolDetailLastKey.substring(planSchoolDetailPre.length()))+1;
		}
		
		// resume_school_번호 셋팅
		planSchoolDetailCode = planSchoolDetailPre + lastKeyNum;
		planSchoolDetail.setPlanSchoolDetailCode(planSchoolDetailCode);
		return planSchoolDetailDao.planSchoolDetailInsert(planSchoolDetail);
	}

	public List<PlanSchoolDetail> planSchoolDetailList(PlanSchoolDetail planSchoolDetail) {
		return planSchoolDetailDao.planSchoolDetailList(planSchoolDetail);
	}
}
