package com.to.cdp.info.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.PageHelper;
import com.to.cdp.info.dao.InfoStudyAbDao;
import com.to.cdp.info.model.InfoStudyAb;

@Service
@Transactional
public class InfoStudyAbService {
	
	@Autowired
	private InfoStudyAbDao infoStudyAbDao;
	
	// infoStudyAbInsert
	public int infoStudyAbInsert(InfoStudyAb infoStudyAb){
		String infoStudyAbCode = null;
		int infoStudyAbCount = 0;
		infoStudyAbCount = infoStudyAbDao.infoStudyAbCount()+1;
		infoStudyAbCode = "info_studyab_" + infoStudyAbCount;
		
		infoStudyAb.setInfoStudyAbCode(infoStudyAbCode);
		return infoStudyAbDao.infoStudyAbInsert(infoStudyAb);
	}
	
	// infoStudyAbUpdate
	public int infoStudyAbUpdate(InfoStudyAb infoStudyAb){
		return infoStudyAbDao.infoStudyAbUpdate(infoStudyAb);
	}
	
	// infoStudyAbDelete
	public int infoStudyAbDelete(InfoStudyAb infoStudyAb){
		return infoStudyAbDao.infoStudyAbDelete(infoStudyAb);
	}
	
	// infoStudyAbList
	public List<InfoStudyAb> infoStudyAbList(Map<String, Object> map){
		return infoStudyAbDao.infoStudyAbList(map);
	}
	
	// infoStudyAbDetail
	public InfoStudyAb infoStudyAbDetail(InfoStudyAb infoStudyAb){
		return infoStudyAbDao.infoStudyAbDetail(infoStudyAb);
	}

	public int infoStudyAbCountBySearch(Map<String, Object> map) {
		return infoStudyAbDao.infoStudyAbCountBySearch(map);
	}

	public PageHelper pageSet(int totalCount, int linePerPage, int clickPage) {
		return null;
	}
}