package com.to.cdp.info.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.info.model.InfoCert;

@Repository
public class InfoCertDao {
	private final String NS="com.to.cdp.repository.CdpMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// InfoCertInsert
	public int infoCertInsert(InfoCert infoCert){
		return sqlSession.insert(NS + ".infoCertInsert", infoCert);
	}
	
	// InfoCertUpdate
	public int infoCertUpdate(InfoCert infoCert){
		return sqlSession.update(NS + ".infoCertUpdate", infoCert);
	}
	
	// InfoCertDelete
	public int infoCertDelete(InfoCert infoCert){
		return sqlSession.delete(NS + ".infoCertDelete", infoCert);
	}
	// infoCertCount
	public int infoCertCount(){
		return sqlSession.selectOne(NS + ".infoCertCount");
	}
		
	// infoCertCount
	public int infoCertCountBySearch(Map<String, Object> map){
		return sqlSession.selectOne(NS + ".infoCertCountBySearch", map);
	}
	
	// InfoCertList
	public List<InfoCert> infoCertList(Map<String, Object> map){
		return sqlSession.selectList(NS + ".infoCertList", map);
	}
	
	// InfoCertDetail
	public InfoCert infoCertDetail(InfoCert infoCert){
		return sqlSession.selectOne(NS + ".infoCertDetail", infoCert);
	}
}