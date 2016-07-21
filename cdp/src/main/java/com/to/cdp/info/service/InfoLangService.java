package com.to.cdp.info.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.PageHelper;
import com.to.cdp.info.dao.InfoLangDao;
import com.to.cdp.info.model.InfoLang;

@Service
@Transactional
public class InfoLangService {
	
	@Autowired
	private InfoLangDao infoLangDao;
	
	// infoLangInsert
	public int infoLangInsert(InfoLang infoLang){
		String infoLangCode = null;
		int infoLangCount = 0;
		infoLangCount = infoLangDao.infoLangCount()+1;
		infoLangCode = "info_lang_" + infoLangCount;
		
		infoLang.setInfoLangCode(infoLangCode);
		return infoLangDao.infoLangInsert(infoLang);
	}
	
	// infoLangUpdate
	public int infoLangUpdate(InfoLang infoLang){
		return infoLangDao.infoLangUpdate(infoLang);
	}
	
	// infoLangDelete
	public int infoLangDelete(InfoLang infoLang){
		return infoLangDao.infoLangDelete(infoLang);
	}
	
	// infoLangList
	public List<InfoLang> infoLangList(Map<String, Object> map){
		return infoLangDao.infoLangList(map);
	}
	
	// infoLangDetail
	public InfoLang infoLangDetail(InfoLang infoLang){
		return infoLangDao.infoLangDetail(infoLang);
	}

	public int infoLangCountBySearch(Map<String, Object> map) {
		return infoLangDao.infoLangCountBySearch(map);
	}

	public PageHelper pageSet(int totalCount, int linePerPage, int clickPage) {
		return null;
	}
}