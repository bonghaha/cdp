package com.to.cdp.rec.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.rec.dao.RecContestDao;
import com.to.cdp.rec.model.RecContest;

@Service
@Transactional
public class RecContestService {
	
	@Autowired
	private RecContestDao recContestDao;
	
	// recContestInsert
	public int recContestInsert(RecContest recContest){
		return recContestDao.recContestInsert(recContest);
	}
	
	// recContestUpdate
	public int recContestUpdate(RecContest recContest){
		return recContestDao.recContestUpdate(recContest);
	}
	
	// recContestDelete
	public int recContestDelete(RecContest recContest){
		return recContestDao.recContestDelete(recContest);
	}
	
	// recContestList
	public List<RecContest> recContestList(RecContest recContest){
		return recContestDao.recContestList(recContest);
	}
	
	// recContestDetail
	public RecContest recContestDetail(RecContest recContest){
		return recContestDao.recContestDetail(recContest);
	}
}