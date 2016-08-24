package com.to.cdp.plan.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.info.model.InfoMember;
import com.to.cdp.plan.dao.PlanSchoolDao;
import com.to.cdp.plan.model.PlanSchool;
import com.to.cdp.plan.model.PlanSchoolDetail;
import com.to.cdp.plan.model.PlanUnite;
import com.to.cdp.rec.model.RecSchool;

@Service
@Transactional
public class PlanSchoolService {
	
	@Autowired
	private PlanSchoolDao planSchoolDao;
	
	// planSchoolInsert
	public int planSchoolInsert(PlanSchool planSchool) {
		String planSchoolLastKey = "";
		String planSchoolCode = "";
		String planSchoolPre = "plan_school_";
		// 마지막으로 생성된 plan_school_code 번호 select
		planSchoolLastKey = planSchoolDao.planSchoolLastKey();
		
		int lastKeyNum = 0;
		if(planSchoolLastKey == null){
			lastKeyNum = lastKeyNum+1;
		}else{
			// resume_school_을 제외한 번호만 뽑아내서 +1 시킴
			lastKeyNum = Integer.parseInt(planSchoolLastKey.substring(planSchoolPre.length()))+1;
		}
		
		// resume_school_번호 셋팅
		planSchoolCode = planSchoolPre + lastKeyNum;
		planSchool.setPlanSchoolCode(planSchoolCode);
		return planSchoolDao.planSchoolInsert(planSchool);
	}
	
	// planSchoolUpdate
	public int planSchoolUpdate(PlanSchool planSchool){
		//count = count +1 시키기
		planSchool.setPlanSchoolCount(planSchool.getPlanSchoolCount()+1);
		return planSchoolDao.planSchoolUpdate(planSchool);
	}
	
	// planSchoolDelete
	public int planSchoolDelete(PlanSchool planSchool){
		return planSchoolDao.planSchoolDelete(planSchool);
	}
	
	// planSchoolList
	public List<PlanSchool> planSchoolList(PlanSchool planSchool){
		return planSchoolDao.planSchoolList(planSchool);
	}
	
	// planSchoolDetail
	public PlanSchool planSchoolDetail(PlanSchool planSchool){
		return planSchoolDao.planSchoolDetail(planSchool);
	}

	public List<PlanSchool> planSchoolListByBtn(PlanUnite planUnite) {
		return planSchoolDao.planSchoolList(planUnite);
	}

	public RecSchool selectSchoolName(RecSchool recSchool) {
		return planSchoolDao.selectSchoolName(recSchool);
	}
}
