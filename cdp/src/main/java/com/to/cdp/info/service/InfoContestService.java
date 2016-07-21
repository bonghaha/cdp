package com.to.cdp.info.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.info.dao.InfoContestDao;
import com.to.cdp.info.model.InfoContest;

@Service
@Transactional
public class InfoContestService {
	
	@Autowired
	private InfoContestDao infoContestDao;
	
	// infoContestInsert
	public int infoContestInsert(InfoContest infoContest){
		String infoContestCode = null;
		
		int infoContestCount=0;
		infoContestCount = infoContestDao.infoContestCount()+1;
		infoContestCode = "info_contest_" + infoContestCount;
		
		infoContest.setInfoContestCode(infoContestCode);
		return infoContestDao.infoContestInsert(infoContest);
	}
	
	// infoContestUpdate
	public int infoContestUpdate(InfoContest infoContest){
		return infoContestDao.infoContestUpdate(infoContest);
	}
	
	// infoContestDelete
	public int infoContestDelete(InfoContest infoContest){
		return infoContestDao.infoContestDelete(infoContest);
	}
	
	// infoContestList
	public List<InfoContest> infoContestList(Map<String, Object> map){
		return infoContestDao.infoContestList(map);
	}
	
	// infoContestDetail
	public InfoContest infoContestDetail(InfoContest infoContest){
		return infoContestDao.infoContestDetail(infoContest);
	}
	
	// infoContestPage
	public int infoContestCountBySearch(Map<String, Object> map) {
		return infoContestDao.infoContestCountBySearch(map);
	}
}