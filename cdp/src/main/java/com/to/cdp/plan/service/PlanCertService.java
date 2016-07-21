package com.to.cdp.plan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.plan.dao.PlanCertDao;
import com.to.cdp.plan.model.PlanCert;

@Service
@Transactional
public class PlanCertService {
	
	@Autowired
	private PlanCertDao planCertDao;
	
	// planCertInsert
	public int planCertInsert(PlanCert planCert){
		return planCertDao.planCertInsert(planCert);
	}
	
	// planCertUpdate
	public int planCertUpdate(PlanCert planCert){
		return planCertDao.planCertUpdate(planCert);
	}
	
	// planCertDelete
	public int planCertDelete(PlanCert planCert){
		return planCertDao.planCertDelete(planCert);
	}
	
	// planCertList
	public List<PlanCert> planCertList(PlanCert planCert){
		return planCertDao.planCertList(planCert);
	}
	
	// planCertDetail
	public PlanCert planCertDetail(PlanCert planCert){
		return planCertDao.planCertDetail(planCert);
	}
}
