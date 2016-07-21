package com.to.cdp.info.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.info.model.InfoLang;

@Repository
public class InfoLangDao {
	private final String NS="com.to.cdp.repository.CdpMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// InfoLangInsert
	public int infoLangInsert(InfoLang infoLang){
		return sqlSession.insert(NS + ".infoLangInsert", infoLang);
	}
	
	// InfoLangUpdate
	public int infoLangUpdate(InfoLang infoLang){
		return sqlSession.update(NS + ".infoLangUpdate", infoLang);
	}
	
	// InfoLangDelete
	public int infoLangDelete(InfoLang infoLang){
		return sqlSession.delete(NS + ".infoLangDelete", infoLang);
	}
	
	// InfoJobTCount
	public int infoLangCount(){
		return sqlSession.selectOne(NS + ".infoLangCount");
	}

	//infoLangCount
	public int infoLangCountBySearch(Map<String, Object> map) {
		return sqlSession.selectOne(NS + ".infoLangCountBySearch", map);
	}
		
	// InfoLangList
	public List<InfoLang> infoLangList(Map<String, Object> map){
		return sqlSession.selectList(NS + ".infoLangList", map);
	}
	
	// InfoLangDetail
	public InfoLang infoLangDetail(InfoLang infoLang){
		return sqlSession.selectOne(NS + ".infoLangDetail", infoLang);
	}
}