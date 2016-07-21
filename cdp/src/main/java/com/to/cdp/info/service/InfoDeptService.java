package com.to.cdp.info.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.info.dao.InfoDeptDao;
import com.to.cdp.info.model.InfoDept;

@Service
@Transactional
public class InfoDeptService {
	
	@Autowired
	private InfoDeptDao infoDeptDao;
	
	// infoDeptInsert
	public int infoDeptInsert(InfoDept infoDept){
		String infoDeptCode = null;
		
		int infoDeptCount=0;
		infoDeptCount = infoDeptDao.infoDeptCount()+1;
		infoDeptCode = "info_dept_" + infoDeptCount;
		
		infoDept.setInfoDeptCode(infoDeptCode);
		
		return infoDeptDao.infoDeptInsert(infoDept);
	}
	
	// infoDeptUpdate
	public int infoDeptUpdate(InfoDept infoDept){
		return infoDeptDao.infoDeptUpdate(infoDept);
	}
	
	// infoDeptDelete
	public int infoDeptDelete(InfoDept infoDept){
		return infoDeptDao.infoDeptDelete(infoDept);
	}
	
	// infoDeptList
	public List<InfoDept> infoDeptList(Map<String, Object> map){
		return infoDeptDao.infoDeptList(map);
	}
	
	// infoDeptDetail
	public InfoDept infoDeptDetail(InfoDept infoDept){
		return infoDeptDao.infoDeptDetail(infoDept);
	}
	
	// infoDeptPage
	public int infoDeptCountBySearch(Map<String, Object> map) {
		return infoDeptDao.infoDeptCountBySearch(map);
	}

}