package com.to.cdp.rec.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.rec.dao.RecStudyAbDao;
import com.to.cdp.rec.model.RecStudyAb;

@Service
@Transactional
public class RecStudyAbService {
	
	@Autowired
	private RecStudyAbDao recStudyAbDao;
	
	// recSchoolDetail
	public int recStudyAbInsert(RecStudyAb recStudyAb){
		return recStudyAbDao.recStudyAbInsert(recStudyAb);
	}
	
	// recStudyAbUpdate
	public int recStudyAbUpdate(RecStudyAb recStudyAb){
		return recStudyAbDao.recStudyAbUpdate(recStudyAb);
	}
	
	// recStudyAbDelete
	public int recStudyAbDelete(RecStudyAb recStudyAb){
		return recStudyAbDao.recStudyAbDelete(recStudyAb);
	}
	
	// recStudyAbList
	public List<RecStudyAb> recStudyAbList(RecStudyAb recStudyAb){
		return recStudyAbDao.recStudyAbList(recStudyAb);
	}
	
	// recStudyAbDetail
	public RecStudyAb recStudyAbDetail(RecStudyAb recStudyAb){
		return recStudyAbDao.recStudyAbDetail(recStudyAb);
	}
}
