package com.to.cdp.act.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.act.model.ActDept;

@Repository
public class ActDeptDao {
	private final String NS="com.to.cdp.repository.CdpMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// actDeptInsert
	public int actDeptInsert(ActDept actDept){
		return sqlSession.insert(NS + ".actDeptInsert", actDept);
	}
	
	// actDeptUpdate
	public int actDeptUpdate(ActDept actDept){
		return sqlSession.update(NS + ".actDeptUpdate", actDept);
	}
	
	// actDeptDelete
	public int actDeptDelete(ActDept actDept){
		return sqlSession.delete(NS + ".actDeptDelete", actDept);
	}
	
	// actDeptList
	public List<ActDept> actDeptList(ActDept actDept){
		return sqlSession.selectList(NS + ".actDeptList", actDept);
	}
	
	// actDeptDetail
	public ActDept actDeptDetail(ActDept actDept){
		return sqlSession.selectOne(NS + ".actDeptDetail", actDept);
	}
}