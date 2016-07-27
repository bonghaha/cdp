package com.to.cdp.rec.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.info.model.InfoJob;
import com.to.cdp.rec.model.RecVolun;




@Repository
public class RecVolunDao {
	private final String NS="com.to.cdp.repository.RecMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// recVolunInsert
	public int recVolunInsert(RecVolun recVolun){
		return sqlSession.insert(NS + ".recVolunInsert", recVolun);
	}
	
	// recVolunUpdate
	public int recVolunUpdate(RecVolun recVolun){
		return sqlSession.update(NS + ".recVolunUpdate", recVolun);
	}
	
	// recVolunDelete
	public int recVolunDelete(RecVolun recVolun){
		return sqlSession.delete(NS + ".recVolunDelete", recVolun);
	}
	
	// recVolunList
	public List<RecVolun> recVolunList(InfoJob infoJob){
		return sqlSession.selectList(NS + ".recVolunList", infoJob);
	}
	
	// recVolunDetail
	public RecVolun recVolunDetail(RecVolun recVolun){
		return sqlSession.selectOne(NS + ".recVolunDetail", recVolun);
	}
	
	// 추천봉사활동 총 개수
	public int infoVolunCountAtRec(Map<String, Object> map) {
		return sqlSession.selectOne(NS + ".infoVolunCountAtRec", map);
	}

	// 추천봉사활동코드번호 증가 위한 count
	public int recVolunCount() {
		return sqlSession.selectOne(NS + ".recVolunCount");
	}
	
	// 추천봉사활동리스트
	public List<Map<String, Object>> recVolunListWithRecVolunCondition(Map<String, Object> map) {
		return sqlSession.selectList(NS + ".recVolunListWithRecVolunCondition", map);
	}

}