package com.to.cdp.rec.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.info.model.InfoJob;
import com.to.cdp.rec.model.RecCert;




@Repository
public class RecCertDao {
	private final String NS="com.to.cdp.repository.RecMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// recCertInsert
	public int recCertInsert(RecCert recCert){
		return sqlSession.insert(NS + ".recCertInsert", recCert);
	}
	
	// recCertUpdate
	public int recCertUpdate(RecCert recCert){
		return sqlSession.update(NS + ".recCertUpdate", recCert);
	}
	
	// recCertDelete
	public int recCertDelete(RecCert recCert){
		return sqlSession.delete(NS + ".recCertDelete", recCert);
	}
	
	// recCertList
	public List<RecCert> recCertList(InfoJob infoJob){
		return sqlSession.selectList(NS + ".recCertList", infoJob);
	}
	
	// recCertDetail
	public RecCert recCertDetail(RecCert recCert){
		return sqlSession.selectOne(NS + ".recCertDetail", recCert);
	}
	
	// 추천자격증 총 개수
	public int infoCertCountAtRec(Map<String, Object> map) {
		return sqlSession.selectOne(NS + ".infoCertCountAtRec", map);
	}

	// 추천자격증코드번호 증가 위한 count
	public int recCertCount() {
		return sqlSession.selectOne(NS + ".recCertCount");
	}
	
	// 추천자격증리스트
	public List<Map<String, Object>> recCertListWithRecCertCondition(Map<String, Object> map) {
		return sqlSession.selectList(NS + ".recCertListWithRecCertCondition", map);
	}

}