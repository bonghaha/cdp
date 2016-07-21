package com.to.cdp.info.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.info.dao.InfoCertDao;
import com.to.cdp.info.model.InfoCert;

@Service
@Transactional
public class InfoCertService {
	
	@Autowired
	private InfoCertDao infoCertDao;
	
	// infoCertInsert
	public int infoCertInsert(InfoCert infoCert){
		String infoCertCode = null;
		
		int infoCertCount=0;
		infoCertCount = infoCertDao.infoCertCount()+1;
		infoCertCode = "info_cert_" + infoCertCount;
		
		infoCert.setInfoCertCode(infoCertCode);
		return infoCertDao.infoCertInsert(infoCert);
	}
	
	// infoCertUpdate
	public int infoCertUpdate(InfoCert infoCert){
		return infoCertDao.infoCertUpdate(infoCert);
	}
	
	// infoCertDelete
	public int infoCertDelete(InfoCert infoCert){
		return infoCertDao.infoCertDelete(infoCert);
	}
	
	// infoCertList
	public List<InfoCert> infoCertList(Map<String, Object> map){
		return infoCertDao.infoCertList(map);
	}
	
	// infoCertDetail
	public InfoCert infoCertDetail(InfoCert infoCert){
		return infoCertDao.infoCertDetail(infoCert);
	}
	
	// infoBookPage
	public int infoCertCountBySearch(Map<String, Object> map) {
		return infoCertDao.infoCertCountBySearch(map);
	}
}