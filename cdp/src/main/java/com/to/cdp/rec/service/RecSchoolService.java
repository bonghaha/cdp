package com.to.cdp.rec.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.rec.dao.RecSchoolDao;
import com.to.cdp.rec.model.RecSchool;

@Service
@Transactional
public class RecSchoolService {
	
	@Autowired
	private RecSchoolDao recSchoolDao;
	
	// recSchoolInsert
	public int recSchoolInsert(RecSchool recSchool){
		return recSchoolDao.recSchoolInsert(recSchool);
	}
	
	// recSchoolUpdate
	public int recSchoolUpdate(RecSchool recSchool){
		return recSchoolDao.recSchoolUpdate(recSchool);
	}
	
	// recSchoolDelete
	public int recSchoolDelete(RecSchool recSchool){
		return recSchoolDao.recSchoolDelete(recSchool);
	}
	
	// recSchoolList
	public List<RecSchool> recSchoolList(RecSchool recSchool){
		return recSchoolDao.recSchoolList(recSchool);
	}
	
	// recSchoolDetail
	public RecSchool recSchoolDetail(RecSchool recSchool){
		return recSchoolDao.recSchoolDetail(recSchool);
	}
}