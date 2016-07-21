package com.to.cdp.rec.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.rec.dao.RecLangDao;
import com.to.cdp.rec.model.RecLang;

@Service
@Transactional
public class RecLangService {
	
	@Autowired
	private RecLangDao recLangDao;
	
	// recLangInsert
	public int recLangInsert(RecLang recLang){
		return recLangDao.recLangInsert(recLang);
	}
	
	// recLangUpdate
	public int recLangUpdate(RecLang recLang){
		return recLangDao.recLangUpdate(recLang);
	}
	
	// recLangDelete
	public int recLangDelete(RecLang recLang){
		return recLangDao.recLangDelete(recLang);
	}
	
	// recLangList
	public List<RecLang> recLangList(RecLang recLang){
		return recLangDao.recLangList(recLang);
	}
	
	// recLangDetail
	public RecLang recLangDetail(RecLang recLang){
		return recLangDao.recLangDetail(recLang);
	}
}
