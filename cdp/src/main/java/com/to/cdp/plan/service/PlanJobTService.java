package com.to.cdp.plan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.plan.dao.PlanJobTDao;
import com.to.cdp.plan.model.PlanJobT;

@Service
@Transactional
public class PlanJobTService {
	
	@Autowired
	private PlanJobTDao planJobTDao;
	
	// planJobTInsert
	public int planJobTInsert(PlanJobT planJobT){
		return planJobTDao.planJobTInsert(planJobT);
	}
	
	// planJobTUpdate
	public int planJobTUpdate(PlanJobT planJobT){
		return planJobTDao.planJobTUpdate(planJobT);
	}
	
	// planJobTDelete
	public int planJobTDelete(PlanJobT planJobT){
		return planJobTDao.planJobTDelete(planJobT);
	}
	
	// planJobTList
	public List<PlanJobT> planJobTList(PlanJobT planJobT){
		return planJobTDao.planJobTList(planJobT);
	}
	
	// planJobTDetail
	public PlanJobT planJobTDetail(PlanJobT planJobT){
		return planJobTDao.planJobTDetail(planJobT);
	}
}
