package com.to.cdp.act.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.act.model.ActStudyAb;

@Repository
public class ActStudyAbDao {
	private final String NS="com.to.cdp.repository.CdpMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// actStudyAbInsert
	public int actStudyAbInsert(ActStudyAb actStudyAb){
		return sqlSession.insert(NS + ".actStudyAbInsert", actStudyAb);
	}
	
	// actStudyAbUpdate
	public int actStudyAbUpdate(ActStudyAb actStudyAb){
		return sqlSession.update(NS + ".actStudyAbUpdate", actStudyAb);
	}
	
	// actStudyAbDelete
	public int actStudyAbDelete(ActStudyAb actStudyAb){
		return sqlSession.delete(NS + ".actStudyAbDelete", actStudyAb);
	}
	
	// actStudyAbList
	public List<ActStudyAb> actStudyAbList(ActStudyAb actStudyAb){
		return sqlSession.selectList(NS + ".actStudyAbList", actStudyAb);
	}
	
	// actStudyAbDetail
	public ActStudyAb actStudyAbDetail(ActStudyAb actStudyAb){
		return sqlSession.selectOne(NS + ".actStudyAbDetail", actStudyAb);
	}
}