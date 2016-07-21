package com.to.cdp.info.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.info.dao.InfoVolunDao;
import com.to.cdp.info.model.InfoVolun;

@Service
@Transactional
public class InfoVolunService {
	
	@Autowired
	private InfoVolunDao infoVolunDao;
	
	// infoVolunInsert
	public int infoVolunInsert(InfoVolun infoVolun){
		int infoVolunCount = 0;
		String infoVolunCode = null;
		infoVolunCount = infoVolunDao.infoVolunCount()+1;
		infoVolunCode = "info_volun_" + infoVolunCount;
		infoVolun.setInfoVolunCode(infoVolunCode);
		return infoVolunDao.infoVolunInsert(infoVolun);
	}
	
	// infoVolunUpdate
	public int infoVolunUpdate(InfoVolun infoVolun){
		return infoVolunDao.infoVolunUpdate(infoVolun);
	}
	
	// infoVolunDelete
	public int infoVolunDelete(InfoVolun infoVolun){
		return infoVolunDao.infoVolunDelete(infoVolun);
	}
	
	// infoVolunList
	public List<InfoVolun> infoVolunList(Map<String, Object> map){
		return infoVolunDao.infoVolunList(map);
	}
	
	// infoVolunDetail
	public InfoVolun infoVolunDetail(InfoVolun infoVolun){
		return infoVolunDao.infoVolunDetail(infoVolun);
	}

	public int infoVolunCountBySearch(Map<String, Object> map) {
		return infoVolunDao.infoVolunCountBySearch(map);
	}
}