package com.to.cdp.rec.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.rec.model.RecCert;



@Repository
public class RecCertDao {
	private final String NS="com.to.cdp.repository.CdpMapper";
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
	public List<RecCert> recCertList(RecCert recCert){
		return sqlSession.selectList(NS + ".recCertList", recCert);
	}
	
	// recCertDetail
	public RecCert recCertDetail(RecCert recCert){
		return sqlSession.selectOne(NS + ".recCertDetail", recCert);
	}
}