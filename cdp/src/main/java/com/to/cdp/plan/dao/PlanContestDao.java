package com.to.cdp.plan.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.plan.model.PlanContest;

@Repository
public class PlanContestDao {
	private final String NS="com.to.cdp.repository.CdpMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// planContestInsert
	public int planContestInsert(PlanContest planContest){
		return sqlSession.insert(NS + ".planContestInsert", planContest);
	}
	
	// planContestUpdate
	public int planContestUpdate(PlanContest planContest){
		return sqlSession.update(NS + ".planContestUpdate", planContest);
	}
	
	// planContestDelete
	public int planContestDelete(PlanContest planContest){
		return sqlSession.delete(NS + ".planContestDelete", planContest);
	}
	
	// planContestList
	public List<PlanContest> planContestList(PlanContest planContest){
		return sqlSession.selectList(NS + ".planContestList", planContest);
	}
	
	// planContestDetail
	public PlanContest planContestDetail(PlanContest planContest){
		return sqlSession.selectOne(NS + ".planContestDetail", planContest);
	}
}