package com.to.cdp.info.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.info.model.InfoJobT;

@Repository
public class InfoJobTDao {
	private final String NS="com.to.cdp.repository.CdpMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// InfoJobTInsert
	public int infoJobTInsert(InfoJobT infoJobT){
		return sqlSession.insert(NS + ".infoJobTInsert", infoJobT);
	}
	
	// InfoJobTUpdate
	public int infoJobTUpdate(InfoJobT infoJobT){
		return sqlSession.update(NS + ".InfoJobTUpdate", infoJobT);
	}
	
	// InfoJobTDelete
	public int infoJobTDelete(InfoJobT infoJobT){
		return sqlSession.delete(NS + ".InfoJobTDelete", infoJobT);
	}
	
	// InfoJobTCount
	public int infoJobTCount(){
		return sqlSession.selectOne(NS + ".infoJobTCount");
	}
	
	// InfoJobTCount
	public int infoJobTCountBySearch(Map<String, Object> map) {
		return sqlSession.selectOne(NS + ".infoJobTCountBySearch", map);
	}
	
	// InfoJobTList
	public List<InfoJobT> infoJobTList(Map<String, Object> map){
		return sqlSession.selectList(NS + ".infoJobTList", map);
	}
	
	// InfoJobTDetail
	public InfoJobT infoJobTDetail(InfoJobT infoJobT){
		return sqlSession.selectOne(NS + ".infoJobTDetail", infoJobT);
	}
}