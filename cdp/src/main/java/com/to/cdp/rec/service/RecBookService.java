package com.to.cdp.rec.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.info.model.InfoJob;
import com.to.cdp.rec.dao.RecBookDao;
import com.to.cdp.rec.model.RecBook;


@Service
@Transactional
public class RecBookService {
	
	@Autowired
	private RecBookDao recBookDao;
	
	// recBookInsert
	public int recBookInsert(RecBook recBook){
		String recBookCode = null;
		int recBookCount=0;
		
		recBookCount = recBookDao.recBookCount()+1;
		recBookCode = "rec_book_" + recBookCount;
		
		recBook.setRecBookCode(recBookCode);
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
	public List<RecBook> recBookList(InfoJob infoJob){
		return recBookDao.recBookList(infoJob);
	}
	
	// recBookDetail
	public RecBook recBookDetail(RecBook recBook){
		return recBookDao.recBookDetail(recBook);
	}

	public int infoBookCountAtRec(Map<String, Object> map) {
		return recBookDao.infoBookCountAtRec(map);
	}

	public List<RecBook> recBookSelectInfoBookCodeByInfoJob(InfoJob infoJob) {
		return recBookDao.recBookSelectInfoBookCodeByInfoJob(infoJob);
	}
	
	public List<Map<String, Object>> recBookListWithRecBookCondition(Map<String, Object> map) {
		return recBookDao.recBookListWithRecBookCondition(map);
	}

	public InfoJob selectInfoJobCodeByInfoJobUnitName(InfoJob infoJob) {
		return recBookDao.selectInfoJobCodeByInfoJobUnitName(infoJob);
	}

	public List<RecBook> recBookListByInfoJobCode(InfoJob infoJob) {
		return recBookDao.recBookListByInfoJobCode(infoJob);
	}

	public List<Map<String, Object>> recBookListWithDetail(List<RecBook> recBookList) {
		return recBookDao.recBookListWithDetail(recBookList);
	}


}