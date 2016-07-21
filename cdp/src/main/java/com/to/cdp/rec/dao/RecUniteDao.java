package com.to.cdp.rec.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.rec.model.RecUnite;



@Repository
public class RecUniteDao {
	private final String NS="com.to.cdp.repository.CdpMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// recUniteInsert
	public int recUniteInsert(RecUnite recUnite){
		return sqlSession.insert(NS + ".recUniteInsert", recUnite);
	}
	
	// recUniteUpdate
	public int recUniteUpdate(RecUnite recUnite){
		return sqlSession.update(NS + ".recUniteUpdate", recUnite);
	}
	
	// recUniteDelete
	public int recUniteDelete(RecUnite recUnite){
		return sqlSession.delete(NS + ".recUniteDelete", recUnite);
	}
	
	// recUniteList
	public List<RecUnite> recUniteList(RecUnite recUnite){
		return sqlSession.selectList(NS + ".recUniteList", recUnite);
	}
	
	// recUniteDetail
	public RecUnite recUniteDetail(RecUnite recUnite){
		return sqlSession.selectOne(NS + ".recUniteDetail", recUnite);
	}
}