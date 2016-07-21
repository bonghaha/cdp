package com.to.cdp.act.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.act.dao.ActCertDao;
import com.to.cdp.act.model.ActCert;

@Service
@Transactional
public class ActCertService {
	
	@Autowired
	private ActCertDao actCertDao;
	
	// actCertInsert
	public int actCertInsert(ActCert actCert){
		return actCertDao.actCertInsert(actCert);
	}
	
	// actCertUpdate
	public int actCertUpdate(ActCert actCert){
		return actCertDao.actCertUpdate(actCert);
	}
	
	// actCertDelete
	public int actCertDelete(ActCert actCert){
		return actCertDao.actCertDelete(actCert);
	}
	
	// actCertList
	public List<ActCert> actCertList(ActCert actCert){
		return actCertDao.actCertList(actCert);
	}
	
	// actCertDetail
	public ActCert actCertDetail(ActCert actCert){
		return actCertDao.actCertDetail(actCert);
	}
}