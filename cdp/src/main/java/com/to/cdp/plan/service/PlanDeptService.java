package com.to.cdp.plan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.plan.dao.PlanDeptDao;
import com.to.cdp.plan.model.PlanDept;

@Service
@Transactional
public class PlanDeptService {
	
	@Autowired
	private PlanDeptDao planDeptDao;
	
	// planDeptInsert
	public int planDeptInsert(PlanDept planDept){
		return planDeptDao.planDeptInsert(planDept);
	}
	
	// planDeptUpdate
	public int planDeptUpdate(PlanDept planDept){
		return planDeptDao.planDeptUpdate(planDept);
	}
	
	// planDeptDelete
	public int planDeptDelete(PlanDept planDept){
		return planDeptDao.planDeptDelete(planDept);
	}
	
	// planDeptList
	public List<PlanDept> planDeptList(PlanDept planDept){
		return planDeptDao.planDeptList(planDept);
	}
	
	// planDeptDetail
	public PlanDept planDeptDetail(PlanDept planDept){
		return planDeptDao.planDeptDetail(planDept);
	}
}
