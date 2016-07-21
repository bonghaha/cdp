package com.to.cdp.act.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.act.model.ActMento;

@Repository
public class ActMentoDao {
	private final String NS="com.to.cdp.repository.CdpMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// actMentoInsert
	public int actMentoInsert(ActMento actMento){
		return sqlSession.insert(NS + ".actMentoInsert", actMento);
	}
	
	// actMentoUpdate
	public int actMentoUpdate(ActMento actMento){
		return sqlSession.update(NS + ".actMentoUpdate", actMento);
	}
	
	// actMentoDelete
	public int actMentoDelete(ActMento actMento){
		return sqlSession.delete(NS + ".actMentoDelete", actMento);
	}
	
	// actMentoList
	public List<ActMento> actMentoList(ActMento actMento){
		return sqlSession.selectList(NS + ".actMentoList", actMento);
	}
	
	// actMentoDetail
	public ActMento actMentoDetail(ActMento actMento){
		return sqlSession.selectOne(NS + ".actMentoDetail", actMento);
	}
}