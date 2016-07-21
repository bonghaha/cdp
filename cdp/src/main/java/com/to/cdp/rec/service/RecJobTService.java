package com.to.cdp.rec.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.rec.dao.RecJobTDao;
import com.to.cdp.rec.model.RecJobT;

@Service
@Transactional
public class RecJobTService {
	
	@Autowired
	private RecJobTDao recJobTDao;
	
	// recJobTInsert
	public int recJobTInsert(RecJobT recJobT){
		return recJobTDao.recJobTInsert(recJobT);
	}
	
	// recJobTUpdate
	public int recJobTUpdate(RecJobT recJobT){
		return recJobTDao.recJobTUpdate(recJobT);
	}
	
	// recJobTDelete
	public int recJobTDelete(RecJobT recJobT){
		return recJobTDao.recJobTDelete(recJobT);
	}
	
	// recJobTList
	public List<RecJobT> recJobTList(RecJobT recJobT){
		return recJobTDao.recJobTList(recJobT);
	}
	
	// recJobTDetail
	public RecJobT recJobTDetail(RecJobT recJobT){
		return recJobTDao.recJobTDetail(recJobT);
	}
}