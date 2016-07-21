package com.to.cdp.plan.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.plan.model.PlanStudyAb;

@Repository
public class PlanStudyAbDao {
	private final String NS="com.to.cdp.repository.CdpMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// planStudyAbInsert
	public int planStudyAbInsert(PlanStudyAb planStudyAb){
		return sqlSession.insert(NS + ".planStudyAbInsert", planStudyAb);
	}
	
	// planStudyAbUpdate
	public int planStudyAbUpdate(PlanStudyAb planStudyAb){
		return sqlSession.update(NS + ".planStudyAbUpdate", planStudyAb);
	}
	
	// planStudyAbDelete
	public int planStudyAbDelete(PlanStudyAb planStudyAb){
		return sqlSession.delete(NS + ".planStudyAbDelete", planStudyAb);
	}
	
	// planStudyAbList
	public List<PlanStudyAb> planStudyAbList(PlanStudyAb planStudyAb){
		return sqlSession.selectList(NS + ".planStudyAbList", planStudyAb);
	}
	
	// planStudyAbDetail
	public PlanStudyAb planStudyAbDetail(PlanStudyAb planStudyAb){
		return sqlSession.selectOne(NS + ".planStudyAbDetail", planStudyAb);
	}
}