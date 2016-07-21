package com.to.cdp.rec.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.rec.dao.RecDeptDao;
import com.to.cdp.rec.model.RecDept;

@Service
@Transactional
public class RecDeptService {
	
	@Autowired
	private RecDeptDao recDeptDao;
	
	// recDeptInsert
	public int recDeptInsert(RecDept recDept){
		return recDeptDao.recDeptInsert(recDept);
	}
	
	// recDeptUpdate
	public int recDeptUpdate(RecDept recDept){
		return recDeptDao.recDeptUpdate(recDept);
	}
	
	// recDeptDelete
	public int recDeptDelete(RecDept recDept){
		return recDeptDao.recDeptDelete(recDept);
	}
	
	// recDeptList
	public List<RecDept> recDeptList(RecDept recDept){
		return recDeptDao.recDeptList(recDept);
	}
	
	// recDeptDetail
	public RecDept recDeptDetail(RecDept recDept){
		return recDeptDao.recDeptDetail(recDept);
	}
}