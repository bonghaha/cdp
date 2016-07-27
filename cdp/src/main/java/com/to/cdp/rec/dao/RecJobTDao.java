package com.to.cdp.rec.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.info.model.InfoJob;
import com.to.cdp.rec.model.RecJobT;




@Repository
public class RecJobTDao {
	private final String NS="com.to.cdp.repository.RecMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// recJobTInsert
	public int recJobTInsert(RecJobT recJobT){
		return sqlSession.insert(NS + ".recJobTInsert", recJobT);
	}
	
	// recJobTUpdate
	public int recJobTUpdate(RecJobT recJobT){
		return sqlSession.update(NS + ".recJobTUpdate", recJobT);
	}
	
	// recJobTDelete
	public int recJobTDelete(RecJobT recJobT){
		return sqlSession.delete(NS + ".recJobTDelete", recJobT);
	}
	
	// recJobTList
	public List<RecJobT> recJobTList(InfoJob infoJob){
		return sqlSession.selectList(NS + ".recJobTList", infoJob);
	}
	
	// recJobTDetail
	public RecJobT recJobTDetail(RecJobT recJobT){
		return sqlSession.selectOne(NS + ".recJobTDetail", recJobT);
	}
	
	// 추천직업훈련 총 개수
	public int infoJobTCountAtRec(Map<String, Object> map) {
		return sqlSession.selectOne(NS + ".infoJobTCountAtRec", map);
	}

	// 추천직업훈련코드번호 증가 위한 count
	public int recJobTCount() {
		return sqlSession.selectOne(NS + ".recJobTCount");
	}
	
	// 추천직업훈련리스트
	public List<Map<String, Object>> recJobTListWithRecJobTCondition(Map<String, Object> map) {
		return sqlSession.selectList(NS + ".recJobTListWithRecJobTCondition", map);
	}

}