package com.to.cdp.plan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.plan.dao.PlanUniteDao;
import com.to.cdp.plan.model.PlanUnite;

@Service
@Transactional
public class PlanUniteService {
	
	@Autowired
	private PlanUniteDao planUniteDao;
	
	// planUniteInsert
	public int planUniteInsert(PlanUnite planUnite) {
		String planUniteLastKey = "";
		String planUniteCode = "";
		String planUnitePre = "plan_unite_";
		// 마지막으로 생성된 resume_unite_code 번호 select
		planUniteLastKey = planUniteDao.planUniteLastKey();
		
		int lastKeyNum = 0;
		if(planUniteLastKey == null){
			lastKeyNum = lastKeyNum+1;
		}else{
			// resume_unite_을 제외한 번호만 뽑아내서 +1 시킴
			lastKeyNum = Integer.parseInt(planUniteLastKey.substring(planUnitePre.length()))+1;
		}
		
		// resume_unite_번호 셋팅
		planUniteCode = planUnitePre + lastKeyNum;
		planUnite.setPlanUniteCode(planUniteCode);
		return planUniteDao.planUniteInsert(planUnite);
	}
	
	// planUniteUpdate
	public int planUniteUpdate(PlanUnite planUnite){
		return planUniteDao.planUniteUpdate(planUnite);
	}
	
	// planUniteDelete
	public int planUniteDelete(PlanUnite planUnite){
		return planUniteDao.planUniteDelete(planUnite);
	}
	
	//planUniteList
	public List<PlanUnite> planUniteList(PlanUnite planUnite){
		return planUniteDao.planUniteList(planUnite);
	}
	
	//planUniteDetail
	public PlanUnite planUniteDetail(PlanUnite planUnite){
		return planUniteDao.planUniteDetail(planUnite);
	}
}
