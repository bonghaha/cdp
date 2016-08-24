package com.to.cdp.plan.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.plan.dao.PlanDeptDao;
import com.to.cdp.plan.model.PlanDept;
import com.to.cdp.plan.model.PlanSchool;
import com.to.cdp.plan.model.PlanUnite;
import com.to.cdp.rec.model.RecDept;

@Service
@Transactional
public class PlanDeptService {
	
	@Autowired
	private PlanDeptDao planDeptDao;
	
	// planDeptInsert
	public int planDeptInsert(PlanDept planDept) {
		String planDeptLastKey = "";
		String planDeptCode = "";
		String planDeptPre = "plan_dept_";
		// 마지막으로 생성된 resume_school_code 번호 select
		planDeptLastKey = planDeptDao.planDeptLastKey();
		
		int lastKeyNum = 0;
		if(planDeptLastKey == null){
			lastKeyNum = lastKeyNum+1;
		}else{
			// resume_school_을 제외한 번호만 뽑아내서 +1 시킴
			lastKeyNum = Integer.parseInt(planDeptLastKey.substring(planDeptPre.length()))+1;
		}
		
		// resume_school_번호 셋팅
		planDeptCode = planDeptPre + lastKeyNum;
		planDept.setPlanDeptCode(planDeptCode);
		return planDeptDao.planDeptInsert(planDept);
	}
	
	// planDeptUpdate
	public int planDeptUpdate(PlanDept planDept){
		//count = count +1 시키기
		planDept.setPlanDeptCount(planDept.getPlanDeptCount()+1);
		return planDeptDao.planDeptUpdate(planDept);
	}
	
	// planDeptDelete
	public int planDeptDelete(PlanDept planDept){
		return planDeptDao.planDeptDelete(planDept);
	}
	
	// planDeptList
	public List<PlanDept> planDeptList(PlanDept planDept){
		return planDeptDao.planDeptList(planDept);
	}
	
	// planDeptDetail
	public PlanDept planDeptDetail(PlanDept planDept){
		return planDeptDao.planDeptDetail(planDept);
	}

	public List<PlanDept> planDeptListByBtn(PlanUnite planUnite) {
		return planDeptDao.planDeptList(planUnite);
	}

	public RecDept selectDeptMClass(RecDept recDept) {
		return planDeptDao.selectDeptMClass(recDept);
	}
}
