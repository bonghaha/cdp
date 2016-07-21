package com.to.cdp.rec.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.rec.model.RecSchool;



@Repository
public class RecSchoolDao {
	private final String NS="com.to.cdp.repository.CdpMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// recSchoolInsert
	public int recSchoolInsert(RecSchool recSchool){
		return sqlSession.insert(NS + ".recSchoolInsert", recSchool);
	}
	
	// recSchoolUpdate
	public int recSchoolUpdate(RecSchool recSchool){
		return sqlSession.update(NS + ".recSchoolUpdate", recSchool);
	}
	
	// recSchoolDelete
	public int recSchoolDelete(RecSchool recSchool){
		return sqlSession.delete(NS + ".recSchoolDelete", recSchool);
	}
	
	// recSchoolList
	public List<RecSchool> recSchoolList(RecSchool recSchool){
		return sqlSession.selectList(NS + ".recSchoolList", recSchool);
	}
	
	// recSchoolDetail
	public RecSchool recSchoolDetail(RecSchool recSchool){
		return sqlSession.selectOne(NS + ".recSchoolDetail", recSchool);
	}
}