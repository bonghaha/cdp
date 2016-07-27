package com.to.cdp.plan.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.plan.dao.PlanBookDao;
import com.to.cdp.plan.model.PlanBook;

@Service
@Transactional
public class PlanBookService {
	
	@Autowired
	private PlanBookDao planBookDao;
	
	// planBookInsert
	public int planBookInsert(Map<String, Object> map){
		return planBookDao.planBookInsert(map);
	}
	
	// planBookUpdate
	public int planBookUpdate(PlanBook planBook){
		return planBookDao.planBookUpdate(planBook);
	}
	
	// planBookDelete
	public int planBookDelete(PlanBook planBook){
		return planBookDao.planBookDelete(planBook);
	}
	
	// planBookList
	public List<PlanBook> planBookList(PlanBook planBook){
		return planBookDao.planBookList(planBook);
	}
	
	// planBookDetail
	public PlanBook planBookDetail(PlanBook planBook){
		return planBookDao.planBookDetail(planBook);
	}
}
