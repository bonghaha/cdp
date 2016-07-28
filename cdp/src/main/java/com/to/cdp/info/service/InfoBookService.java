package com.to.cdp.info.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.info.dao.InfoBookDao;
import com.to.cdp.info.model.InfoBook;

@Service
@Transactional
public class InfoBookService {
	
	@Autowired
	private InfoBookDao infoBookDao;
	
	// infoBookInsert
	public int infoBookInsert(InfoBook infoBook){
		String infoBookCode = null;
		int infoBookCount=0;
		infoBookCount = infoBookDao.infoBookCount()+1;
		infoBookCode = "info_book_" + infoBookCount;
		
		infoBook.setInfoBookCode(infoBookCode);
		return infoBookDao.infoBookInsert(infoBook);
	}
	
	// infoBookUpdate
	public int infoBookUpdate(InfoBook infoBook){
		return infoBookDao.infoBookUpdate(infoBook);
	}
	
	// infoBookDelete
	public int infoBookDelete(InfoBook infoBook){
		return infoBookDao.infoBookDelete(infoBook);
	}
	
	// infoBookList
	public List<InfoBook> infoBookList(Map<String, Object> map){
		return infoBookDao.infoBookList(map);
	}
	
	// infoBookDetail
	public InfoBook infoBookDetail(InfoBook infoBook){
		return infoBookDao.infoBookDetail(infoBook);
	}
	
	// infoBookPage
	public int infoBookCountBySearch(Map<String, Object> map) {
		System.out.println("InfoBookService infoBookCountBySearch ½ÇÇà");
		return infoBookDao.infoBookCountBySearch(map);
	}

}