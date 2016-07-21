package com.to.cdp.act.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.act.model.ActCert;

@Repository
public class ActCertDao {
	private final String NS="com.to.cdp.repository.CdpMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// actCertInsert
	public int actCertInsert(ActCert actCert){
		return sqlSession.insert(NS + ".actCertInsert", actCert);
	}
	
	// actCertUpdate
	public int actCertUpdate(ActCert actCert){
		return sqlSession.update(NS + ".actCertUpdate", actCert);
	}
	
	// actCertDelete
	public int actCertDelete(ActCert actCert){
		return sqlSession.delete(NS + ".actCertDelete", actCert);
	}
	
	// actCertList
	public List<ActCert> actCertList(ActCert actCert){
		return sqlSession.selectList(NS + ".actCertList", actCert);
	}
	
	// actCertDetail
	public ActCert actCertDetail(ActCert actCert){
		return sqlSession.selectOne(NS + ".actCertDetail", actCert);
	}
}