package com.to.cdp.info.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.info.model.InfoStudyAb;

@Repository
public class InfoStudyAbDao {
	private final String NS="com.to.cdp.repository.CdpMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// InfoStudyAbInsert
	public int infoStudyAbInsert(InfoStudyAb infoStudyAb){
		return sqlSession.insert(NS + ".infoStudyAbInsert", infoStudyAb);
	}
	
	// InfoStudyAbUpdate
	public int infoStudyAbUpdate(InfoStudyAb infoStudyAb){
		return sqlSession.update(NS + ".InfoStudyAbUpdate", infoStudyAb);
	}
	
	// InfoStudyAbDelete
	public int infoStudyAbDelete(InfoStudyAb infoStudyAb){
		return sqlSession.delete(NS + ".InfoStudyAbDelete", infoStudyAb);
	}
	
	// InfoJobTCount
	public int infoStudyAbCount(){
		return sqlSession.selectOne(NS + ".infoStudyAbCount");
	}
	
	//infoStudyAbCount
	public int infoStudyAbCountBySearch(Map<String, Object> map) {
		return sqlSession.selectOne(NS + ".infoStudyAbCountBySearch", map);
	}
	// InfoStudyAbList
	public List<InfoStudyAb> infoStudyAbList(Map<String, Object> map){
		return sqlSession.selectList(NS + ".infoStudyAbList", map);
	}
	
	// InfoStudyAbDetail
	public InfoStudyAb infoStudyAbDetail(InfoStudyAb infoStudyAb){
		return sqlSession.selectOne(NS + ".infoStudyAbDetail", infoStudyAb);
	}
}