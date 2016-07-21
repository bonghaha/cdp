package com.to.cdp.plan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.plan.dao.PlanLangDao;
import com.to.cdp.plan.model.PlanLang;

@Service
@Transactional
public class PlanLangService {
	
	@Autowired
	private PlanLangDao planLangDao;
	
	// planLangInsert
	public int planLangInsert(PlanLang planLang){
		return planLangDao.planLangInsert(planLang);
	}
	
	// planLangUpdate
	public int planLangUpdate(PlanLang planLang){
		return planLangDao.planLangUpdate(planLang);
	}
	
	// planLangDelete
	public int planLangDelete(PlanLang planLang){
		return planLangDao.planLangDelete(planLang);
	}
	
	// planLangList
	public List<PlanLang> planLangList(PlanLang planLang){
		return planLangDao.planLangList(planLang);
	}
	
	// planLangDetail
	public PlanLang planLangDetail(PlanLang planLang){
		return planLangDao.planLangDetail(planLang);
	}
}
