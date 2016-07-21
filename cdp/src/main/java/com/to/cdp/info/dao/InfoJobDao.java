package com.to.cdp.info.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.info.model.InfoJob;

@Repository
public class InfoJobDao {
	private final String NS="com.to.cdp.repository.CdpMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// InfoJobInsert
	public int infoJobInsert(InfoJob infoJob){
		return sqlSession.insert(NS + ".infoJobInsert", infoJob);
	}
	
	// InfoJobUpdate
	public int infoJobUpdate(InfoJob infoJob){
		return sqlSession.update(NS + ".infoJobUpdate", infoJob);
	}
	
	// InfoJobDelete
	public int infoJobDelete(InfoJob infoJob){
		return sqlSession.delete(NS + ".infoJobDelete", infoJob);
	}
	
	//infoJobCount
	public int infoJobCountBySearch(Map<String, Object> map) {
		return sqlSession.selectOne(NS + ".infoJobCount");
	}
	
	// infoJobCount
	public int infoJobCount(){
		return sqlSession.selectOne(NS + ".infoJobCount");
	}
	
	// InfoJobList
	public List<InfoJob> infoJobList(Map<String, Object> map){
		return sqlSession.selectList(NS + ".infoJobList", map);
	}
	
	// InfoJobDetail
	public InfoJob infoJobDetail(InfoJob infoJob){
		return sqlSession.selectOne(NS + ".infoJobDetail", infoJob);
	}
}