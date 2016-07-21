package com.to.cdp.plan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.plan.dao.PlanVolunDao;
import com.to.cdp.plan.model.PlanVolun;

@Service
@Transactional
public class PlanVolunService {
	
	@Autowired
	private PlanVolunDao planVolunDao;
	
	// planVolunInsert
	public int planVolunInsert(PlanVolun planVolun){
		return planVolunDao.planVolunInsert(planVolun);
	}
	
	// planVolunUpdate
	public int planVolunUpdate(PlanVolun planVolun){
		return planVolunDao.planVolunUpdate(planVolun);
	}
	
	// planVolunDelete
	public int planVolunDelete(PlanVolun planVolun){
		return planVolunDao.planVolunDelete(planVolun);
	}
	
	// planVolunList
	public List<PlanVolun> planVolunList(PlanVolun planVolun){
		return planVolunDao.planVolunList(planVolun);
	}
	
	// planVolunDetail
	public PlanVolun planVolunDetail(PlanVolun planVolun){
		return planVolunDao.planVolunDetail(planVolun);
	}
}
