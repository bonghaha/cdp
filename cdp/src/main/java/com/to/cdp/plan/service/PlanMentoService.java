package com.to.cdp.plan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.plan.dao.PlanMentoDao;
import com.to.cdp.plan.model.PlanMento;

@Service
@Transactional
public class PlanMentoService {
	
	@Autowired
	private PlanMentoDao planMentoDao;
	
	// planMentoInsert
	public int planMentoInsert(PlanMento planMento){
		return planMentoDao.planMentoInsert(planMento);
	}
	
	// planMentoUpdate
	public int planMentoUpdate(PlanMento planMento){
		return planMentoDao.planMentoUpdate(planMento);
	}
	
	// planMentoDelete
	public int planMentoDelete(PlanMento planMento){
		return planMentoDao.planMentoDelete(planMento);
	}
	
	// planMentoList
	public List<PlanMento> planMentoList(PlanMento planMento){
		return planMentoDao.planMentoList(planMento);
	}
	
	// planMentoDetail
	public PlanMento planMentoDetail(PlanMento planMento){
		return planMentoDao.planMentoDetail(planMento);
	}
}