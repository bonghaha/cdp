package com.to.cdp.act.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.act.dao.ActUniteDao;
import com.to.cdp.act.model.ActUnite;

@Service
@Transactional
public class ActUniteService {
	
	@Autowired
	private ActUniteDao actUniteDao;
	
	// actUniteInsert
	public int actUniteInsert(ActUnite actUnite){
		return actUniteDao.actUniteInsert(actUnite);
	}
	
	// actUniteUpdate
	public int actUniteUpdate(ActUnite actUnite){
		return actUniteDao.actUniteUpdate(actUnite);
	}
	
	// actUniteDelete
	public int actUniteDelete(ActUnite actUnite){
		return actUniteDao.actUniteDelete(actUnite);
	}
	
	// actUniteList
	public List<ActUnite> actUniteList(ActUnite actUnite){
		return actUniteDao.actUniteList(actUnite);
	}
	
	// actUniteDetail
	public ActUnite actUniteDetail(ActUnite actUnite){
		return actUniteDao.actUniteDetail(actUnite);
	}
}