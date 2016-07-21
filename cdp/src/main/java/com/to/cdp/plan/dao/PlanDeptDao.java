package com.to.cdp.plan.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.plan.model.PlanDept;

@Repository
public class PlanDeptDao {
	private final String NS="com.to.cdp.repository.CdpMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// planDeptInsert
	public int planDeptInsert(PlanDept planDept){
		return sqlSession.insert(NS + ".planDeptInsert", planDept);
	}
	
	// planDeptUpdate
	public int planDeptUpdate(PlanDept planDept){
		return sqlSession.update(NS + ".planDeptUpdate", planDept);
	}
	
	// planDeptDelete
	public int planDeptDelete(PlanDept planDept){
		return sqlSession.delete(NS + ".planDeptDelete", planDept);
	}
	
	// planDeptList
	public List<PlanDept> planDeptList(PlanDept planDept){
		return sqlSession.selectList(NS + ".planDeptList", planDept);
	}
	
	// planDeptDetail
	public PlanDept planDeptDetail(PlanDept planDept){
		return sqlSession.selectOne(NS + ".planDeptDetail", planDept);
	}
}