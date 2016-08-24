package com.to.cdp.plan.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.plan.dao.PlanCertDao;
import com.to.cdp.plan.model.PlanCert;
import com.to.cdp.plan.model.PlanUnite;
import com.to.cdp.rec.model.RecCert;

@Service
@Transactional
public class PlanCertService {
	
	@Autowired
	private PlanCertDao planCertDao;
	
	// planCertInsert
	public int planCertInsert(PlanCert planCert){
		String planCertLastKey = "";
		String planCertCode = "";
		String planCertPre = "plan_cert_";
		
		planCertLastKey = planCertDao.planCertLastKey();
		
		int lastKeyNum = 0;
		if(planCertLastKey == null){
			lastKeyNum = lastKeyNum+1;
		}else{
			lastKeyNum = Integer.parseInt(planCertLastKey.substring(planCertPre.length()))+1;
		}
		
		planCertCode = planCertPre + lastKeyNum;
		planCert.setPlanCertCode(planCertCode);
		return planCertDao.planCertInsert(planCert);
	}
	
	// planCertUpdate
	public int planCertUpdate(PlanCert planCert){
		planCert.setPlanCertCount(planCert.getPlanCertCount()+1);
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

	public List<PlanCert> planCertListByBtn(PlanUnite planUnite) {
		return planCertDao.planCertList(planUnite);
	}

	public RecCert selectCertjmFldNm(RecCert recCert) {
		return planCertDao.selectCertjmFldNm(recCert);
	}
}
