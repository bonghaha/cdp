package com.to.cdp.plan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.plan.dao.PlanSchoolDao;
import com.to.cdp.plan.model.PlanSchool;

@Service
@Transactional
public class PlanSchoolService {
	
	@Autowired
	private PlanSchoolDao planSchoolDao;
	
	// planSchoolInsert
	public int planSchoolInsert(PlanSchool planSchool){
		return planSchoolDao.planSchoolInsert(planSchool);
	}
	
	// planSchoolUpdate
	public int planSchoolUpdate(PlanSchool planSchool){
		return planSchoolDao.planSchoolUpdate(planSchool);
	}
	
	// planSchoolDelete
	public int planSchoolDelete(PlanSchool planSchool){
		return planSchoolDao.planSchoolDelete(planSchool);
	}
	
	// planSchoolList
	public List<PlanSchool> planSchoolList(PlanSchool planSchool){
		return planSchoolDao.planSchoolList(planSchool);
	}
	
	// planSchoolDetail
	public PlanSchool planSchoolDetail(PlanSchool planSchool){
		return planSchoolDao.planSchoolDetail(planSchool);
	}
}
