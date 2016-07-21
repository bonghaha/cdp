package com.to.cdp.act.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.act.model.ActJobT;

@Repository
public class ActJobTDao {
	private final String NS="com.to.cdp.repository.CdpMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// actJobTInsert
	public int actJobTInsert(ActJobT actJobT){
		return sqlSession.insert(NS + ".actJobTInsert", actJobT);
	}
	
	// actJobTUpdate
	public int actJobTUpdate(ActJobT actJobT){
		return sqlSession.update(NS + ".actJobTUpdate", actJobT);
	}
	
	// actJobTDelete
	public int actJobTDelete(ActJobT actJobT){
		return sqlSession.delete(NS + ".actJobTDelete", actJobT);
	}
	
	// actJobTList
	public List<ActJobT> actJobTList(ActJobT actJobT){
		return sqlSession.selectList(NS + ".actJobTList", actJobT);
	}
	
	// actJobTDetail
	public ActJobT actJobTDetail(ActJobT actJobT){
		return sqlSession.selectOne(NS + ".actJobTDetail", actJobT);
	}
}