package com.to.cdp.plan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.plan.dao.PlanContestDao;
import com.to.cdp.plan.model.PlanContest;

@Service
@Transactional
public class PlanContestService {
	
	@Autowired
	private PlanContestDao planContestDao;
	
	// planContestInsert
	public int planContestInsert(PlanContest planContest){
		return planContestDao.planContestInsert(planContest);
	}
	
	// planContestUpdate
	public int planContestUpdate(PlanContest planContest){
		return planContestDao.planContestUpdate(planContest);
	}
	
	// planContestDelete
	public int planContestDelete(PlanContest planContest){
		return planContestDao.planContestDelete(planContest);
	}
	
	// planContestList
	public List<PlanContest> planContestList(PlanContest planContest){
		return planContestDao.planContestList(planContest);
	}
	
	// planContestDetail
	public PlanContest planContestDetail(PlanContest planContest){
		return planContestDao.planContestDetail(planContest);
	}
}
