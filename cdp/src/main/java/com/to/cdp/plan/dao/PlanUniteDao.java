package com.to.cdp.plan.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.plan.model.PlanUnite;

@Repository
public class PlanUniteDao {
	private final String NS="com.to.cdp.repository.CdpMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// planUniteInsert
	public int planUniteInsert(PlanUnite planUnite){
		return sqlSession.insert(NS + ".planUniteInsert", planUnite);
	}
	
	// planUniteUpdate
	public int planUniteUpdate(PlanUnite planUnite){
		return sqlSession.update(NS + ".planUniteUpdate", planUnite);
	}
	
	// planUniteDelete
	public int planUniteDelete(PlanUnite planUnite){
		return sqlSession.delete(NS + ".planUniteDelete", planUnite);
	}
	
	// planUniteList
	public List<PlanUnite> planUniteList(PlanUnite planUnite){
		return sqlSession.selectList(NS + ".planUniteList", planUnite);
	}
	
	// planUniteDetail
	public PlanUnite planUniteDetail(PlanUnite planUnite){
		return sqlSession.selectOne(NS + ".planUniteDetail", planUnite);
	}
}