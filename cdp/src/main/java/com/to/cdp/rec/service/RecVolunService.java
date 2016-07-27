package com.to.cdp.rec.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.info.model.InfoJob;
import com.to.cdp.rec.dao.RecVolunDao;
import com.to.cdp.rec.model.RecVolun;



@Service
@Transactional
public class RecVolunService {
	
	@Autowired
	private RecVolunDao recVolunDao;
	
	// recVolunInsert
	public int recVolunInsert(RecVolun recVolun){
		String recVolunCode = null;
		int recVolunCount=0;
		
		recVolunCount = recVolunDao.recVolunCount()+1;
		recVolunCode = "rec_Volun_" + recVolunCount;
		
		recVolun.setRecVolunCode(recVolunCode);
		return recVolunDao.recVolunInsert(recVolun);
	}
	
	// recVolunUpdate
	public int recVolunUpdate(RecVolun recVolun){
		return recVolunDao.recVolunUpdate(recVolun);
	}
	
	// recVolunDelete
	public int recVolunDelete(RecVolun recVolun){
		return recVolunDao.recVolunDelete(recVolun);
	}
	
	// recVolunList
	public List<RecVolun> recVolunList(InfoJob infoJob){
		return recVolunDao.recVolunList(infoJob);
	}
	
	// recVolunDetail
	public RecVolun recVolunDetail(RecVolun recVolun){
		return recVolunDao.recVolunDetail(recVolun);
	}

	// ��õ����Ȱ�� �� ����
	public int infoVolunCountAtRec(Map<String, Object> map) {
		return recVolunDao.infoVolunCountAtRec(map);
	}

	// ��õ����Ȱ������Ʈ
	public List<Map<String, Object>> recVolunListWithRecVolunCondition(Map<String, Object> map) {
		return recVolunDao.recVolunListWithRecVolunCondition(map);
	}

}