package com.to.cdp.plan.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.plan.model.PlanVolun;

@Repository
public class PlanVolunDao {
	private final String NS="com.to.cdp.repository.CdpMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// planVolunInsert
	public int planVolunInsert(PlanVolun planVolun){
		return sqlSession.insert(NS + ".planVolunInsert", planVolun);
	}
	
	// planVolunUpdate
	public int planVolunUpdate(PlanVolun planVolun){
		return sqlSession.update(NS + ".planVolunUpdate", planVolun);
	}
	
	// planVolunDelete
	public int planVolunDelete(PlanVolun planVolun){
		return sqlSession.delete(NS + ".planVolunDelete", planVolun);
	}
	
	// planVolunList
	public List<PlanVolun> planVolunList(PlanVolun planVolun){
		return sqlSession.selectList(NS + ".planVolunList", planVolun);
	}
	
	// planVolunDetail
	public PlanVolun planVolunDetail(PlanVolun planVolun){
		return sqlSession.selectOne(NS + ".planVolunDetail", planVolun);
	}
}