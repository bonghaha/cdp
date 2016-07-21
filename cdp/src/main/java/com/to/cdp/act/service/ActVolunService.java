package com.to.cdp.act.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.act.dao.ActVolunDao;
import com.to.cdp.act.model.ActVolun;

@Service
@Transactional
public class ActVolunService {
	
	@Autowired
	private ActVolunDao actVolunDao;
	
	// actVolunInsert
	public int actVolunInsert(ActVolun actVolun){
		return actVolunDao.actVolunInsert(actVolun);
	}
	
	// actVolunUpdate
	public int actVolunUpdate(ActVolun actVolun){
		return actVolunDao.actVolunUpdate(actVolun);
	}
	
	// actVolunDelete
	public int actVolunDelete(ActVolun actVolun){
		return actVolunDao.actVolunDelete(actVolun);
	}
	
	// actVolunList
	public List<ActVolun> actVolunList(ActVolun actVolun){
		return actVolunDao.actVolunList(actVolun);
	}
	
	// actVolunDetail
	public ActVolun actVolunDetail(ActVolun actVolun){
		return actVolunDao.actVolunDetail(actVolun);
	}
}