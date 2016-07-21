package com.to.cdp.act.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.act.model.ActSchool;

@Repository
public class ActSchoolDao {
	private final String NS="com.to.cdp.repository.CdpMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// actSchoolInsert
	public int actSchoolInsert(ActSchool actSchool){
		return sqlSession.insert(NS + ".actSchoolInsert", actSchool);
	}
	
	// actSchoolUpdate
	public int actSchoolUpdate(ActSchool actSchool){
		return sqlSession.update(NS + ".actSchoolUpdate", actSchool);
	}
	
	// actSchoolDelete
	public int actSchoolDelete(ActSchool actSchool){
		return sqlSession.delete(NS + ".actSchoolDelete", actSchool);
	}
	
	// actSchoolList
	public List<ActSchool> actSchoolList(ActSchool actSchool){
		return sqlSession.selectList(NS + ".actSchoolList", actSchool);
	}
	
	// actSchoolDetail
	public ActSchool actSchoolDetail(ActSchool actSchool){
		return sqlSession.selectOne(NS + ".actSchoolDetail", actSchool);
	}
}