package com.to.cdp.plan.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.plan.dao.PlanCertDao;
import com.to.cdp.plan.model.PlanCert;
import com.to.cdp.plan.model.PlanSchool;
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

	// 퍼센트값 구하는 메서드
	public PlanCert setPlanCertPercent(PlanCert planCert){
		System.out.println("======PlanCertService setPlanCertPercent()======");
		// 퍼센테이지값 생성
		int percentNum = 0;
		String planCertPercentSuf = "%";
		System.out.println("planCert : " + planCert);
		// 계획학교코드에 해당하는 계획학교상세카운트하기
		double allCount = planCertDao.pcdCountByPlancertCode(planCert);
		// psdCountByPscWithCondition
		double completeCount = planCertDao.pcdCountByPccWithCondition(planCert);
		
		System.out.println("allCount PlanCertService : " + allCount);
		System.out.println("completeCount PlanCertService : " + completeCount);
		percentNum = (int) ((completeCount/allCount)*100);
		System.out.println("percentNum PlanCertService : " + percentNum);
		
		String planCertPercent = percentNum + planCertPercentSuf;
		System.out.println("planCertPercent PlanCertService : " + planCertPercent);
		planCert.setPlanCertPercent(planCertPercent);
		System.out.println("====PlanCertService setPlanCertPercent() END====");
		return planCert;
	}

	// planCertList
	public List<PlanCert> planCertList(PlanCert planCert){
		System.out.println("===============PlanCertService===============");
		List<PlanCert> planCertListForSet = planCertDao.planCertList(planCert);	// planCert객체 정보들담아서 리스트
		System.out.println("planCertListForSet : " + planCertListForSet);
		List<PlanCert> planCertList = new ArrayList<PlanCert>();	// planCert객체 정보들담아서 리스트
		
		System.out.println("planCertListForSet.size() : " + planCertListForSet.size());
		int size = planCertListForSet.size();
		
		for(int i=0; i<size; i++){
			System.out.println("-------for Start-------");
			planCert = new PlanCert();
			planCert = planCertListForSet.get(i);
			planCert = setPlanCertPercent(planCert);
			planCertList.add(planCert);
			
			System.out.println("-------for End-------");
		}
		System.out.println("planCertList : " + planCertList);
		System.out.println("=============PlanCertService End=============");
		return planCertList;
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
