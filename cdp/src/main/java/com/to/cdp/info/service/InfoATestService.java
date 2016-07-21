package com.to.cdp.info.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.info.dao.InfoATestDao;
import com.to.cdp.info.model.InfoATest;

@Service
@Transactional
public class InfoATestService {
	
	@Autowired
	private InfoATestDao infoATestDao;
	
	// infoATestInsert
	public int infoATestInsert(InfoATest infoATest){
		return infoATestDao.infoATestInsert(infoATest);
	}
	
	// infoATestUpdate
	public int infoATestUpdate(InfoATest infoATest){
		return infoATestDao.infoATestUpdate(infoATest);
	}
	
	// infoATestDelete
	public int infoATestDelete(InfoATest infoATest){
		return infoATestDao.infoATestDelete(infoATest);
	}
	
	// infoATestList
	public List<InfoATest> infoATestList(InfoATest infoATest){
		return infoATestDao.infoATestList(infoATest);
	}
	
	// infoATestDetail
	public InfoATest infoATestDetail(InfoATest infoATest){
		return infoATestDao.infoATestDetail(infoATest);
	}
}