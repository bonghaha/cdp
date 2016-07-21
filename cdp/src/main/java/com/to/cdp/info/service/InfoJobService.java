package com.to.cdp.info.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.PageHelper;
import com.to.cdp.info.dao.InfoJobDao;
import com.to.cdp.info.model.InfoJob;

@Service
@Transactional
public class InfoJobService {
	
	@Autowired
	private InfoJobDao infoJobDao;
	
	// infoJobInsert
	public int infoJobInsert(InfoJob infoJob){
		String infoJobCode = null;
		int infoJobCount = 0;
		infoJobCount = infoJobDao.infoJobCount()+1;
		infoJobCode = "info_job_" + infoJobCount;
		
		infoJob.setInfoJobCode(infoJobCode);
		return infoJobDao.infoJobInsert(infoJob);
	}
	
	// infoJobUpdate
	public int infoJobUpdate(InfoJob infoJob){
		return infoJobDao.infoJobUpdate(infoJob);
	}
	
	// infoJobDelete
	public int infoJobDelete(InfoJob infoJob){
		return infoJobDao.infoJobDelete(infoJob);
	}
	
	// infoJobList
	public List<InfoJob> infoJobList(Map<String, Object> map){
		return infoJobDao.infoJobList(map);
	}
	
	// infoJobDetail
	public InfoJob infoJobDetail(InfoJob infoJob){
		return infoJobDao.infoJobDetail(infoJob);
	}

	public int infoJobCountBySearch(Map<String, Object> map) {
		return infoJobDao.infoJobCountBySearch(map);
	}
	
	public PageHelper pageSet(int totalCount, int linePerPage, int clickPage) {
		return null;
	}	
}