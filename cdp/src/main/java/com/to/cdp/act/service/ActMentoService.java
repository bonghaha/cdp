package com.to.cdp.act.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.act.dao.ActMentoDao;
import com.to.cdp.act.model.ActMento;

@Service
@Transactional
public class ActMentoService {
	
	@Autowired
	private ActMentoDao actMentoDao;
	
	// actMentoInsert
	public int actMentoInsert(ActMento actMento){
		return actMentoDao.actMentoInsert(actMento);
	}
	
	// actMentoUpdate
	public int actMentoUpdate(ActMento actMento){
		return actMentoDao.actMentoUpdate(actMento);
	}
	
	// actMentoDelete
	public int actMentoDelete(ActMento actMento){
		return actMentoDao.actMentoDelete(actMento);
	}
	
	// actMentoList
	public List<ActMento> actMentoList(ActMento actMento){
		return actMentoDao.actMentoList(actMento);
	}
	
	// actMentoDetail
	public ActMento actMentoDetail(ActMento actMento){
		return actMentoDao.actMentoDetail(actMento);
	}
}