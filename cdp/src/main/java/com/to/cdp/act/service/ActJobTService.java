package com.to.cdp.act.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.act.dao.ActJobTDao;
import com.to.cdp.act.model.ActJobT;

@Service
@Transactional
public class ActJobTService {
	
	@Autowired
	private ActJobTDao actJobTDao;
	
	// actJobTInsert
	public int actJobTInsert(ActJobT actJobT){
		return actJobTDao.actJobTInsert(actJobT);
	}
	
	// actJobTUpdate
	public int actJobTUpdate(ActJobT actJobT){
		return actJobTDao.actJobTUpdate(actJobT);
	}
	
	// actJobTDelete
	public int actJobTDelete(ActJobT actJobT){
		return actJobTDao.actJobTDelete(actJobT);
	}
	
	// actJobTList
	public List<ActJobT> actJobTList(ActJobT actJobT){
		return actJobTDao.actJobTList(actJobT);
	}
	
	// actJobTDetail
	public ActJobT actJobTDetail(ActJobT actJobT){
		return actJobTDao.actJobTDetail(actJobT);
	}
}