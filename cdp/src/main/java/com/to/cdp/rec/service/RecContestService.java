package com.to.cdp.rec.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.info.model.InfoJob;
import com.to.cdp.rec.dao.RecContestDao;
import com.to.cdp.rec.model.RecBook;
import com.to.cdp.rec.model.RecContest;

@Service
@Transactional
public class RecContestService {
	
	@Autowired
	private RecContestDao recContestDao;
	
	// recContestInsert
		public int recContestInsert(RecContest recContest){
			String recContestCode = null;
			int recContestCount=0;
			
			recContestCount = recContestDao.recContestCount()+1;
			recContestCode = "rec_contest_" + recContestCount;
			
			recContest.setRecContestCode(recContestCode);
			return recContestDao.recContestInsert(recContest);
		}
		
		// recContestUpdate
		public int recContestUpdate(RecContest recContest){
			return recContestDao.recContestUpdate(recContest);
		}
		
		// recContestDelete
		public int recContestDelete(RecContest recContest){
			return recContestDao.recContestDelete(recContest);
		}
		
		// recContestList
		public List<RecContest> recContestList(InfoJob infoJob){
			return recContestDao.recContestList(infoJob);
		}
		
		// recContestDetail
		public RecContest recContestDetail(RecContest recContest){
			return recContestDao.recContestDetail(recContest);
		}

		// 추천공모전 총 개수
		public int infoContestCountAtRec(Map<String, Object> map) {
			return recContestDao.infoContestCountAtRec(map);
		}

		// 추천공모전리스트
		public List<Map<String, Object>> recContestListWithRecContestCondition(Map<String, Object> map) {
			return recContestDao.recContestListWithRecContestCondition(map);
		}
}