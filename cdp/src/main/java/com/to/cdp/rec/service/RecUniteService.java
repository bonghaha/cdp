package com.to.cdp.rec.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.rec.dao.RecUniteDao;
import com.to.cdp.rec.model.RecUnite;

@Service
@Transactional
public class RecUniteService {
	
	@Autowired
	private RecUniteDao recUniteDao;
	
	// recUniteInsert
	public int recUniteInsert(RecUnite recUnite){
		return recUniteDao.recUniteInsert(recUnite);
	}
	
	// recUniteUpdate
	public int recUniteUpdate(RecUnite recUnite){
		return recUniteDao.recUniteUpdate(recUnite);
	}
	
	// recUniteDelete
	public int recUniteDelete(RecUnite recUnite){
		return recUniteDao.recUniteDelete(recUnite);
	}
	
	// recUniteList
	public List<RecUnite> recUniteList(RecUnite recUnite){
		return recUniteDao.recUniteList(recUnite);
	}
	
	// recUniteDetail
	public RecUnite recUniteDetail(RecUnite recUnite){
		return recUniteDao.recUniteDetail(recUnite);
	}
}