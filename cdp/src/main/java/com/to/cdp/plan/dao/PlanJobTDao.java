package com.to.cdp.plan.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.plan.model.PlanJobT;

@Repository
public class PlanJobTDao {
	private final String NS="com.to.cdp.repository.CdpMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// planJobTInsert
	public int planJobTInsert(PlanJobT planJobT){
		return sqlSession.insert(NS + ".planJobTInsert", planJobT);
	}
	
	// planJobTUpdate
	public int planJobTUpdate(PlanJobT planJobT){
		return sqlSession.update(NS + ".planJobTUpdate", planJobT);
	}
	
	// planJobTDelete
	public int planJobTDelete(PlanJobT planJobT){
		return sqlSession.delete(NS + ".planJobTDelete", planJobT);
	}
	
	// planJobTList
	public List<PlanJobT> planJobTList(PlanJobT planJobT){
		return sqlSession.selectList(NS + ".planJobTList", planJobT);
	}
	
	// planJobTDetail
	public PlanJobT planJobTDetail(PlanJobT planJobT){
		return sqlSession.selectOne(NS + ".planJobTDetail", planJobT);
	}
}