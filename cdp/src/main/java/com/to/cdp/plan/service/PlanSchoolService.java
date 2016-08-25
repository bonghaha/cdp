package com.to.cdp.plan.service;

import java.util.ArrayList;
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
		// 코드값 생성
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
	
	// 퍼센트값 구하는 메서드
	public PlanSchool setPlanSchoolPercent(PlanSchool planSchool){
		// 퍼센테이지값 생성
		int percentNum = 0;
		String planSchoolPercentSuf = "%";
		
		// 계획학교코드에 해당하는 계획학교상세카운트하기
		double allCount = planSchoolDao.psdCountByPlanSchoolCode(planSchool);
		// psdCountByPscWithCondition
		double completeCount = planSchoolDao.psdCountByPscWithCondition(planSchool);
		
		System.out.println("allCount PlanSchoolService : " + allCount);
		System.out.println("completeCount PlanSchoolService : " + completeCount);
		percentNum = (int) ((completeCount/allCount)*100);
		System.out.println("percentNum PlanSchoolService : " + percentNum);
		
		String planSchoolPercent = percentNum + planSchoolPercentSuf;
		System.out.println("planSchoolPercent PlanSchoolService : " + planSchoolPercent);
		planSchool.setPlanSchoolPercent(planSchoolPercent);
		return planSchool;
	}
	
	// planSchoolList
	public List<PlanSchool> planSchoolList(PlanSchool planSchool){
		System.out.println("===============PlanSchoolService===============");
		List<PlanSchool> planSchoolListForSet = planSchoolDao.planSchoolList(planSchool);	// planSchool객체 정보들담아서 리스트
		List<PlanSchool> planSchoolList = new ArrayList<PlanSchool>();	// planSchool객체 정보들담아서 리스트
		
		System.out.println("planSchoolListForSet.size() : " + planSchoolListForSet.size());
		int size = planSchoolListForSet.size();
		
		for(int i=0; i<size; i++){
			System.out.println("-------for Start-------");
			planSchool = new PlanSchool();
			planSchool = planSchoolListForSet.get(i);
			planSchool = setPlanSchoolPercent(planSchool);
			planSchoolList.add(planSchool);
			
			System.out.println("-------for End-------");
		}
		System.out.println("planSchoolList : " + planSchoolList);
		System.out.println("=============PlanSchoolService End=============");
		return planSchoolList;
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
