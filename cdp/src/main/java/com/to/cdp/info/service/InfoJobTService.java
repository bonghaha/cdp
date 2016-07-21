package com.to.cdp.info.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.PageHelper;
import com.to.cdp.info.dao.InfoJobTDao;
import com.to.cdp.info.model.InfoJobT;

@Service
@Transactional
public class InfoJobTService {
	
	@Autowired
	private InfoJobTDao infoJobTDao;
	
	// infoJobTInsert
	public int infoJobTInsert(InfoJobT infoJobT){
		String infoJobTCode = null;
		
		
		int infoJobTCount = 0;
		infoJobTCount = infoJobTDao.infoJobTCount()+1;
		infoJobTCode = "info_jobt_" + infoJobTCount;
		
		infoJobT.setInfoJobTCode(infoJobTCode);
		return infoJobTDao.infoJobTInsert(infoJobT);
	}
	
	// infoJobTUpdate
	public int infoJobTUpdate(InfoJobT infoJobT){
		return infoJobTDao.infoJobTUpdate(infoJobT);
	}
	
	// infoJobTDelete
	public int infoJobTDelete(InfoJobT infoJobT){
		return infoJobTDao.infoJobTDelete(infoJobT);
	}
	
	// infoJobTList
	public List<InfoJobT> infoJobTList(Map<String, Object> map){
		return infoJobTDao.infoJobTList(map);
	}
	
	// infoJobTDetail
	public InfoJobT infoJobTDetail(InfoJobT infoJobT){
		return infoJobTDao.infoJobTDetail(infoJobT);
	}

	public int infoJobTCountBySearch(Map<String, Object> map) {
		return infoJobTDao.infoJobTCountBySearch(map);
	}
	
	public PageHelper pageSet(int totalCount, int linePerPage, int clickPage) {
		return null;
	}
}