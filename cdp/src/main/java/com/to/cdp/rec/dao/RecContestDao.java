package com.to.cdp.rec.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.rec.model.RecContest;



@Repository
public class RecContestDao {
	private final String NS="com.to.cdp.repository.CdpMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// recContestInsert
	public int recContestInsert(RecContest recContest){
		return sqlSession.insert(NS + ".recContestInsert", recContest);
	}
	
	// recContestUpdate
	public int recContestUpdate(RecContest recContest){
		return sqlSession.update(NS + ".recContestUpdate", recContest);
	}
	
	// recContestDelete
	public int recContestDelete(RecContest recContest){
		return sqlSession.delete(NS + ".recContestDelete", recContest);
	}
	
	// recContestList
	public List<RecContest> recContestList(RecContest recContest){
		return sqlSession.selectList(NS + ".recContestList", recContest);
	}
	
	// recContestDetail
	public RecContest recContestDetail(RecContest recContest){
		return sqlSession.selectOne(NS + ".recContestDetail", recContest);
	}
}