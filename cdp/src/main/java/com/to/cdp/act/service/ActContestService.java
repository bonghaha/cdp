package com.to.cdp.act.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.act.dao.ActContestDao;
import com.to.cdp.act.model.ActContest;

@Service
@Transactional
public class ActContestService {
	
	@Autowired
	private ActContestDao actContestDao;
	
	// actContestInsert
	public int actContestInsert(ActContest actContest){
		return actContestDao.actContestInsert(actContest);
	}
	
	// actContestUpdate
	public int actContestUpdate(ActContest actContest){
		return actContestDao.actContestUpdate(actContest);
	}
	
	// actContestDelete
	public int actContestDelete(ActContest actContest){
		return actContestDao.actContestDelete(actContest);
	}
	
	// actContestList
	public List<ActContest> actContestList(ActContest actContest){
		return actContestDao.actContestList(actContest);
	}
	
	// actContestDetail
	public ActContest actContestDetail(ActContest actContest){
		return actContestDao.actContestDetail(actContest);
	}
}