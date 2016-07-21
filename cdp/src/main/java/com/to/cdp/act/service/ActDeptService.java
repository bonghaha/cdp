package com.to.cdp.act.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.act.dao.ActDeptDao;
import com.to.cdp.act.model.ActDept;

@Service
@Transactional
public class ActDeptService {
	
	@Autowired
	private ActDeptDao actDeptDao;
	
	// actDeptInsert
	public int actDeptInsert(ActDept actDept){
		return actDeptDao.actDeptInsert(actDept);
	}
	
	// actDeptUpdate
	public int actDeptUpdate(ActDept actDept){
		return actDeptDao.actDeptUpdate(actDept);
	}
	
	// actDeptDelete
	public int actDeptDelete(ActDept actDept){
		return actDeptDao.actDeptDelete(actDept);
	}
	
	// actDeptList
	public List<ActDept> actDeptList(ActDept actDept){
		return actDeptDao.actDeptList(actDept);
	}
	
	// actDeptDetail
	public ActDept actDeptDetail(ActDept actDept){
		return actDeptDao.actDeptDetail(actDept);
	}
}