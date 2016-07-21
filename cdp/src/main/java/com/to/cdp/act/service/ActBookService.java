package com.to.cdp.act.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.act.dao.ActBookDao;
import com.to.cdp.act.model.ActBook;

@Service
@Transactional
public class ActBookService {
	
	@Autowired
	private ActBookDao actBookDao;
	
	// actBookInsert
	public int actBookInsert(ActBook actBook){
		return actBookDao.actBookInsert(actBook);
	}
	
	// actBookUpdate
	public int actBookUpdate(ActBook actBook){
		return actBookDao.actBookUpdate(actBook);
	}
	
	// actBookDelete
	public int actBookDelete(ActBook actBook){
		return actBookDao.actBookDelete(actBook);
	}
	
	// actBookList
	public List<ActBook> actBookList(ActBook actBook){
		return actBookDao.actBookList(actBook);
	}
	
	// actBookDetail
	public ActBook actBookDetail(ActBook actBook){
		return actBookDao.actBookDetail(actBook);
	}
}