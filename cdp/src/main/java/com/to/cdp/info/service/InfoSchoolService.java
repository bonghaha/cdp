package com.to.cdp.info.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.info.dao.InfoSchoolDao;
import com.to.cdp.info.model.InfoSchool;

@Service
@Transactional
public class InfoSchoolService {
	
	@Autowired
	private InfoSchoolDao infoSchoolDao;
	
	// infoSchoolInsert
	public int infoSchoolInsert(InfoSchool infoSchool){
		int infoSchoolCount = 0;
		String infoSchoolCode = null;
		infoSchoolCount = infoSchoolDao.infoSchoolCount()+1;
		infoSchoolCode = "info_school_" + infoSchoolCount;
		infoSchool.setInfoSchoolCode(infoSchoolCode);
		return infoSchoolDao.infoSchoolInsert(infoSchool);
	}
	
	// infoSchoolUpdate
	public int infoSchoolUpdate(InfoSchool infoSchool){
		return infoSchoolDao.infoSchoolUpdate(infoSchool);
	}
	
	// infoSchoolDelete
	public int infoSchoolDelete(InfoSchool infoSchool){
		return infoSchoolDao.infoSchoolDelete(infoSchool);
	}
	
	// infoSchoolList
	public List<InfoSchool> infoSchoolList(Map<String, Object> map){
		return infoSchoolDao.infoSchoolList(map);
	}
	
	// infoSchoolDetail
	public InfoSchool infoSchoolDetail(InfoSchool infoSchool){
		return infoSchoolDao.infoSchoolDetail(infoSchool);
	}

	public int infoSchoolCountBySearch(Map<String, Object> map) {
		return infoSchoolDao.infoSchoolCountBySearch(map);
	}
}