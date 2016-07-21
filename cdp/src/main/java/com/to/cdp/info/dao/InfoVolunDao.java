package com.to.cdp.info.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.info.model.InfoVolun;

@Repository
public class InfoVolunDao {
	private final String NS="com.to.cdp.repository.CdpMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// InfoVolunInsert
	public int infoVolunInsert(InfoVolun infoVolun){
		return sqlSession.insert(NS + ".infoVolunInsert", infoVolun);
	}
	
	// InfoVolunUpdate
	public int infoVolunUpdate(InfoVolun infoVolun){
		return sqlSession.update(NS + ".infoVolunUpdate", infoVolun);
	}
	
	// InfoVolunDelete
	public int infoVolunDelete(InfoVolun infoVolun){
		return sqlSession.delete(NS + ".infoVolunDelete", infoVolun);
	}
	
	// InfoVolunList
	public List<InfoVolun> infoVolunList(Map<String, Object> map){
		return sqlSession.selectList(NS + ".infoVolunList", map);
	}
	
	// InfoVolunDetail
	public InfoVolun infoVolunDetail(InfoVolun infoVolun){
		return sqlSession.selectOne(NS + ".infoVolunDetail", infoVolun);
	}

	public int infoVolunCount() {
		return sqlSession.selectOne(NS + ".infoVolunCount");
	}

	public int infoVolunCountBySearch(Map<String, Object> map) {
		return sqlSession.selectOne(NS + ".infoVolunCountBySearch", map);
	}
}