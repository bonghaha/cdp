package com.to.cdp.rec.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.rec.dao.RecCertDao;
import com.to.cdp.rec.model.RecCert;

@Service
@Transactional
public class RecCertService {
	
	@Autowired
	private RecCertDao recCertDao;
	
	// recCertInsert
	public int recCertInsert(RecCert recCert){
		return recCertDao.recCertInsert(recCert);
	}
	
	// recCertUpdate
	public int recCertUpdate(RecCert recCert){
		return recCertDao.recCertUpdate(recCert);
	}
	
	// recCertDelete
	public int recCertDelete(RecCert recCert){
		return recCertDao.recCertDelete(recCert);
	}
	
	// recCertList
	public List<RecCert> recCertList(RecCert recCert){
		return recCertDao.recCertList(recCert);
	}
	
	// recCertDetail
	public RecCert recCertDetail(RecCert recCert){
		return recCertDao.recCertDetail(recCert);
	}
}