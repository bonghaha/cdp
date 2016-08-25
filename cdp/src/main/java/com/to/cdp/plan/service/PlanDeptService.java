package com.to.cdp.plan.service;

import java.util.ArrayList;
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
	
	// 퍼센트값 구하는 메서드
	public PlanDept setPlanDeptPercent(PlanDept planDept){
		// 퍼센테이지값 생성
		int percentNum = 0;
		String planDeptPercentSuf = "%";
		
		// 계획학교코드에 해당하는 계획학교상세카운트하기
		double allCount = planDeptDao.pddCountByPlanDeptCode(planDept);
		// psdCountByPscWithCondition
		double completeCount = planDeptDao.pddCountByPdcWithCondition(planDept);
		
		System.out.println("allCount PlanDeptService : " + allCount);
		System.out.println("completeCount PlanDeptService : " + completeCount);
		percentNum = (int) ((completeCount/allCount)*100);
		System.out.println("percentNum PlanDeptService : " + percentNum);
		
		String planDeptPercent = percentNum + planDeptPercentSuf;
		System.out.println("planDeptPercent PlanDeptService : " + planDeptPercent);
		planDept.setPlanDeptPercent(planDeptPercent);
		return planDept;
	}	
	
	// planDeptList
	public List<PlanDept> planDeptList(PlanDept planDept){
		System.out.println("===============PlanDeptService===============");
		List<PlanDept> planDeptListForSet = planDeptDao.planDeptList(planDept);	// planDept객체 정보들담아서 리스트
		List<PlanDept> planDeptList = new ArrayList<PlanDept>();	// planDept객체 정보들담아서 리스트
		
		System.out.println("planDeptListForSet.size() : " + planDeptListForSet.size());
		int size = planDeptListForSet.size();
		
		for(int i=0; i<size; i++){
			System.out.println("-------for Start-------");
			planDept = new PlanDept();
			planDept = planDeptListForSet.get(i);
			planDept = setPlanDeptPercent(planDept);
			planDeptList.add(planDept);
			
			System.out.println("-------for End-------");
		}
		System.out.println("planDeptList : " + planDeptList);
		System.out.println("=============PlanDeptService End=============");
		return planDeptList;
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
