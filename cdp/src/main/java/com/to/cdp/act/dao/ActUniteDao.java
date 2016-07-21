package com.to.cdp.act.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.act.model.ActUnite;

@Repository
public class ActUniteDao {
	private final String NS="com.to.cdp.repository.CdpMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// actUniteInsert
	public int actUniteInsert(ActUnite actUnite){
		return sqlSession.insert(NS + ".actUniteInsert", actUnite);
	}
	
	// actUniteUpdate
	public int actUniteUpdate(ActUnite actUnite){
		return sqlSession.update(NS + ".actUniteUpdate", actUnite);
	}
	
	// actUniteDelete
	public int actUniteDelete(ActUnite actUnite){
		return sqlSession.delete(NS + ".actUniteDelete", actUnite);
	}
	
	// actUniteList
	public List<ActUnite> actUniteList(ActUnite actUnite){
		return sqlSession.selectList(NS + ".actUniteList", actUnite);
	}
	
	// actUniteDetail
	public ActUnite actUniteDetail(ActUnite actUnite){
		return sqlSession.selectOne(NS + ".actUniteDetail", actUnite);
	}
}