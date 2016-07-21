package com.to.cdp.rec.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.rec.dao.RecBookDao;
import com.to.cdp.rec.model.RecBook;


@Service
@Transactional
public class RecBookService {
	
	@Autowired
	private RecBookDao recBookDao;
	
	// recBookInsert
	public int recBookInsert(RecBook recBook){
		return recBookDao.recBookInsert(recBook);
	}
	
	// recBookUpdate
	public int recBookUpdate(RecBook recBook){
		return recBookDao.recBookUpdate(recBook);
	}
	
	// recBookDelete
	public int recBookDelete(RecBook recBook){
		return recBookDao.recBookDelete(recBook);
	}
	
	// recBookList
	public List<RecBook> recBookList(RecBook recBook){
		return recBookDao.recBookList(recBook);
	}
	
	// recBookDetail
	public RecBook recBookDetail(RecBook recBook){
		return recBookDao.recBookDetail(recBook);
	}
}