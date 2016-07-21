package com.to.cdp.info.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.info.model.InfoContest;

@Repository
public class InfoContestDao {
	private final String NS="com.to.cdp.repository.CdpMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// InfoContestInsert
	public int infoContestInsert(InfoContest infoContest){
		return sqlSession.insert(NS + ".infoContestInsert", infoContest);
	}
	
	// InfoContestUpdate
	public int infoContestUpdate(InfoContest infoContest){
		return sqlSession.update(NS + ".infoContestUpdate", infoContest);
	}
	
	// InfoContestDelete
	public int infoContestDelete(InfoContest infoContest){
		return sqlSession.delete(NS + ".infoContestDelete", infoContest);
	}
	
	// infoContestCount
	public int infoContestCount(){
		return sqlSession.selectOne(NS + ".infoContestCount");
	}
	
	// infoContestCount
	public int infoContestCountBySearch(Map<String, Object> map){
		return sqlSession.selectOne(NS + ".infoContestCountBySearch", map);
	}
	
	// InfoContestList
	public List<InfoContest> infoContestList(Map<String, Object> map){
		return sqlSession.selectList(NS + ".infoContestList", map);
	}
	
	// InfoContestDetail
	public InfoContest infoContestDetail(InfoContest infoContest){
		return sqlSession.selectOne(NS + ".infoContestDetail", infoContest);
	}
}