package com.to.cdp.rec.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.info.model.InfoJob;
import com.to.cdp.plan.model.PlanUnite;
import com.to.cdp.rec.model.RecCert;
import com.to.cdp.rec.model.RecWithInfoCert;




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
	
	// ��õ�ڰ��� �� ����
	public int infoCertCountAtRec(Map<String, Object> map) {
		return sqlSession.selectOne(NS + ".infoCertCountAtRec", map);
	}

	// ��õ�ڰ����ڵ��ȣ ���� ���� count
	public int recCertCount() {
		return sqlSession.selectOne(NS + ".recCertCount");
	}
	
	// ��õ�ڰ�������Ʈ
	public List<RecCert> recCertListWithRecCertCondition(Map<String, Object> map) {
		return sqlSession.selectList(NS + ".recCertListWithRecCertCondition", map);
	}

	public List<RecWithInfoCert> recCertListByAjax(PlanUnite planUnite) {
		return sqlSession.selectList(NS + ".recCertListByAjax", planUnite);
	}
	// 추천자격증 마지막코드값 가져오기
	public String recCertLastKey() {
		return sqlSession.selectOne(NS + ".recCertLastKey");
	}

	public RecCert recCertReason(RecCert recCert) {
		return sqlSession.selectOne(NS + ".recCertReason", recCert);
	}

}