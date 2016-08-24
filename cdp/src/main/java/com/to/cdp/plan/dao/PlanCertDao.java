package com.to.cdp.plan.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.plan.model.PlanCert;
import com.to.cdp.plan.model.PlanUnite;
import com.to.cdp.rec.model.RecCert;

@Repository
public class PlanCertDao {
	private final String NS="com.to.cdp.repository.PlanMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// planCertInsert
	public int planCertInsert(PlanCert planCert){
		return sqlSession.insert(NS + ".planCertInsert", planCert);
	}
	
	// planCertUpdate
	public int planCertUpdate(PlanCert planCert){
		return sqlSession.update(NS + ".planCertUpdate", planCert);
	}
	
	// planCertDelete
	public int planCertDelete(PlanCert planCert){
		return sqlSession.delete(NS + ".planCertDelete", planCert);
	}
	
	// planCertList
	public List<PlanCert> planCertList(PlanCert planCert){
		return sqlSession.selectList(NS + ".planCertList", planCert);
	}
	
	// planCertDetail
	public PlanCert planCertDetail(PlanCert planCert){
		return sqlSession.selectOne(NS + ".planCertDetail", planCert);
	}

	public int planCertCount() {
		return sqlSession.selectOne(NS + ".planCertCount");
	}
	
	public List<PlanCert> planCertList(PlanUnite planUnite){
		return sqlSession.selectList(NS + ".planCertList", planUnite);
	}

	public String planCertLastKey() {
		return sqlSession.selectOne(NS + ".planCertLastKey");
	}

	public RecCert selectCertjmFldNm(RecCert recCert) {
		return sqlSession.selectOne(NS + ".selectCertjmFldNm", recCert);
	}
}