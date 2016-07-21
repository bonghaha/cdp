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
	public int planUniteInsert(PlanUnite planUnite){
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
	
	// planUniteList
	public List<PlanUnite> planUniteList(PlanUnite planUnite){
		return planUniteDao.planUniteList(planUnite);
	}
	
	// planUniteDetail
	public PlanUnite planUniteDetail(PlanUnite planUnite){
		return planUniteDao.planUniteDetail(planUnite);
	}
}
