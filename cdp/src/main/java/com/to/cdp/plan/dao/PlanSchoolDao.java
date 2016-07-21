package com.to.cdp.plan.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.plan.model.PlanSchool;

@Repository
public class PlanSchoolDao {
	private final String NS="com.to.cdp.repository.CdpMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// planSchoolInsert
	public int planSchoolInsert(PlanSchool planSchool){
		return sqlSession.insert(NS + ".planSchoolInsert", planSchool);
	}
	
	// planSchoolUpdate
	public int planSchoolUpdate(PlanSchool planSchool){
		return sqlSession.update(NS + ".planSchoolUpdate", planSchool);
	}
	
	// planSchoolDelete
	public int planSchoolDelete(PlanSchool planSchool){
		return sqlSession.delete(NS + ".planSchoolDelete", planSchool);
	}
	
	// planSchoolList
	public List<PlanSchool> planSchoolList(PlanSchool planSchool){
		return sqlSession.selectList(NS + ".planSchoolList", planSchool);
	}
	
	// planSchoolDetail
	public PlanSchool planSchoolDetail(PlanSchool planSchool){
		return sqlSession.selectOne(NS + ".planSchoolDetail", planSchool);
	}
}