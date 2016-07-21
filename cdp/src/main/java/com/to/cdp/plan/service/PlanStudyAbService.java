package com.to.cdp.plan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.plan.dao.PlanStudyAbDao;
import com.to.cdp.plan.model.PlanStudyAb;

@Service
@Transactional
public class PlanStudyAbService {
	
	@Autowired
	private PlanStudyAbDao planStudyAbDao;
	
	// planStudyAbInsert
	public int planStudyAbInsert(PlanStudyAb planStudyAb){
		return planStudyAbDao.planStudyAbInsert(planStudyAb);
	}
	
	// planStudyAbUpdate
	public int planStudyAbUpdate(PlanStudyAb planStudyAb){
		return planStudyAbDao.planStudyAbUpdate(planStudyAb);
	}
	
	// planStudyAbDelete
	public int planStudyAbDelete(PlanStudyAb planStudyAb){
		return planStudyAbDao.planStudyAbDelete(planStudyAb);
	}
	
	// planStudyAbList
	public List<PlanStudyAb> planStudyAbList(PlanStudyAb planStudyAb){
		return planStudyAbDao.planStudyAbList(planStudyAb);
	}
	
	// planStudyAbDetail
	public PlanStudyAb planStudyAbDetail(PlanStudyAb planStudyAb){
		return planStudyAbDao.planStudyAbDetail(planStudyAb);
	}
}
