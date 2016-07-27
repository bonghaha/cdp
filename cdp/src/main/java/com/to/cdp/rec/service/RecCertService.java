package com.to.cdp.rec.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.info.model.InfoJob;
import com.to.cdp.rec.dao.RecCertDao;
import com.to.cdp.rec.model.RecCert;



@Service
@Transactional
public class RecCertService {
	
	@Autowired
	private RecCertDao recCertDao;
	
	// recCertInsert
	public int recCertInsert(RecCert recCert){
		String recCertCode = null;
		int recCertCount=0;
		
		recCertCount = recCertDao.recCertCount()+1;
		recCertCode = "rec_cert_" + recCertCount;
		
		recCert.setRecCertCode(recCertCode);
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
	public List<RecCert> recCertList(InfoJob infoJob){
		return recCertDao.recCertList(infoJob);
	}
	
	// recCertDetail
	public RecCert recCertDetail(RecCert recCert){
		return recCertDao.recCertDetail(recCert);
	}

	// ��õ�ڰ��� �� ����
	public int infoCertCountAtRec(Map<String, Object> map) {
		return recCertDao.infoCertCountAtRec(map);
	}

	// ��õ�ڰ�������Ʈ
	public List<Map<String, Object>> recCertListWithRecCertCondition(Map<String, Object> map) {
		return recCertDao.recCertListWithRecCertCondition(map);
	}

}