package com.to.cdp.act.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.act.model.ActVolun;

@Repository
public class ActVolunDao {
	private final String NS="com.to.cdp.repository.CdpMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// actVolunInsert
	public int actVolunInsert(ActVolun actVolun){
		return sqlSession.insert(NS + ".actVolunInsert", actVolun);
	}
	
	// actVolunUpdate
	public int actVolunUpdate(ActVolun actVolun){
		return sqlSession.update(NS + ".actVolunUpdate", actVolun);
	}
	
	// actVolunDelete
	public int actVolunDelete(ActVolun actVolun){
		return sqlSession.delete(NS + ".actVolunDelete", actVolun);
	}
	
	// actVolunList
	public List<ActVolun> actVolunList(ActVolun actVolun){
		return sqlSession.selectList(NS + ".actVolunList", actVolun);
	}
	
	// actVolunDetail
	public ActVolun actVolunDetail(ActVolun actVolun){
		return sqlSession.selectOne(NS + ".actVolunDetail", actVolun);
	}
}