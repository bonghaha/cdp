package com.to.cdp.act.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.act.dao.ActSchoolDao;
import com.to.cdp.act.model.ActSchool;

@Service
@Transactional
public class ActSchoolService {
	
	@Autowired
	private ActSchoolDao actSchoolDao;
	
	// actSchoolInsert
	public int actSchoolInsert(ActSchool actSchool){
		return actSchoolDao.actSchoolInsert(actSchool);
	}
	
	// actSchoolUpdate
	public int actSchoolUpdate(ActSchool actSchool){
		return actSchoolDao.actSchoolUpdate(actSchool);
	}
	
	// actSchoolDelete
	public int actSchoolDelete(ActSchool actSchool){
		return actSchoolDao.actSchoolDelete(actSchool);
	}
	
	// actSchoolList
	public List<ActSchool> actSchoolList(ActSchool actSchool){
		return actSchoolDao.actSchoolList(actSchool);
	}
	
	// actSchoolDetail
	public ActSchool actSchoolDetail(ActSchool actSchool){
		return actSchoolDao.actSchoolDetail(actSchool);
	}
}