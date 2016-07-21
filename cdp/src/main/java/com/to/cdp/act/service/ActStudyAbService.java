package com.to.cdp.act.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.act.dao.ActStudyAbDao;
import com.to.cdp.act.model.ActStudyAb;

@Service
@Transactional
public class ActStudyAbService {
	
	@Autowired
	private ActStudyAbDao actStudyAbDao;
	
	// actStudyAbInsert
	public int actStudyAbInsert(ActStudyAb actStudyAb){
		return actStudyAbDao.actStudyAbInsert(actStudyAb);
	}
	
	// actStudyAbUpdate
	public int actStudyAbUpdate(ActStudyAb actStudyAb){
		return actStudyAbDao.actStudyAbUpdate(actStudyAb);
	}
	
	// actStudyAbDelete
	public int actStudyAbDelete(ActStudyAb actStudyAb){
		return actStudyAbDao.actStudyAbDelete(actStudyAb);
	}
	
	// actStudyAbList
	public List<ActStudyAb> actStudyAbList(ActStudyAb actStudyAb){
		return actStudyAbDao.actStudyAbList(actStudyAb);
	}
	
	// actStudyAbDetail
	public ActStudyAb actStudyAbDetail(ActStudyAb actStudyAb){
		return actStudyAbDao.actStudyAbDetail(actStudyAb);
	}
}