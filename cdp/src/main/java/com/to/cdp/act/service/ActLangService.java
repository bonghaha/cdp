package com.to.cdp.act.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.act.dao.ActLangDao;
import com.to.cdp.act.model.ActLang;

@Service
@Transactional
public class ActLangService {
	
	@Autowired
	private ActLangDao actLangDao;
	
	// actLangInsert
	public int actLangInsert(ActLang actLang){
		return actLangDao.actLangInsert(actLang);
	}
	
	// actLangUpdate
	public int actLangUpdate(ActLang actLang){
		return actLangDao.actLangUpdate(actLang);
	}
	
	// actLangDelete
	public int actLangDelete(ActLang actLang){
		return actLangDao.actLangDelete(actLang);
	}
	
	// actLangList
	public List<ActLang> actLangList(ActLang actLang){
		return actLangDao.actLangList(actLang);
	}
	
	// actLangDetail
	public ActLang actLangDetail(ActLang actLang){
		return actLangDao.actLangDetail(actLang);
	}
}