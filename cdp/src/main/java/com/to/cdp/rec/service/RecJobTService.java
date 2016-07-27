package com.to.cdp.rec.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.info.model.InfoJob;
import com.to.cdp.rec.dao.RecJobTDao;
import com.to.cdp.rec.model.RecJobT;



@Service
@Transactional
public class RecJobTService {
	
	@Autowired
	private RecJobTDao recJobTDao;
	
	// recJobTInsert
	public int recJobTInsert(RecJobT recJobT){
		String recJobTCode = null;
		int recJobTCount=0;
		
		recJobTCount = recJobTDao.recJobTCount()+1;
		recJobTCode = "rec_jobt_" + recJobTCount;
		
		recJobT.setRecJobTCode(recJobTCode);
		return recJobTDao.recJobTInsert(recJobT);
	}
	
	// recJobTUpdate
	public int recJobTUpdate(RecJobT recJobT){
		return recJobTDao.recJobTUpdate(recJobT);
	}
	
	// recJobTDelete
	public int recJobTDelete(RecJobT recJobT){
		return recJobTDao.recJobTDelete(recJobT);
	}
	
	// recJobTList
	public List<RecJobT> recJobTList(InfoJob infoJob){
		return recJobTDao.recJobTList(infoJob);
	}
	
	// recJobTDetail
	public RecJobT recJobTDetail(RecJobT recJobT){
		return recJobTDao.recJobTDetail(recJobT);
	}

	// 추천직업훈련 총 개수
	public int infoJobTCountAtRec(Map<String, Object> map) {
		return recJobTDao.infoJobTCountAtRec(map);
	}

	// 추천직업훈련리스트
	public List<Map<String, Object>> recJobTListWithRecJobTCondition(Map<String, Object> map) {
		return recJobTDao.recJobTListWithRecJobTCondition(map);
	}

}