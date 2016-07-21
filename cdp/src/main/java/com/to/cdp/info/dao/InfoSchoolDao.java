package com.to.cdp.info.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.info.model.InfoSchool;

@Repository
public class InfoSchoolDao {
	private final String NS="com.to.cdp.repository.CdpMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// InfoSchoolInsert
	public int infoSchoolInsert(InfoSchool infoSchool){
		return sqlSession.insert(NS + ".infoSchoolInsert", infoSchool);
	}
	
	// InfoSchoolUpdate
	public int infoSchoolUpdate(InfoSchool infoSchool){
		return sqlSession.update(NS + ".infoSchoolUpdate", infoSchool);
	}
	
	// InfoSchoolDelete
	public int infoSchoolDelete(InfoSchool infoSchool){
		return sqlSession.delete(NS + ".infoSchoolDelete", infoSchool);
	}
	
	// InfoSchoolList
	public List<InfoSchool> infoSchoolList(Map<String, Object> map){
		return sqlSession.selectList(NS + ".infoSchoolList", map);
	}
	
	// InfoSchoolDetail
	public InfoSchool infoSchoolDetail(InfoSchool infoSchool){
		return sqlSession.selectOne(NS + ".infoSchoolDetail", infoSchool);
	}

	//infoSchoolCountBySearch
	public int infoSchoolCountBySearch(Map<String, Object> map) {
		return sqlSession.selectOne(NS + ".infoSchoolCountBySearch", map);
	}

	// infoSchoolCount(µî·Ï¿ë)
	public int infoSchoolCount() {
		return sqlSession.selectOne(NS + ".infoSchoolCount");
	}
}