package com.to.cdp.plan.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.plan.model.PlanMento;

@Repository
public class PlanMentoDao {
	private final String NS="com.to.cdp.repository.CdpMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// planMentoInsert
	public int planMentoInsert(PlanMento planMento){
		return sqlSession.insert(NS + ".planMentoInsert", planMento);
	}
	
	// planMentoUpdate
	public int planMentoUpdate(PlanMento planMento){
		return sqlSession.update(NS + ".planMentoUpdate", planMento);
	}
	
	// planMentoDelete
	public int planMentoDelete(PlanMento planMento){
		return sqlSession.delete(NS + ".planMentoDelete", planMento);
	}
	
	// planMentoList
	public List<PlanMento> planMentoList(PlanMento planMento){
		return sqlSession.selectList(NS + ".planMentoList", planMento);
	}
	
	// planMentoDetail
	public PlanMento planMentoDetail(PlanMento planMento){
		return sqlSession.selectOne(NS + ".planMentoDetail", planMento);
	}
}