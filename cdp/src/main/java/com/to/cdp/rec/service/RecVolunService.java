package com.to.cdp.rec.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.rec.dao.RecVolunDao;
import com.to.cdp.rec.model.RecVolun;

@Service
@Transactional
public class RecVolunService {
	
	@Autowired
	private RecVolunDao recVolunDao;
	
	// recVolunInsert
	public int recVolunInsert(RecVolun recVolun){
		return recVolunDao.recVolunInsert(recVolun);
	}
	
	// recVolunUpdate
	public int recVolunUpdate(RecVolun recVolun){
		return recVolunDao.recVolunUpdate(recVolun);
	}
	
	// recVolunDelete
	public int recVolunDelete(RecVolun recVolun){
		return recVolunDao.recVolunDelete(recVolun);
	}
	
	// recVolunList
	public List<RecVolun> recVolunList(RecVolun recVolun){
		return recVolunDao.recVolunList(recVolun);
	}
	
	// recVolunDetail
	public RecVolun recVolunDetail(RecVolun recVolun){
		return recVolunDao.recVolunDetail(recVolun);
	}
}
