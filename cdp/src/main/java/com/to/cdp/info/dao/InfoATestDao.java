package com.to.cdp.info.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.info.model.InfoATest;

@Repository
public class InfoATestDao {
	private final String NS="com.to.cdp.repository.CdpMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// InfoATestInsert
	public int infoATestInsert(InfoATest infoATest){
		return sqlSession.insert(NS + ".InfoATestInsert", infoATest);
	}
	
	// InfoATestUpdate
	public int infoATestUpdate(InfoATest infoATest){
		return sqlSession.update(NS + ".InfoATestUpdate", infoATest);
	}
	
	// InfoATestDelete
	public int infoATestDelete(InfoATest infoATest){
		return sqlSession.delete(NS + ".InfoATestDelete", infoATest);
	}
	
	// InfoATestList
	public List<InfoATest> infoATestList(InfoATest infoATest){
		return sqlSession.selectList(NS + ".InfoATestList", infoATest);
	}
	
	// InfoATestDetail
	public InfoATest infoATestDetail(InfoATest infoATest){
		return sqlSession.selectOne(NS + ".InfoATestDetail", infoATest);
	}
}