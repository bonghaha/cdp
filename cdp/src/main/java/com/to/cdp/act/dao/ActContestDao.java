package com.to.cdp.act.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.act.model.ActContest;

@Repository
public class ActContestDao {
	private final String NS="com.to.cdp.repository.CdpMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// actContestInsert
	public int actContestInsert(ActContest actContest){
		return sqlSession.insert(NS + ".actContestInsert", actContest);
	}
	
	// actContestUpdate
	public int actContestUpdate(ActContest actContest){
		return sqlSession.update(NS + ".actContestUpdate", actContest);
	}
	
	// actContestDelete
	public int actContestDelete(ActContest actContest){
		return sqlSession.delete(NS + ".actContestDelete", actContest);
	}
	
	// actContestList
	public List<ActContest> actContestList(ActContest actContest){
		return sqlSession.selectList(NS + ".actContestList", actContest);
	}
	
	// actContestDetail
	public ActContest actContestDetail(ActContest actContest){
		return sqlSession.selectOne(NS + ".actContestDetail", actContest);
	}
}